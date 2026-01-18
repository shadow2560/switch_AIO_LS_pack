#!/bin/bash
# Script by Shadow256

# ----------------------------
# Helpers
# ----------------------------
lower() { printf '%s' "$1" | tr '[:upper:]' '[:lower:]'; }

pause() {
  read -n1 -r -p "Appuyer sur une touche pour continuer..." key
  echo
}

die() {
  echo "$1"
  pause
  exit 1
}

delete_if_exists() {
  if [ -e "$1" ]; then
    if [ -d "$1" ]; then
      rm -rf -- "$1"
    else
      rm -f -- "$1"
    fi
  fi
}

read_index() {
  # $1 = max
  max="$1"
  read -r idx
  if ! printf '%s' "$idx" | grep -Eq '^[0-9]+$'; then
    return 1
  fi
  if [ "$idx" -lt 1 ] || [ "$idx" -gt "$max" ]; then
    return 1
  fi
  printf '%s' "$idx"
  return 0
}

guard_mountpoint() {
  mp="$1"

  # Refuser les chemins vides ou "racines"
  case "$mp" in
    ""|"/"|"/Volumes"|"/Volumes/"|"/media"|"/media/"|"/mnt"|"/mnt/"|"/run"|"/run/" )
      die "Point de montage dangereux/refusé: '$mp'"
      ;;
  esac

  # Refuser si ce n'est pas un dossier
  [ -d "$mp" ] || die "Point de montage invalide (dossier absent): '$mp'"

  # Refuser si le dossier ne semble pas être un point de montage (heuristique)
  # Linux: mountpoint -q existe souvent; macOS: mount | grep " on $mp "
  if command -v mountpoint >/dev/null 2>&1; then
    mountpoint -q "$mp" 2>/dev/null || echo "Avertissement: '$mp' ne semble pas être un point de montage (continuer si c'est attendu)."
  else
    # fallback léger
    mount | grep -F " on $mp " >/dev/null 2>&1 || echo "Avertissement: '$mp' non détecté comme point de montage via 'mount' (continuer si c'est attendu)."
  fi
}

# ----------------------------
# Safety validations (eliminate target mistakes)
# ----------------------------
assert_partition_belongs_to_disk() {
  # Vérifie que $selected_part appartient à $selected_disk
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # PKNAME = parent kernel name (ex: sdb pour /dev/sdb1, mmcblk0 pour /dev/mmcblk0p1)
    pk=$(lsblk -no PKNAME "$selected_part" 2>/dev/null | head -n 1)
    [ -n "$pk" ] || die "Impossible de déterminer le disque parent de $selected_part."
    parent="/dev/$pk"
    if [ "$parent" != "$selected_disk" ]; then
      die "Sécurité: la partition $selected_part n'appartient pas au disque sélectionné ($selected_disk)."
    fi
  else
    # macOS: /dev/disk2 -> /dev/disk2s1, /dev/disk2s2, etc.
    base="$(basename "$selected_disk")"  # disk2
    case "$selected_part" in
      "/dev/${base}s"*) : ;;
      *) die "Sécurité: la partition $selected_part n'appartient pas au disque sélectionné ($selected_disk)." ;;
    esac
  fi
}
assert_mountpoint_matches_partition() {
  # Vérifie que $volume_root correspond bien à $selected_part
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    command -v findmnt >/dev/null 2>&1 || die "findmnt requis pour valider le montage (paquet util-linux)."
    src=$(findmnt -no SOURCE --target "$volume_root" 2>/dev/null | head -n 1)
    [ -n "$src" ] || die "Impossible de déterminer la source du montage pour $volume_root."
    if [ "$src" != "$selected_part" ]; then
      die "Sécurité: le point de montage $volume_root correspond à $src, pas à $selected_part."
    fi
  else
    # macOS: diskutil info <mountpoint> donne Device Node
    devnode=$(diskutil info "$volume_root" 2>/dev/null | awk -F: '/Device Node/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
    [ -n "$devnode" ] || die "Impossible de déterminer le Device Node pour $volume_root."
    if [ "$devnode" != "$selected_part" ]; then
      die "Sécurité: le point de montage $volume_root correspond à $devnode, pas à $selected_part."
    fi
  fi
}
assert_mountpoint_is_writable() {
  # Check mount options / read-only flags + practical write test
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    command -v findmnt >/dev/null 2>&1 || die "findmnt requis pour valider les options de montage (paquet util-linux)."
    opts=$(findmnt -no OPTIONS --target "$volume_root" 2>/dev/null | head -n 1)
    [ -n "$opts" ] || die "Impossible de lire les options de montage pour $volume_root."
    # If explicitly ro => refuse
    if printf '%s' "$opts" | grep -Eq '(^|,)ro(,|$)'; then
      die "Sécurité: le volume est monté en lecture seule (ro): $volume_root"
    fi
  else
    # macOS: check "Read-Only Volume" if present
    rovol=$(diskutil info "$volume_root" 2>/dev/null | awk -F: '/Read-Only Volume/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
    if [ -n "$rovol" ] && [ "$(lower "$rovol")" = "yes" ]; then
      die "Sécurité: le volume est en lecture seule: $volume_root"
    fi
    # Also check media read-only if present
    romedia=$(diskutil info "$selected_part" 2>/dev/null | awk -F: '/Read-Only Media/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
    if [ -n "$romedia" ] && [ "$(lower "$romedia")" = "yes" ]; then
      die "Sécurité: le média est en lecture seule: $selected_part"
    fi
  fi

  # Practical write test (authoritative)
  testfile="$volume_root/.sd_clean_test_$$"
  ( : > "$testfile" ) 2>/dev/null || die "Sécurité: impossible d'écrire sur $volume_root (lecture seule ou permissions insuffisantes)."
  rm -f -- "$testfile" 2>/dev/null || die "Sécurité: échec suppression du fichier test sur $volume_root (problème permissions)."
}

confirm_dangerous_action() {
  echo
  echo "ATTENTION: vous allez supprimer des fichiers sur la partition sélectionnée."
  echo "Récapitulatif:"
  echo "  Disque     : $selected_disk"
  echo "  Partition  : $selected_part"
  echo "  Montage    : $volume_root"
  echo
  read -p "Souhaitez-vous continuer? (o/n): " confirm
  if [ "$(lower "$confirm")" != "o" ]; then
    die "Confirmation non fournie. Annulation."
  fi
}

echo "Nettoyage de la SD avant installation du pack Switch_AIO_LS_pack"
echo
command -v awk >/dev/null 2>&1 || die "awk est requis."
command -v sed >/dev/null 2>&1 || die "sed est requis."
command -v grep >/dev/null 2>&1 || die "grep est requis."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  command -v lsblk >/dev/null 2>&1 || die "lsblk (package util-linux) est requis."
  command -v findmnt >/dev/null 2>&1 || die "findmnt (package util-linux) est requis."
  command -v udisksctl >/dev/null 2>&1 || die "udisksctl (package udisks2) est requis."
elif [[ "$OSTYPE" == "darwin"* ]]; then
  command -v diskutil >/dev/null 2>&1 || die "diskutil est requis (normalement présent sur macOS)."
else
  die "Système non supporté: $OSTYPE"
fi

# ----------------------------
# Step 1: list removable/external disks
# ----------------------------
sd_disks=()
sd_disks_desc=()

list_removable_disks() {
  sd_disks=()
  sd_disks_desc=()

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Removable disks: RM=1, TYPE=disk
    while IFS= read -r line; do
      name=$(printf '%s' "$line" | awk '{print $1}')
      size=$(printf '%s' "$line" | awk '{print $2}')
      rmflag=$(printf '%s' "$line" | awk '{print $3}')
      type=$(printf '%s' "$line" | awk '{print $4}')
      model=$(printf '%s' "$line" | cut -d' ' -f5-)

      [ "$type" = "disk" ] || continue
      [ "$rmflag" = "1" ] || continue

      disk="/dev/$name"
      sd_disks+=("$disk")
      if [ -n "$model" ]; then
        sd_disks_desc+=("$size - $model")
      else
        sd_disks_desc+=("$size")
      fi
    done < <(lsblk -ndo NAME,SIZE,RM,TYPE,MODEL 2>/dev/null)

  elif [[ "$OSTYPE" == "darwin"* ]]; then
    while IFS= read -r disk; do
      sd_disks+=("$disk")
      size=$(diskutil info "$disk" 2>/dev/null | awk -F: '/Disk Size/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
      proto=$(diskutil info "$disk" 2>/dev/null | awk -F: '/Protocol/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
      [ -z "$size" ] && size="(taille inconnue)"
      [ -z "$proto" ] && proto="(proto ?)"
      sd_disks_desc+=("$size - $proto")
    done < <(diskutil list external physical 2>/dev/null | awk '/^\/dev\/disk[0-9]+/ {print $1}')

  else
    die "Système non pris en charge."
  fi

  [ "${#sd_disks[@]}" -gt 0 ] || die "Aucun disque amovible/externe détecté."
}

select_disk_from_list() {
  list_removable_disks
  echo "Disques amovibles/externe détectés :"
  i=1
  while [ $i -le "${#sd_disks[@]}" ]; do
    disk="${sd_disks[$((i-1))]}"
    desc="${sd_disks_desc[$((i-1))]}"
    echo "  [$i] $disk - $desc"
    i=$((i+1))
  done

  echo "Sélectionnez le numéro du disque à utiliser :"
  idx=$(read_index "${#sd_disks[@]}") || die "Choix invalide."
  selected_disk="${sd_disks[$((idx-1))]}"
  echo "Disque sélectionné : $selected_disk"
}

# ----------------------------
# Step 2: list eligible partitions FAT32/exFAT on selected disk
# ----------------------------
eligible_parts=()       # entries: "part|fstype|size|mountpoint"
eligible_parts_display=()

linux_list_eligible_parts() {
  disk="$1"
  eligible_parts=()
  eligible_parts_display=()

  while IFS= read -r line; do
    name=$(printf '%s' "$line" | awk '{print $1}')
    type=$(printf '%s' "$line" | awk '{print $2}')
    fstype=$(printf '%s' "$line" | awk '{print $3}')
    size=$(printf '%s' "$line" | awk '{print $4}')
    mp=$(printf '%s' "$line" | awk '{print $5}')

    [ "$type" = "part" ] || continue

    fsl=$(lower "$fstype")
    if [ "$fsl" = "vfat" ] || [ "$fsl" = "exfat" ]; then
      part="/dev/$name"
      eligible_parts+=("$part|$fstype|$size|$mp")
      [ -n "$mp" ] && mpd="$mp" || mpd="(non montée)"
      eligible_parts_display+=("$part - $fstype - $size - $mpd")
    fi
  done < <(lsblk -rno NAME,TYPE,FSTYPE,SIZE,MOUNTPOINT "$disk" 2>/dev/null)
}

mac_list_eligible_parts() {
  disk="$1"
  eligible_parts=()
  eligible_parts_display=()

  mapfile -t parts < <(diskutil list "$disk" 2>/dev/null | awk -v base="$(basename "$disk")" '
    $0 ~ base"s"[0-9]+ {
      for(i=1;i<=NF;i++){
        if($i ~ base"s"[0-9]+) print "/dev/"$i
      }
    }' | sort -u)

  for p in "${parts[@]}"; do
    fs=$(diskutil info "$p" 2>/dev/null | awk -F: '/File System Personality/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
    [ -z "$fs" ] && continue

    fsl=$(lower "$fs")

    # Only ExFAT or FAT32 (MS-DOS FAT32)
    if [[ "$fsl" == *"exfat"* ]] || [[ "$fsl" == *"ms-dos"* ]] || [[ "$fsl" == *"fat32"* ]]; then
      size=$(diskutil info "$p" 2>/dev/null | awk -F: '/Disk Size/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
      mp=$(diskutil info "$p" 2>/dev/null | awk -F: '/Mount Point/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
      [ "$mp" = "Not mounted" ] && mp=""
      eligible_parts+=("$p|$fs|$size|$mp")
      [ -n "$mp" ] && mpd="$mp" || mpd="(non montée)"
      eligible_parts_display+=("$p - $fs - $size - $mpd")
    fi
  done
}

select_partition_from_list() {
  echo
  echo "Recherche des partitions FAT32/EXFAT sur $selected_disk ..."

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linux_list_eligible_parts "$selected_disk"
  else
    mac_list_eligible_parts "$selected_disk"
  fi

  [ "${#eligible_parts[@]}" -gt 0 ] || die "Aucune partition FAT32/EXFAT trouvée sur $selected_disk."

  echo "Partitions compatibles détectées :"
  i=1
  while [ $i -le "${#eligible_parts_display[@]}" ]; do
    echo "  [$i] ${eligible_parts_display[$((i-1))]}"
    i=$((i+1))
  done

  echo "Sélectionnez le numéro de la partition à utiliser :"
  idx=$(read_index "${#eligible_parts[@]}") || die "Choix invalide."
  chosen="${eligible_parts[$((idx-1))]}"
  selected_part="${chosen%%|*}"
  echo "Partition sélectionnée : $selected_part"
}

# ----------------------------
# Step 3: mount selected partition if needed and get mountpoint
# ----------------------------
linux_mount_partition_if_needed() {
  part="$1"
  mp=$(lsblk -rno MOUNTPOINT "$part" 2>/dev/null | head -n 1)
  if [ -n "$mp" ]; then
    printf '%s' "$mp"
    return 0
  fi

  out=$(udisksctl mount -b "$part" 2>&1) || die "Échec du montage: $out"
  mp=$(printf '%s' "$out" | sed -n 's/.* at \(.*\)\.$/\1/p')
  [ -n "$mp" ] || die "Montage effectué mais point de montage introuvable. Sortie: $out"
  printf '%s' "$mp"
}

mac_mount_partition_if_needed() {
  part="$1"
  mp=$(diskutil info "$part" 2>/dev/null | awk -F: '/Mount Point/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
  if [ -n "$mp" ] && [ "$mp" != "Not mounted" ]; then
    printf '%s' "$mp"
    return 0
  fi

  diskutil mount "$part" >/dev/null 2>&1 || die "Échec du montage de $part via diskutil."
  mp=$(diskutil info "$part" 2>/dev/null | awk -F: '/Mount Point/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')
  [ -n "$mp" ] && [ "$mp" != "Not mounted" ] || die "Montage effectué mais point de montage introuvable pour $part."
  printf '%s' "$mp"
}

mount_and_set_volume_root() {
  echo
  echo "Montage de la partition si nécessaire..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    volume_root=$(linux_mount_partition_if_needed "$selected_part")
  else
    volume_root=$(mac_mount_partition_if_needed "$selected_part")
  fi

  guard_mountpoint "$volume_root"
  # Validations anti-erreur de cible
  assert_partition_belongs_to_disk
  assert_mountpoint_matches_partition
  assert_mountpoint_is_writable
  echo "Point de montage : $volume_root"
}

# ----------------------------
# Workflow
# ----------------------------
select_disk_from_list
select_partition_from_list
mount_and_set_volume_root

# Confirmation forte avant suppression
confirm_dangerous_action

echo
echo "Nettoyage du volume : $volume_root"
echo

# ----------------------------
# Migration Atmosphere titles -> contents
# ----------------------------
if [ -d "$volume_root/atmosphere/titles" ]; then
  if [ -d "$volume_root/atmosphere/contents" ]; then
    mv "$volume_root/atmosphere/titles"/* "$volume_root/atmosphere/contents"/ 2>/dev/null
    rmdir "$volume_root/atmosphere/titles" 2>/dev/null
  else
    rm -rf "$volume_root/atmosphere/titles"
  fi
fi

delete_if_exists "$volume_root/atmosphere/contents/010000000000000D"
delete_if_exists "$volume_root/atmosphere/contents/010000000000002B"
delete_if_exists "$volume_root/atmosphere/contents/010000000000003C"
delete_if_exists "$volume_root/atmosphere/contents/0100000000000008"
delete_if_exists "$volume_root/atmosphere/contents/0100000000000032"
delete_if_exists "$volume_root/atmosphere/contents/0100000000000034"
delete_if_exists "$volume_root/atmosphere/contents/0100000000000036"
delete_if_exists "$volume_root/atmosphere/contents/0100000000000037"
delete_if_exists "$volume_root/atmosphere/contents/0100000000000042"
delete_if_exists "$volume_root/atmosphere/kip_patches"
delete_if_exists "$volume_root/atmosphere/exefs_patches/es_patches"
delete_if_exists "$volume_root/atmosphere/exefs_patches/nfim_ctest"
delete_if_exists "$volume_root/bootloader/patches.ini"
delete_if_exists "$volume_root/nettoyage_sd.bat"
delete_if_exists "$volume_root/atmosphere/BCT.ini"
delete_if_exists "$volume_root/atmosphere/loader.ini"
delete_if_exists "$volume_root/atmosphere/system_settings.ini"
delete_if_exists "$volume_root/atmosphere/hekate_kips/loader.kip"
delete_if_exists "$volume_root/sep/sep-secondary.enc"
delete_if_exists "$volume_root/sep/ams/sep-secondary.enc"
delete_if_exists "$volume_root/switch/atmosphere-updater"
delete_if_exists "$volume_root/switch/sigpatch-updater"
delete_if_exists "$volume_root/switch/sigpatches-updater"
delete_if_exists "$volume_root/switch/DeepSea-Toolbox"
delete_if_exists "$volume_root/switch/GagOrder.nro"
delete_if_exists "$volume_root/switch/appstore/res"
delete_if_exists "$volume_root/BCT.ini"
delete_if_exists "$volume_root/fusee-secondary.bin"
delete_if_exists "$volume_root/bootlogo.bmp"
delete_if_exists "$volume_root/hekate_ipl.ini"
delete_if_exists "$volume_root/switch/CFWSettings"
delete_if_exists "$volume_root/switch/CFW-Settings"
delete_if_exists "$volume_root/modules/atmosphere/fs_mitm.kip"
delete_if_exists "$volume_root/atmosphere/titles/010000000000100D"
delete_if_exists "$volume_root/atmosphere/fusee-mtc.bin"
delete_if_exists "$volume_root/atmosphere/kip_patches/default_nogc"
delete_if_exists "$volume_root/atmosphere/config/BCT.ini"
delete_if_exists "$volume_root/atmosphere/config_templates/BCT.ini"
delete_if_exists "$volume_root/atmosphere/fusee-secondary.bin"
delete_if_exists "$volume_root/atmosphere/flags/clean_stratosphere_for_0.19.0.flag"
delete_if_exists "$volume_root/Atmosphere_fusee-primary.bin"
delete_if_exists "$volume_root/switch/KosmosToolbox"
delete_if_exists "$volume_root/switch/KosmosUpdater"
delete_if_exists "$volume_root/switch/HekateToolbox"
delete_if_exists "$volume_root/bootloader/hekate_ipl.ini.old"
delete_if_exists "$volume_root/switch/DeepSea-Updater/DeepSeaUpdater.nro"
delete_if_exists "$volume_root/switch/ChoiDuJourNX"
delete_if_exists "$volume_root/switch/ChoiDuJourNX.nro"
delete_if_exists "$volume_root/nsp_forwaders"
delete_if_exists "$volume_root/readme.html"
delete_if_exists "$volume_root/readme.md"
delete_if_exists "$volume_root/bootloader/bootlogo.bmp"
delete_if_exists "$volume_root/nsp_forwarders/Tinfoil V14.nsp"
delete_if_exists "$volume_root/Firmware 14.1.2"
delete_if_exists "$volume_root/dernier_firmware_compatible"

read -p "Souhaitez-vous supprimer le thème du menu principal ? (o/n): " theme_delete
if [ "$(lower "$theme_delete")" = "o" ]; then
  delete_if_exists "$volume_root/atmosphere/contents/0100000000001000"
  delete_if_exists "$volume_root/atmosphere/contents/0100000000001013"
  delete_if_exists "$volume_root/atmosphere/contents/0100000000001007"
  delete_if_exists "$volume_root/atmosphere/contents/0100000000000811"
  delete_if_exists "$volume_root/atmosphere/contents/0100000000000039"
fi

read -p "Souhaitez-vous supprimer les modules d'Atmosphere ? (o/n): " modules_delete
if [ "$(lower "$modules_delete")" = "o" ]; then
  for dir in "$volume_root/atmosphere/contents/"*; do
    [ -d "$dir" ] || continue

    if [[ "$dir" != "$volume_root/atmosphere/contents/420000000007E51A" ]] && \
       [[ "$dir" != "$volume_root/atmosphere/contents/420000000000000B" ]]; then
      if [ -f "$dir/exefs.nsp" ]; then
        rm -rf "$dir"
      fi
    fi

    if [[ "$dir" == "$volume_root/atmosphere/contents/010000000000bd00" ]]; then
      rm -rf "$volume_root/atmosphere/exefs_patches/bluetooth_patches"
      rm -rf "$volume_root/atmosphere/exefs_patches/btm_patches"
    fi
  done

  delete_if_exists "$volume_root/atmosphere/kips"
  mkdir -p "$volume_root/atmosphere/kips"
fi

echo
echo "Nettoyage terminé, vous pouvez maintenant installer le pack Switch_AIO_LS_pack sur votre SD."
pause
exit 0
