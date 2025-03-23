#!/bin/bash
# Script by Shadow256

# Convertir l'encodage des fins de lignes du script si incorrecte (remplacer $0 par le chemin vers le script et retirer le # en début de ligne, ligne à exécuter dans le shell directement)
# sed -i 's/\r$//' "$0"

# Si erreur de permission à l'exécution du script exécuter cette ligne avant (remplacer $0 par le chemin du script et retirer le # en début de ligne, ligne à exécuter dans le shell directement) ou autoriser la permission d'exécution via les propriétés du fichier
# chmod +x "$0"

echo "Nettoyage de la SD avant installation du pack Switch_AIO_LS_pack"
echo

convert_to_gb() {
    size=$1
    # Si la taille est en Mo (avec suffixe 'M'), la convertir en Go
    if [[ "$size" =~ M$ ]]; then
        size_in_gb=$(echo "$size" | sed 's/M//')  # Retirer le 'M'
        size_in_gb=$(echo "scale=1; $size_in_gb / 1024" | bc)  # Conversion en Go
    # Si la taille est en Go (avec suffixe 'G'), on la garde telle quelle
    elif [[ "$size" =~ G$ ]]; then
        size_in_gb=$(echo "$size" | sed 's/G//')
    fi
    printf "%.1f" "$size_in_gb"
    # echo "$size_in_gb"
}

# Fonction pour lister et afficher les périphériques disponibles
list_sd_devices() {
    echo "Recherche des périphériques SD..."

    # Afficher les périphériques trouvés avec leurs tailles
    echo "Périphériques SD disponibles (Nom, Taille) :"
    sd_devices=()
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        while IFS= read -r line; do
            dev_name=$(echo "$line" | awk '{print $1}')
            dev_size=$(echo "$line" | awk '{print $2}')
            full_path="/dev/$dev_name"
            size_in_gb=$(convert_to_gb "$dev_size")
            sd_devices+=("$full_path")
            echo "$full_path - $size_in_gb G"
        done < <(lsblk -ndo NAME,SIZE | grep -E "mmcblk|sd")    
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        while IFS= read -r line; do
            dev_name=$(echo "$line" | awk '{print $1}')
            dev_size=$(echo "$line" | awk '{print $2}')
            full_path="$dev_name"
            size_in_gb=$(convert_to_gb "$dev_size")
            sd_devices+=("$full_path")
            echo "$full_path - $size_in_gb G"
        done < <(diskutil list | grep "/dev/disk" | awk '{print $1, $NF}')
    else
        echo "Système non pris en charge pour cette fonctionnalité."
        read -n1 -r -p "Appuyer sur une touche pour continuer..." key
        exit 1
    fi

    # while read -r device size; do
        # size_in_gb=$(convert_to_gb "$size")
        # echo "$device : $size_in_gb GB"
    # done <<< "$sd_devices"
}

# Fonction pour demander à l'utilisateur de sélectionner un périphérique SD
select_sd_device() {
    # Lister les périphériques SD disponibles
    list_sd_devices
    
    # Stocker les périphériques et leurs tailles dans un tableau
    # readarray -t available_devices <<< "$sd_devices"
    
    # Créer un tableau pour stocker uniquement les périphériques
    available_device_names=()
    for device in "${sd_devices[@]}"; do
        # Extraire uniquement le périphérique (sans la taille)
        available_device_names+=("$(echo $device | awk '{print $1}')")
    done

    echo "Entrez le périphérique SD à utiliser (par exemple /dev/sdX ou /dev/mmcblkX ou /dev/diskX): "
    read volume_letter

    if [[ ! -b "$volume_letter" ]]; then
        echo "Le périphérique $volume_letter n'existe pas ou est invalide."
        read -n1 -r -p "Appuyer sur une touche pour continuer..." key
        exit 1
    fi
    if [[ " ${available_device_names[@]} " =~ " $volume_letter " ]]; then
        echo "Vous avez sélectionné le périphérique : $volume_letter"
    else
        echo "Le périphérique sélectionné ($volume_letter) n'est pas valide."
        read -n1 -r -p "Appuyer sur une touche pour continuer..." key
        exit 1
    fi
}

select_sd_device

echo
echo "Nettoyage du lecteur $volume_letter"
echo

# Fonction pour supprimer un répertoire ou un fichier si il existe
delete_if_exists() {
  if [ -e "$1" ]; then
    if [ -d "$1" ]; then
      rm -rf "$1"
    else
      rm -f "$1"
    fi
  fi
}

# Nettoyage des répertoires et fichiers
if [ -d "$volume_path/atmosphere/titles" ]; then
    if [ -d "$volume_path/atmosphere/contents" ]; then
        mv "$volume_path/atmosphere/titles" "$volume_path/atmosphere/contents" 2>/dev/null
    else
        rm -rf "$volume_path/atmosphere/titles"
    fi
fi
delete_if_exists "$volume_letter/atmosphere/contents/010000000000000D"
delete_if_exists "$volume_letter/atmosphere/contents/010000000000002B"
delete_if_exists "$volume_letter/atmosphere/contents/010000000000003C"
delete_if_exists "$volume_letter/atmosphere/contents/0100000000000008"
delete_if_exists "$volume_letter/atmosphere/contents/0100000000000032"
delete_if_exists "$volume_letter/atmosphere/contents/0100000000000034"
delete_if_exists "$volume_letter/atmosphere/contents/0100000000000036"
delete_if_exists "$volume_letter/atmosphere/contents/0100000000000037"
delete_if_exists "$volume_letter/atmosphere/contents/0100000000000042"
delete_if_exists "$volume_letter/atmosphere/kip_patches"
delete_if_exists "$volume_letter/atmosphere/exefs_patches/es_patches"
delete_if_exists "$volume_letter/atmosphere/exefs_patches/nfim_ctest"
delete_if_exists "$volume_letter/bootloader/patches.ini"
delete_if_exists "$volume_letter/nettoyage_sd.bat"
delete_if_exists "$volume_letter/atmosphere/BCT.ini"
delete_if_exists "$volume_letter/atmosphere/loader.ini"
delete_if_exists "$volume_letter/atmosphere/system_settings.ini"
delete_if_exists "$volume_letter/atmosphere/hekate_kips/loader.kip"
delete_if_exists "$volume_letter/sep/sep-secondary.enc"
delete_if_exists "$volume_letter/sep/ams/sep-secondary.enc"
delete_if_exists "$volume_letter/switch/atmosphere-updater"
delete_if_exists "$volume_letter/switch/sigpatch-updater"
delete_if_exists "$volume_letter/switch/sigpatches-updater"
delete_if_exists "$volume_letter/switch/DeepSea-Toolbox"
delete_if_exists "$volume_letter/switch/GagOrder.nro"
delete_if_exists "$volume_letter/switch/appstore/res"
delete_if_exists "$volume_letter/BCT.ini"
delete_if_exists "$volume_letter/fusee-secondary.bin"
delete_if_exists "$volume_letter/bootlogo.bmp"
delete_if_exists "$volume_letter/hekate_ipl.ini"
delete_if_exists "$volume_letter/switch/CFWSettings"
delete_if_exists "$volume_letter/switch/CFW-Settings"
delete_if_exists "$volume_letter/modules/atmosphere/fs_mitm.kip"
delete_if_exists "$volume_letter/atmosphere/titles/010000000000100D"
delete_if_exists "$volume_letter/atmosphere/fusee-mtc.bin"
delete_if_exists "$volume_letter/atmosphere/kip_patches/default_nogc"
delete_if_exists "$volume_letter/atmosphere/config/BCT.ini"
delete_if_exists "$volume_letter/atmosphere/config_templates/BCT.ini"
delete_if_exists "$volume_letter/atmosphere/fusee-secondary.bin"
delete_if_exists "$volume_letter/atmosphere/flags/clean_stratosphere_for_0.19.0.flag"
delete_if_exists "$volume_letter/Atmosphere_fusee-primary.bin"
delete_if_exists "$volume_letter/switch/KosmosToolbox"
delete_if_exists "$volume_letter/switch/KosmosUpdater"
delete_if_exists "$volume_letter/switch/HekateToolbox"
delete_if_exists "$volume_letter/bootloader/hekate_ipl.ini.old"
delete_if_exists "$volume_letter/switch/DeepSea-Updater/DeepSeaUpdater.nro"
delete_if_exists "$volume_letter/switch/ChoiDuJourNX"
delete_if_exists "$volume_letter/switch/ChoiDuJourNX.nro"
delete_if_exists "$volume_letter/nsp_forwaders"
delete_if_exists "$volume_letter/readme.html"
delete_if_exists "$volume_letter/readme.md"
delete_if_exists "$volume_letter/bootloader/bootlogo.bmp"
delete_if_exists "$volume_letter/nsp_forwarders/Tinfoil V14.nsp"
delete_if_exists "$volume_letter/Firmware 14.1.2"
delete_if_exists "$volume_letter/dernier_firmware_compatible"

read -p "Souhaitez-vous supprimer le thème du menu principal ? (o/n): " theme_delete
if [[ "${theme_delete,,}" == "o" ]]; then
  delete_if_exists "$volume_letter/atmosphere/contents/0100000000001000"
  delete_if_exists "$volume_letter/atmosphere/contents/0100000000001013"
  delete_if_exists "$volume_letter/atmosphere/contents/0100000000001007"
  delete_if_exists "$volume_letter/atmosphere/contents/0100000000000811"
  delete_if_exists "$volume_letter/atmosphere/contents/0100000000000039"
fi

read -p "Souhaitez-vous supprimer les modules d'Atmosphere ? (o/n): " modules_delete
if [[ "${modules_delete,,}" == "o" ]]; then
  for dir in "$volume_letter/atmosphere/contents/"*; do
    if [[ "$dir" != "$volume_letter/atmosphere/contents/420000000007E51A" ]] && [[ "$dir" != "$volume_letter/atmosphere/contents/420000000000000B" ]]; then
      if [[ -f "$dir/exefs.nsp" ]]; then
        rm -rf "$dir"
      fi
    fi
    if [[ "$dir" == "$volume_letter/atmosphere/contents/010000000000bd00" ]]; then
      rm -rf "$volume_letter/atmosphere/exefs_patches/bluetooth_patches"
      rm -rf "$volume_letter/atmosphere/exefs_patches/btm_patches"
    fi
  done

  delete_if_exists "$volume_letter/atmosphere/kips"
  mkdir "$volume_letter/atmosphere/kips"
fi

echo "Nettoyage terminé, vous pouvez maintenant installer le pack Switch_AIO_LS_pack sur votre SD."
read -n1 -r -p "Appuyer sur une touche pour continuer..." key
exit 0