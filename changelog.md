<h1>Changelog du pack switch_AIO_LS_pack</h1>
&nbsp;
<h2>version 5.15.7B</h2>
&nbsp;
<ul>
<li>Mise à jour de Sys-patch.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.99.01 apportant les changements suivants:
<ul>
<li>La synchronisation de l'heure sera faite avant l'affichage du changelog, plus au démarrage du homebrew.</li>
<li>Correction de bugs dans l'affichage du changelog.</li>
</ul></li>
</ul>
&nbsp;
<h2>version 5.15.6B</h2>
&nbsp;
<ul>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.99.00 apportant les changements suivants:
<ul>
<li>Nouvelle fonction permettant de synchroniser l'heure de la console avec des serveurs distants au démarrage du homebrew.</li>
<li>Correction de bugs dans la fonction permettant d'afficher le dernier changelog du pack.</li>
<li>La connexion à internet est vérifiée avant de lancer les fonctions la nécessitant.</li>
</ul></li>
</ul>
&nbsp;
<h2>version 5.15.5B</h2>
&nbsp;
<ul>
<li>Passage aux outils basés sur Libultrahand pour lancer les overlays au lieu de Libtesla qui n'est plus mis à jour depuis un moment. De fait les raccourcis pour lancer le menu des overlays devient "ZL+ZR+croix directionnelle vers le bas".</li>
<li>Mise à jour de EdiZon-Overlay.</li>
<li>Mise à jour des crédits de la documentation.</li>
<li>Suppression des fichiers de configuration liés au menu des overlays basé sur Tesla.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.90.00 apportant les changements suivants:
<ul>
<li>Nouvelle fonction permettant d'afficher le dernier changelog du pack via le homebrew en appuyant sur "LS" sur le menu principal ou sur "X" lorsque cela est proposé durant la mise à jour du pack (lancement du homebrew hors mode applet et connexion à internet requis).</li>
</ul></li>
</ul>
&nbsp;
<h2>version 5.15.4B</h2>
&nbsp;
<ul>
<li>Mise à jour de Sys-patch.
</ul>
&nbsp;
<h2>version 5.15.3B</h2>
&nbsp;
<ul>
<li>Mise à jour de Sys-patch.
</ul>
&nbsp;
<h2>version 5.15.2B</h2>
&nbsp;
<ul>
<li>Mise à jour de Status-monitor-overlay.</li>
</ul>
&nbsp;
<h2>version 5.15.1B</h2>
&nbsp;
<ul>
<li>Mise à jour de JKSV.
</ul>
&nbsp;
<h2>Version 5.15.0</h2>
&nbsp;
<ul>
<li>Dernier firmware compatible mis à jour en version 19.0.1.</li>
<li>Mise à jour d'Atmosphere, de Hekate, de Sys-patch, de Lockpick-RCM, du module gérant les overlays, de Status-monitor-overlay et de JKSV vers la dernière version de ceux-ci.</li>
<li>La version de Sys-patch contient des fonctionnalités non présentes dans la version classique comme le nettoyage de son fichier de config, un patch "no_erpt" pour désactiver le module ERPT d'Atmosphere (à n'activer que si vous savez se que vous faites), un patch "debug_flag" permettant de rendre compatibles les anciens forwarders entre autres (peut cependant avoir des effets de bord comme l'impossibilité d'utiliser les cheats tant que ce patch est actif) et un patch "debug_flag_off" qui permet d'annuler le patch "debug_flag" (à activer, relancer le module puis désactiver le patch, sinon désactiver le patch "debug_flag" et redémarrer donnera le même effet). Les trois patches uniques sont désactivés par défaut.</li>
<li>Mise à jour des forwarders intégrés pour être compatible avec la dernière version d'Atmosphere, par contre ils deviennent incompatibles avec les anciennes versions de celui-ci.</li>
<li>Mise à jour des patches utilisés pour le logo de démarrage.</li>
<li>Mise à jour des patches utilisés pour les thèmes.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.80.12 apportant les changements suivants:
<ul>
<li>Le nettoyage des modules exclu les modules Sys-patch et le module de gestion des overlays.</li>
<li>Mise à jour des forwarders inclus pour qu'ils fonctionnent avec Atmosphere 1.8.0 mais ceci les rends incompatibles avec les versions inférieures d'Atmosphere.</li>
<li>Correction d'un bug durant l'installation du forwarder de l'application.</li>
<li>Correction de bugs dans la détection de versions.</li>
<li>Correction de potentiels bugs.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.14.0</h2>
&nbsp;
<ul>
<li>Mise à jour de Hekate, de Status-monitor-overlay, de JKSV et de Haku33 vers la dernière version de ceux-ci.</li>
<li>Compilation du homebrew AIO_LS_pack_Updater avec la dernière version de la Libnx et quelques mise à jour pour être compilé en C++23.</li>
</ul>
&nbsp;
<h2>Version 5.13.0</h2>
&nbsp;
<ul>
<li>Payload de Hekate mis à jour pour corriger des bugs importants.</li>
<li>Ajout du patch pour les thèmes pour le firmware 18.1.0.</li>
<li>Compilation du homebrew AIO_LS_pack_Updater avec la dernière version de la Libnx.</li>
</ul>
&nbsp;
<h2>Version 5.12.0</h2>
&nbsp;
<ul>
<li>Payloads de Hekate et d'Atmosphere mis à jour pour corriger des bugs importants.</li>
</ul>
&nbsp;
<h2>Version 5.11.0</h2>
&nbsp;
<ul>
<li>Dernier firmware compatible mis à jour en 18.1.0.</li>
<li>Mise à jour d'Atmosphere, de Hekate et de SimpleModDownloader vers la dernière version de ceux-ci.</li>
<li>Le module Sys-patch a été mis à jour pour fonctionner sur la dernière version d'Atmosphere car le module Loader de celui-ci a été modifié, entrainant un disfonctionnement des ldr_patches.</li>
</ul>
&nbsp;
<h2>Version 5.10.0</h2>
&nbsp;
<ul>
<li>Dernier firmware compatible mis à jour en 18.0.1.</li>
<li>Mise à jour de l'overlay de Sys-patch pour afficher l'état d'un patch qui ne s'affichait pas. Le module Sys-patch a aussi été modifié pour ne pas appliquer certains patches aux firmwares 18.0.0 et supérieurs.</li>
<li>Mise à jour de la documentation pour ajouter des informations sur l'utilité des dossiers et fichiers du pack.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.50.01 apportant les changements suivants:
<ul>
<li>Quelques changements mineures sans impacte pour l'utilisateur.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.9.0</h2>
&nbsp;
<ul>
<li>Dernier firmware compatible mis à jour en 18.0.0.</li>
<li>Bootlogo mis à jour pour fonctionner sur le firmware 18.0.0.</li>
<li>Patches pour les thèmes mis à jour pour le firmware 18.0.0.</li>
<li>Suppression de fichiers devenus inutiles, le script Windows de nettoyage se chargera aussi de les supprimer mais le homebrew AIO_LS_pack_Updater lui ne le fera pas, ceci n'est pas grave en soi.</li>
<li>Mise à jour d'Atmosphere, de Hekate, de Lockpick-RCM, de Sys-patch, de SimpleModDownloader et de Haku33 vers la dernière version de ceux-ci.</li>
<li>Changements dans les configurations de Hekate.</li>
<li>Mise à jour du script TegraExplorer servant de boîte à outils pour y corriger un petit bug dans la restauration d'un PRODINFO créé via ProdinfoGen.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.50.00 apportant les changements suivants:
<ul>
<li>Ajout de la possibilité de supprimer le contrôle parental.</li>
<li>Affichage du menu légèrement retravaillé.</li>
<li>Légères modifications des configs de Hekate intégrées au homebrew.</li>
<li>Quelques autres corrections mineures.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.8.0</h2>
&nbsp;
<ul>
<li>La suppression des modules via le script de nettoyage supprimera également se qui se trouve dans le dossier "atmosphere/kips".</li>
<li>Mise à jour de DBI, de Status-Monitor-Overlay et de NXMP vers la dernière version de ceux-ci.</li>
<li>Changement dans les configurations de AIO-Switch-Updater et de FastCFWSwitch.</li>
<li>Mise à jour des tutoriels.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.40.00 apportant les changements suivants:
<ul>
<li>Ajout d'une validation par l'utilisateur durant l'installation du pack, maintenant l'utilisateur doit confirmer qu'il utilise une SD formatée en FAT32 pour continuer. Attention, ceci n'est pas vérifié par le homebrew ensuite, cela sert plutôt d'avertissement.</li>
<li>La suppression des modules supprime également se qui se trouve dans le dossier "atmosphere/kips".</li>
<li>Correction de fautes dans les messages affichés.</li>
<li>Changements pour pouvoir compiler avec les dernières mises à jour de l'environnement de développement.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.7.0 - Frisco</h2>
&nbsp;
<ul>
<li>Dernier firmware compatible mis à jour en version 17.0.1.</li>
<li>Mise à jour de Haku33, de DBI, de Status-monitor-overlay, de AIO-switch-updater et de NXMP vers la dernière version de ceux-ci.</li>
</ul>
&nbsp;
<h2>Version 5.6.0</h2>
&nbsp;
<ul>
<li>Mise à jour d'Atmosphere, du Homebrew Loader et du Homebrew Menu, de DBI et de Haku33 vers la dernière version de ceux-ci.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.30.00 apportant les changements suivants:
<ul>
<li>Pour valider une réinitialisation de la console il faudra faire le combo de touches "L+R+LT+RT+A".</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.5.0</h2>
&nbsp;
<ul>
<li>Mise à jour du firmware inclue vers la version 17.0.0.</li>
<li>Mise à jour d'Atmosphere et de Sys-patch vers la dernière version de ceux-ci.</li>
<li>Suppression de Incognito-RCM, de PPlay et des overlays de SimpleModManager.</li>
<li>Mise à jour de la documentation.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.20.03 apportant les changements suivants:
<ul>
<li>Ajout d'une fonction permettant de réinitialiser la console (si exécution sur l'emunand cela réinitialisera l'emunand, si exécution sur la sysnand cela réinitialisera la sysnand).</li>
<li>Correction d'un bug de détection d'un modèle de console.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.4.0</h2>
&nbsp;
<ul>
<li>Mise à jour de Hekate, d'Atmosphere, de NXThemesInstaller, de NXMP, de Status-monitor-overlay, de Lockpick-RCM, de ma version de Incognito-RCM et de ma version de TegraExplorer vers la dernière version de ceux-ci.</li>
<li>Mise à jour des fichiers de patches pour NXThemesInstaller.</li>
<li>Mise à jour du logo Switch pour le futur firmware 17.0.0.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.20.01 apportant les changements suivants:
<ul>
<li>Correction d'un bug au niveau de la détection de mises à jour.</li>
<li>Ajout dune protection durant l'extraction du pack pour éviter que l'extraction ne soit tentée si le fichier dans le zip n'a pas de nom car cela pourrait supprimer le contenu de toute la SD.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.3.0</h2>
&nbsp;
<ul>
<li>Mise à jour du firmware inclue vers la version 16.1.0.</li>
<li>Ajout du homebrew SimpleModDownloader.</li>
<li>Mise à jour de Hekate, d'Atmosphere, de Goldleaf et de DBI vers la dernière version de ceux-ci.</li>
<li>Mise à jour des fichiers de patches pour NXThemesInstaller.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.20.00 apportant les changements suivants:
<ul>
<li>Certains petits fichiers utilisés par l'application sont téléchargés en mémoire plutôt que sur la SD, ceci augmente la vitesse de traitement et réduit l'usage de la SD.</li>
<li>Correction d'un bug qui faisait que l'installation du forwarder du homebrew était activée quoi qu'il arrive si l'installation du forwarder du Homebrew Menu était activée.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.2.0</h2>
&nbsp;
<ul>
<li>Mise à jour de AIO-Switch-Updater et de DBI vers la dernière version de ceux-ci.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.10.01 apportant les changements suivants:
<ul>
<li>Ajout de la possibilité d'installer un forwarder pour l'application, individuellement ou durant l'installation du pack (aussi configurable dans l'auto-configuration).</li>
<li>Une valeur non configurée dans le fichier d'auto-configuration est maintenant considérée comme étant non active au lieu d'annuler l'auto-configuration.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.1.1</h2>
&nbsp;
<ul>
<li>Mise à jour de l'overlay d'EdiZon vers la dernière version de celui-ci.</li>
<li>Le script de nettoyage de la SD supprime maintenant certains fichiers liés au module MissionControl si la suppression de module est choisi durant le nettoyage.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 6.00.00 apportant les changements suivants:
<ul>
<li>Nouvelle fonction d'auto-configuration ajoutée, celle-ci permet de lancer l'installation du pack avec une configuration des options pré-définie. Cette fonction est totalement contrôlable et configurable via le homebrew, voir le menu d'aide de celui-ci pour en savoir plus. Sinon ceci es configurable via un fichier de configuration du homebrew, voir les fichiers de configuration du homebrew sur la page du projet.</li>
<li>Détection d'une nouvelle version du pack disponible et affichage d'une notification pour lancer son installation. Si l'auto-configuration sans accès complet à toutes les fonctions du homebrew est activée, si aucune nouvelle version du pack n'est détectée l'installation du firmware seule sera proposée et si elle est refusée l'installation du pack sera proposée.</li>
<li>La détection d'une nouvelle version du homebrew fonctionne comme celle du pack, ceci pose un problème aux anciennes versions du homebrew qui ne détecteront pas automatiquement cette nouvelle version, cependant la mise à jour manuelle du homebrew fonctionne toujours et une fois celle-ci faite tout rentrera dans l'ordre.</li>
<li>Durant l'installation du pack et du zip complémentaire au pack le SHA256 de chaque fichier à extraire est comparé avant l'extraction si le fichier est présent sur la SD pour savoir s'il est nécessaire de le remplacer et après la copie pour savoir s'il a bien été extrait. Ceci augmente le temps nécessaire à l'extraction du pack mais augmente la durée de vie de la SD en copiant seulement se qui est nécessaire et cela augmente aussi la fiabilité de l'extraction. Ce paramètre peut être désactivé via les fichiers de configuration du homebrew, voir les fichiers de configuration sur la page du projet du homebrew.</li>
<li>Si une erreur se produit durant l'extraction d'un fichier pendant l'installation du pack et du zip complémentaire au pack la copie du fichier est réessayée deux fois avant de stopper l'installation.</li>
<li>Le nettoyage agressif n'est plus le même lorsqu'il concerne l'installation du pack ou du firmware, les noms des fichiers de configuration de cette fonction ont été mis à jour pour refléter ce changement.</li>
<li>Correction d'un bug qui ne détectait pas correctement le répertoire des bootlogos lors de l'extraction du pack en mode beta et correction d'un bug qui faisait que le répertoire du firmware n'était pas forcément nettoyé en mode beta.</li>
<li>Ajout d'informations dans le fichier de logs.</li>
<li>Certains changements mineurs dans les messages affichés ont été effectués.</li>
<li>Probablement des corrections de bugs et modifications mineurs que j'ai oublié.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.0.1</h2>
&nbsp;
<ul>
<li>Mise à jour du script de nettoyage de la SD pour mieux nettoyer les modules</li>
</ul>
&nbsp;
<h2>Version 5.0.0</h2>
&nbsp;
<ul>
<li>Mise à jour de Hekate vers la dernière version de celui-ci.</li>
<li>Changement mineur dans la configuration de Hekate, deux configurations ont été inversées pour être plus logiquement agencées.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 5.51.00 apportant les changements suivants:
<ul>
<li>La détection du type d'emunand (fichiers ou partition) a été désactivé car non fiable dans certains cas (lancement de l'emunand via une configuration spécifique dans Hekate qui peut intégrer des paramètres de l'emunand non inscrits dans le fichier "emummc/emummc.ini"), cependant le homebrew détecte toujours s'il est lancé sur une emunand ou sur la sysnand.</li>
<li>Un menu d'aide a été ajouté pour épurer le menu principal, il est accessible sur le menu principal en faisant un clique sur un des sticks.</li>
<li>Nouvelles fonctions permettant de redémarrer la console via un combo de touches sur le menu principal ("L+R" pour un redémarrage normal, "ZL+ZR" pour redémarrer sur le payload de l'application qui fait un léger nettoyage après l'installation du pack donc normalement cette option ne devrait pas être utilisée sauf si vous savez se que vous faites).</li>
<li>Nouvelles fonctions permettant d'activer/désactiver l'autoboot de Hekate sur une de ses configurations durant l'installation du pack ou via des combos de touches sur le menu principal ("L+ZL" pour le désactiver, "R+ZR" pour l'activer). En cas d'activation de l'autoboot vous pourrez choisir la configuration qui sera lancée par celui-ci.</li>
<li>Les téléchargements sont affichés comme ils auraient dû l'être depuis bien longtemps, des bugs impactant l'affichage sur ce point ont donc été corrigés.</li>
<li>L'affichage de la couleur du fond du menu en mode applet lorsque celui-ci passe en plein écran ou qu'il revient à la normal (l'affichage des infos de la console était impacté par ce bug) a été corrigé.</li>
<li>Les configurations de Hekate intégrées au homebrew ont été modifiées pour refléter les changements effectués dans le pack.</li>
<li>Certains changements mineurs dans les messages affichés ont été effectués.</li>
<li>Probablement des corrections de bugs et modifications mineurs que j'ai oublié.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.15.0</h2>
&nbsp;
<ul>
<li>Le firmware inclus est maintenant le firmware 16.0.3 Rebootless Update.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.15.0 apportant les changements suivants:
<ul>
<li>Les modules sont fermés avant leur suppression.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.14.0</h2>
&nbsp;
<ul>
<li>Ajout du module Sys-patch.</li>
<li>Mise à jour de DBI, de Tesla-Menu et de Status-Monitor-Overlay vers la dernière version de ceux-ci.</li>
<li>Mise à jour des crédits dans la documentation.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.14.1 apportant les changements suivants:
<ul>
<li>Ajout d'une fonction de vérification d'une mise à jour du homebrew au lancement de celui-ci ou durant le changement de mode dans celui-ci. Si une mise à jour est trouvée il sera proposé à l'utilisateur de l'installer.</li>
<li>Si une mise à jour du homebrew existe, celle-ci devra être faite avant d'installer/mettre à jour le pack ou le firmware.</li>
<li>Ajout de la vérification du sha256 du fichier zip complémentaire au pack.</li>
<li>Compilé avec la dernière version de la Libnx.</li>
<li>D'autres changements mineurs dans le code sources.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.13.0</h2>
&nbsp;
<ul>
<li>La luminosité par défaut dans Hekate est réglée à 100%.</li>
<li>Mise à jour de Atmosphere, de DBI et de AIO-Switch-Updater vers la dernière version de ceux-ci.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.13.0 apportant les changements suivants:
<ul>
<li>Ajout de la possibilité, via les fichiers de configuration, d'ajouter des fichiers complémentaires au pack (utile pour ceux souhaitant mettre en place des logos personnalisés par exemple).</li>
<li>La luminosité par défaut dans Hekate est réglée à 100%.</li>
<li>Correction d'un bug critique dans le système de traduction.</li>
<li>Correction d'un bug critique dans le système de chargement des fichiers de configuration du homebrew.</li>
<li>Correction d'un bug critique lorsque le homebrew était chargé depuis un autre dossier que son dossier "switch/AIO_LS_pack_Updater"; de plus lorsqu'il est chargé depuis un autre emplacement il est déplacé à cet emplacement au lancement du homebrew.</li>
<li>Correction d'un bug potentiel dans la vérification du type d'emunand.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 5.12.0</h2>
&nbsp;
<ul>
<li>Le firmware inclue est le firmware 16.0.3.</li>
<li>Mise à jour de Atmosphere et de Hekate vers la dernière version de ceux-ci.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater compilé avec la dernière version de la Libnx.</li>
</ul>
&nbsp;
<h2>Version 5.11.3</h2>
&nbsp;
<ul>
<li>Mise à jour de SimpleModManager, de TeslaMenu et de OvlSysmodule vers la dernière version de ceux-ci.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.11.0 apportant les changements suivants:
<ul>
<li>Ajout d'un choix permettant de supprimer les modules d'Atmosphere avant l'installation du pack, ceci supprimera tous les modules existants, pratique si vous venez d'un autre pack ou lors d'une mise à jour du firmware histoire de ne pas avoir une erreur au lancement d'Atmosphere  à cause des modules se qui est plutôt fréquent.</li>
<li>Ajout d'un contrôle du téléchargement du pack et de l'application via un contrôle SHA256, ceci permet de s'assurer que le fichier téléchargé est bien celui attendu.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.10.1</h2>
&nbsp;
<ul>
<li>Le firmware inclus est le firmware 16.0.2.</li>
<li>Ajout du payload Picofly-toolbox.</li>
<li>Mise à jour d'Atmosphere, de Hekate, de Haku33, de DBI, de Status-Monitor-Overlay, de AtmoXL-Titel-Installer et de Goldleaf vers la dernière version de ceux-ci.</li>
<li>Mise à jour de EdiZon-Overlay, de FastCFWSwitch, de OvlSysmodules et de TeslaMenu pour intégrer les dernières modifications de la Libtesla.</li>
<li>Petite correction dans le fichier de config d'Atmosphere pour la redirrection des touches, sans importance car non utilisé car toutes les configs sont commentées.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.9.0 apportant les changements suivants:
<ul>
<li>Adaptations mineures pour suivre le développement de Goldleaf et de AtmoXL-Titel-Installer.</li>
<li>Compilé avec la dernière version de la Libnx.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.9.0 - Eïka</h2>
&nbsp;
<ul>
<li>Le firmware inclus est le firmware 16.0.1.</li>
<li>Mise à jour de Haku33, de Hb-appstore, de TeslaMenu et de OvlSysmodules vers la dernière version de ceux-ci.</li>
<li>Le homebrew AIO_LS_pack_Updater sera toujours en mode debug même dans les releases stables, ceci permettra de pouvoir m'envoyer les logs situés dans le dossier "switch/AIO_LS_pack_Updater" en cas de soucis avec le homebrew durant la mise à jour du pack par exemple se qui pourrait me permettre d'identifier des soucis et de les corriger plus facilement. Attention, les logs peuvent contenir le numéro de série de la console ainsi que son identifiant unique, veillez à les supprimer du fichier si vous partager votre fichier en ligne. Pour le reste le homebrew est inchangé.</li>
</ul>
&nbsp;
<h2>Version 4.8.0</h2>
&nbsp;
<ul>
<li>Le firmware inclus est le firmware 16.0.0.</li>
<li>Mise à jour d'Atmosphere (le nouveau paramètre permettant d'utiliser une base de données Bluetooth externe est activé), de Hekate, des overlays et du menu des overlays, de TegraExplorer, de Incognito-RCM, de Lockpick-RCM, de DBI, de Goldleaf et de JKSV vers la dernière version de ceux-ci ou compilés pour fonctionner en firmware 16.0.0.</li>
<li>Mise à jour des patches pouvant être requis par le homebrew NXThemeInstaller.</li>
<li>Ajout d'une nouvelle config dans SimpleModManager pour pouvoir être utilisable avec certains mods, voir l'issue #2.</li>
<li>Une version spécifique de l'overlay de SimpleModManager a été ajoutée. Du coup il y a deux versions de cet overlay dans le pack, la version la plus basse est à utiliser en firmware 15.0.1 et inférieurs et l'autre est pour le firmware 16.0.0.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.8.0 apportant les changements suivants:
<ul>
<li>Compilé avec la dernière version de la Libnx en développement.</li>
<li>Correction d'un bug qui faisait que la sysnand était prise pour une emunand quand on demandait les informations de la console.</li>
<li>Ajout de la possibilité de protéger certains fichiers/dossiers contre la copie durant l'extraction du pack, ceci permet de conserver certains fichiers de configuration par exemple. Cette fonction est configurable via un fichier externe et par défaut elle protège les chemins "atmosphere/config/", "bootloader/hekate_ipl.ini", "bootloader/nyx.ini", "exosphere.ini", "config/", "boot.ini" et "switch/DBI/dbi.config".</li>
<li>Correction de quelques autres bugs mineurs.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.7.0</h2>
&nbsp;
<ul>
<li>Mise à jour d'Atmosphere et de DBI vers la dernière version de ceux-ci.</li>
<li>Ajout des patches pouvant être requis par le homebrew NXThemeInstaller.</li>
<li>Suppression du NSP de Tinfoil.</li>
<li>Suppression du tutoriel d'installation de fichiers via DBI.</li>
</ul>
&nbsp;
<h2>Version 4.6.0</h2>
&nbsp;
<ul>
<li>Mise à jour de Hekate, de DBI, de Atmoxl-titel-installer, de AIO_switch_updater, de Haku33 et de Switch_90DNS_tester vers la dernière version de ceux-ci.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.5.3 apportant les changements suivants:
<ul>
<li>Ajout d'une fonction permettant de vérifier le status de protection de la console contre les connexions aux serveurs de Nintendo (fonction très largement inspirée par le homebrew Switch_90DNS_tester). Cette fonction est déclenchée lors de l'affichage/enregistrement des informations de la console ou dans le log au démarrage du homebrew si le mode Debug est activé.</li>
<li>La fonction de nettoyage agressif (nettoyage des modules avant) peut maintenant être totalement configurée via des fichiers de configuration.</li>
<li>Modifications mineures du fichier "hekate_ipl.ini" inclus au homebrew et utilisé dans certains cas.</li>
<li>Ajout des dernières modifications incluses dans le homebrew Atmoxl-titel-installer pour l'installation de l'icône du Homebrew Menu.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.5.0</h2>
&nbsp;
<ul>
<li>Le firmware inclus est le firmware 15.0.1.</li>
<li>Dans le script de nettoyage de la SD, un nouveau choix est proposé pour pouvoir supprimer les modules d'Atmosphere, utile quand vous venez d'un autre pack ou lors de mises à jour majeures du firmware ou d'Atmosphere.</li>
<li>Le script TegraExplorer "shadow256 utilitaires.te" intègre une nouvelle fonction permettant de restaurer facilement un PRODINFO créé par le payload ProdinfoGen.</li>
<li>Mise à jour de DBI, de AIO_switch_updater, de Lockpick-RCM et de Status-Monitor-Overlay vers la dernière version de ceux-ci.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.5.0 apportant les changements suivants:
<ul>
<li>Lors de la mise à jour du pack ou du firmware, un nouveau choix est proposé pour pouvoir supprimer les modules d'Atmosphere, utile quand vous venez d'un autre pack ou lors de mises à jour majeures du firmware ou d'Atmosphere.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.4.0</h2>
&nbsp;
<ul>
<li>Mise à jour de DBI, de Linkalho et d'Ovl-sysmodules  vers la dernière version de ceux-ci.</li>
<li>Mise à jour de l'overlay d'EdiZon pour fonctionner avec le firmware 15.0.0, utile pour les cheats.</li>
<li>Mise à jour des crédits dans la documentation du pack.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.4.0 apportant les changements suivants:
<ul>
<li>Le bug important de la version 4.1.0 à 4.3.0 a été corrigé, si vous avez une de ces versions du homebrew veuillez mettre à jour le pack ou le homebrew manuellement.</li>
<li>Si la mise à jour automatique des logiciels de la console n'est pas désactivé, l'application le fera automatiquement à son lancement (fonction disponible pour les firmwares 2.0.0 et supérieurs).</li>
<li>Mise en place d'un mode debug qui peut être activé via les fichiers de configuration de l'application ou forcé en modifiant et compilant les sources du projet. La version utilisant ces fonctions sera utilisée dans les versions beta du pack. L'activation de cette fonction fait que l'application génère un journal des actions effectuées dans l'application, celui-ci se trouvera dans le fichier "switch/AIO_LS_pack_Updater\debug.log" sur la SD.</li>
<li>Quelques réorganisations et optimisations du code.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.3.0</h2>
&nbsp;
<ul>
<li>Mise à jour d'Atmosphere en version 1.4.0 stable.</li>
<li>Mise à jour du Homebrew Loader vers la dernière version, notamment dans le NSP d'installation du HBMenu et dans l'application AIO_LS_pack_Updater.</li>
<li>Mise à jour de la config de Hekate pour y inclure les dernières fonctionnalités ajoutées.</li>
<li>Mise à jour du NSP de Tinfoil vers la version 15.0 V1 compatible avec le firmware 15.0.0.</li>
<li>Le logo remplaçant le logo Nintendo Switch fonctionne en firmware 15.0.0.</li>
<li>Mise à jour de DBI vers la dernière version de celui-ci.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.0.2 apportant les changements suivants:
<ul>
<li>Retour en arrière dans les versions car un bug important et très problématique a été découvert dans les dernières versions (à partir de la version 4.1.0).</li>
<li>L'installation de l'icône du HBMenu sur le menu principal contient la dernière version du Homebrew Loader.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.2.0B</h2>
&nbsp;
<ul>
<li>Le firmware inclus est maintenant le firmware 15.0.0.</li>
<li>Mise à jour d'Atmosphere en version 1.4.0.</li>
<li>Mise à jour de Hekate en version 5.9.0.</li>
<li>Mise à jour de Lockpick-RCM vers la version master du Github que j'ai compilée, permettant ainsi de récupérer les dernières clés.</li>
<li>Mise à jour de Incognito-RCM et de TegraExplorer pour ajouter le support du firmware 15.0.0.</li>
<li>Mise à jour de DBI et de AIO_switch_updater vers la dernière version de ceux-ci.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.1.0 apportant les changements suivants:
<ul>
<li>Réorganisation du code et réécriture du système de traduction, ceci ne devrait pas changer grand chose à l'expérience de l'utilisateur.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 4.0.1 - Minus et Cortex</h2>
&nbsp;
<ul>
<li>Quelques homebrews sont en favori dans le Homebrew Menu.</li>
<li>La config permettant de démarrer en firmware officiel dans Hekate a été renommée "stock".</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 4.0.1 apportant les changements suivants:
<ul>
<li>Support du multi-langues, tentons de conquérir le monde! :)</li>
<li>Correction de bugs et de certains messages affichés.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 3.3.0</h2>
&nbsp;
<ul>
<li>Mise à jour du forwarder du Homebrew Menu pour inclure la dernière version du Homebrew Loader.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 3.3.0 apportant les changements suivants:
<ul>
<li>Possibilité de supprimer les logos durant l'installation du pack.</li>
<li>Possibilité d'avoir un fichier de configuration pour le mode beta.</li>
<li>Ajout d'informations sur la charge de la batterie et sur le mode de l'application (mode applet ou mode application). Ces infos sont aussi utilisées pour limiter certaines actions, notamment l'installation du pack avec peu de batterie.</li>
<li>Daybreak-cli (la fonction pour mettre à jour le firmware de la console) est maintenant intégré directement dans l'application et est traduit en français, cela ne changera pas grand chose pour l'utilisateur final mais ça s’intègre mieux.</li>
<li>Installation du forwarder du Homebrew Menu durant l'installation du pack ou avec une fonction uniquement dédiée à cela. Notons que j'ai aussi mis à jour le forwarder du Homebrew Menu pour inclure la dernière version du Homebrew Loader.</li>
<li>Possibilité de choisir, avec les fichiers de configuration, comment se ferme l'application.</li>
<li>Corrections de bugs.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 3.2.0 - Explosion</h2>
&nbsp;
<p>
Avant le changelog pourquoi ce nom de release? Parce que pendant ces quatre derniers jours et nuits j'ai galéré à trouver un fichu bug et j'étais au bord de l'explosion.
</p>
<ul>
<li>Changement du nom d'un fichier pour en retirer l'accent sur une lettre (fichier "Tutos/Mise à jour sysnand et emunand via Daybreak.url"), c'était çà qui provoquait le bug dont je parlais plus haut. Certains fichiers de ce dossier ont aussi changé de nom, par contre le dossier ne sera pas nettoyé automatiquement car je ne souhaite pas supprimer aussi des fichiers que l'utilisateur aurait placé dans ce dossier donc faites le nettoyage vous-même pour ce dossier.</li>
<li>Nouvelle configuration ajoutée à Hekate, celle-ci permet de lancer Atmosphere qui choisira lui-même s'il se lance sur l'emunand ou sur la sysnand selon la configuration sur la SD de l'utilisateur (lancement d'Atmosphere via son payload de démarrage).</li>
<li>Auto-boot de la console activé dans Hekate sur la configuration évoquée ci-dessus, il faudra appuyer sur "vol-" durant le premier écran de démarrage pour revenir à Hekate.</li>
<li>Petite mise à jour de la configuration de l'overlay FastCFWSwitch.</li>
<li>Changement du nom de fichier pour détecter la version du pack, en effet le fichier "version.txt" à la racine de la SD peut être aussi utilisé par DBI pour tout autre chose donc le fichier s'appellera "pack_version.txt". Notez que ce changement affectera ceux ayant mis à jour AIO_LS_pack_Updater sans mettre à jour le pack, la version actuelle du pack ne sera plus détectée et pour les autres se sera la dernière version qui ne sera plus détectée.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 3.2.0 apportant les changements suivants:
<ul>
<li>Ajout d'un mode Beta pour ceux souhaitant tester en avance les nouvelles fonctionnalités du pack ou de l'application. Attention tout de même, l'utilisation de ce mode est à réserver à ceux pouvant corriger eux-mêmes d'éventuels problèmes, les fonctions à tester peuvent ne pas être stables.</li>
<li>Pour les téléchargement de l'application en mode stable (et sans le fichier de configuration personnalisé donc presque pour tout le monde), ceux-ci se passeront sur notre serveur se qui augmente sensiblement les vitesses de téléchargement et cela permet aussi d'avoir enfin la barre de progression. Pour le mode beta les adresses sont en fait celles qui étaient utilisées avant.</li>
<li>Retrait de l'information sur le formatage de la SD car ne fonctionne pas correctement pour l'instant.</li>
<li>Corrections de pas mal de bugs et petites optimisations du code.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 3.1.0</h2>
&nbsp;
<ul>
<li>Mise à jour de DBI et de AIO-switch-updater.</li>
<li>Suppression de Tinfoil en NRO, le NSP installable reste toujours disponible.</li>
<li>Ajout d'information dans la documentation du pack.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater en version 3.1.0 apportant les changements suivants:
<ul>
<li>Le bouton "Home" ne sera plus bloqué jusqu'au redémarrage de la console, il se débloquera à la sortie de l'application.</li>
<li>L'application empêche la console de se mettre en veille tant qu'elle est lancée.</li>
<li>Mise à jour de  la possibilité d'obtenir ou d'enregistrer dans un fichier des informations sur la console, maintenant on récupère bien plus d'informations qu'avant, ceci sera très utile pour les dépanages.</li>
<li>Mise à jour de Daybreak-cli pour le rendre plus paramétrable, ceci est un changement plutôt destiné aux développeurs car l'utilisateur ne verra pas la différence.</li>
<li>Corrections de bugs.</li>
</ul></li>
</ul>
&nbsp;
<h2>Version 3.0.0 -  Simplicity</h2>
&nbsp;
<ul>
<li>Le nettoyage de la SD a été mis à jour pour refléter  un changement de nom pour le dossier du firmware dans le pack, maintenant ce dossier aura un nom fixe à savoir "dernier_firmware_compatible".</li>
<li>Diverse mises à jour du homebrew AIO_LS_pack_Updater. Cette mise à jour ajoute la possibilité de mettre à jour automatiquement le firmware durant l'installation  du pack. Le  homebrew permet aussi d'obtenir des informations comme la version d'Atmosphere ou la version du firmware par exemple.</li>
</ul>
&nbsp;
<h2>Version 2.1.0</h2>
&nbsp;
<ul>
<li>Ajout d'un fichier permettant l'identification de la version du pack.</li>
<li>Diverse mises à jour du homebrew AIO_LS_pack_Updater.</li>
</ul>
&nbsp;
<h2>Version 2.0.2</h2>
&nbsp;
<ul>
<li>Modification du fichier de configuration de Hekate pour corriger certaines réactions imprévues avec certaines consoles.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater.</li>
</ul>
&nbsp;
<h2>Version 2.0.1</h2>
&nbsp;
<ul>
<li>Modification des thèmes du Homebrew Menu.</li>
<li>Mise à jour du homebrew AIO_LS_pack_Updater.</li>
</ul>
&nbsp;
<h2>Version 2.0.0</h2>
&nbsp;
<ul>
<li>Ajout du homebrew AIO_LS_pack_Updater qui sert à mettre à jour le pack directement depuis la Switch, il intègre également le script de nettoyage qu'il fera automatiquement.</li>
<li>Diverses modifications d'ordre estétique ou d'ordre organisationnel, trop nombreuses pour être listées.</li>
</ul>
&nbsp;
<h2>Version 1.0.4</h2>
&nbsp;
<ul>
<li>Mise à jour de Hekate en version 5.8.0.</li>
</ul>
&nbsp;
<h2>Version 1.0.3</h2>
&nbsp;
<ul>
<li>Le patch nogc n'est plus forcé lorsqu'Atmosphere est lancé via Fusee, maintenant cela se comportera comme le paramètre "auto-nogc" activé de Hekate.</li>
<li>Le script de nettoyage de la SD n'est plus inclue dans l'archive auto-extractible.</li>
</ul>
&nbsp;
<h2>Version 1.0.2</h2>
&nbsp;
<ul>
<li>Les IDs des configurations de Hekate sont accordés avec la configuration de FastCFWSwitch.</li>
</ul>
&nbsp;
<h2>Version 1.0.1</h2>
&nbsp;
<ul>
<li>Correction d'une configuration oubliée durant les tests qui lançait le Homebrew Menu automatiquement lorsqu'un jeu était lancé, ce comportement est corrigé et il faut maintenir "R" pour lancer le Homebrew Menu via un jeu.</li>
</ul>
&nbsp;
<h2>Version 1.0.0</h2>
&nbsp;
<ul>
<li>Première publication.</li>
</ul>