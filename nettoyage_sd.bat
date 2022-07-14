@echo off
::Script by Shadow256
chcp 65001 >nul
Setlocal enabledelayedexpansion
title Switch_AIO_LS_pack sd cleaner
echo Nettoyage de la SD avant installation du pack Switch_AIO_LS_pack
echo.
:set_volume_letter
set volume_letter=
set /p volume_letter=Entrez la lettre du lecteur à nettoyer ou entrez "0" pour quitter sans rien faire: 
IF "%volume_letter%"=="0" goto:end_script
set volume_letter=%volume_letter:~0,1%
set volume_letter=%volume_letter%:
IF NOT EXIST "%volume_letter%" (
	echo Cette lettre de lecteur n'existe pas.
	echo.
	pause
	goto:set_volume_letter
)
echo.
echo Nettoyage du lecteur %volume_letter%
echo.
IF EXIST "%volume_letter%\atmosphere\titles*.*" (
	IF EXIST "%volume_letter%\atmosphere\contents" (
		rmdir /s /q "%volume_letter%\atmosphere\titles" >nul
	) else (
		move "%volume_letter%\atmosphere\titles" "%volume_letter%\atmosphere\contents" >nul
	)
)
IF EXIST "%volume_letter%\atmosphere\contents\010000000000000D\*.*" rmdir /s /q "%volume_letter%\atmosphere\contents\010000000000000D"
IF EXIST "%volume_letter%\atmosphere\contents\010000000000002B\*.*" rmdir /s /q "%volume_letter%\atmosphere\contents\010000000000002B"
IF EXIST "%volume_letter%\atmosphere\contents\010000000000003C\*.*" rmdir /s /q "%volume_letter%\atmosphere\contents\010000000000003C"
IF EXIST "%volume_letter%\atmosphere\contents\0100000000000008\*.*" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000000008"
IF EXIST "%volume_letter%\atmosphere\contents\0100000000000032\*.*" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000000032"
IF EXIST "%volume_letter%\atmosphere\contents\0100000000000034\*.*" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000000034"
IF EXIST "%volume_letter%\atmosphere\contents\0100000000000036\*.*" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000000036"
IF EXIST "%volume_letter%\atmosphere\contents\0100000000000037\*.*" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000000037"
IF EXIST "%volume_letter%\atmosphere\contents\0100000000000042\*.*" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000000042"
IF EXIST "%volume_letter%\nettoyage_sd.bat" del /q "%volume_letter%\nettoyage_sd.bat"
IF EXIST "%volume_letter%\atmosphere\BCT.ini" del /q "%volume_letter%\atmosphere\BCT.ini"
IF EXIST "%volume_letter%\atmosphere\loader.ini" del /q "%volume_letter%\atmosphere\loader.ini"
IF EXIST "%volume_letter%\atmosphere\system_settings.ini" del /q "%volume_letter%\atmosphere\system_settings.ini"
IF EXIST "%volume_letter%\atmosphere\hekate_kips\loader.kip" del /q "%volume_letter%\atmosphere\hekate_kips\loader.kip" >nul
IF EXIST "%volume_letter%\sept\sept-secondary.enc" del /q "%volume_letter%\sept\sept-secondary.enc"
IF EXIST "%volume_letter%\sept\ams\sept-secondary.enc" del /q "%volume_letter%\sept\ams\sept-secondary.enc"
IF EXIST "%volume_letter%\switch\atmosphere-updater\*.*" rmdir /s /q "%volume_letter%\switch\atmosphere-updater"
IF EXIST "%volume_letter%\switch\sigpatch-updater\*.*" rmdir /s /q "%volume_letter%\switch\sigpatch-updater"
IF EXIST "%volume_letter%\switch\sigpatches-updater\*.*" rmdir /s /q "%volume_letter%\switch\sigpatches-updater"
IF EXIST "%volume_letter%\switch\DeepSea-Toolbox\*.*" rmdir /s /q "%volume_letter%\switch\DeepSea-Toolbox"
IF EXIST "%volume_letter%\switch\GagOrder.nro" del /q "%volume_letter%\switch\GagOrder.nro" >nul
IF EXIST "%volume_letter%\atmosphere\exefs_patches\Signature_Patches_by_br4z0rf_and_Jakibaki" rmdir /s /q "%volume_letter%\atmosphere\exefs_patches\Signature_Patches_by_br4z0rf_and_Jakibaki" >nul
IF EXIST "%volume_letter%\switch\appstore\res" rmdir /s /q "%volume_letter%\switch\appstore\res" >nul
IF EXIST "%volume_letter%\BCT.ini" del /q "%volume_letter%\BCT.ini" >nul
IF EXIST "%volume_letter%\fusee-secondary.bin" del /q "%volume_letter%\fusee-secondary.bin" >nul
IF EXIST "%volume_letter%\bootlogo.bmp" del /q "%volume_letter%\bootlogo.bmp" >nul
IF EXIST "%volume_letter%\hekate_ipl.ini" del /q "%volume_letter%\hekate_ipl.ini" >nul
IF EXIST "%volume_letter%\switch\CFWSettings" rmdir /s /q "%volume_letter%\switch\CFWSettings" >nul
IF EXIST "%volume_letter%\switch\CFW-Settings" rmdir /s /q "%volume_letter%\switch\CFW-Settings" >nul
IF EXIST "%volume_letter%\modules\atmosphere\fs_mitm.kip" del /q "%volume_letter%\modules\atmosphere\fs_mitm.kip" >nul
IF EXIST "%volume_letter%\atmosphere\titles\010000000000100D" rmdir /s /q "%volume_letter%\atmosphere\titles\010000000000100D" >nul
IF EXIST "%volume_letter%\atmosphere\fusee-mtc.bin" del /q "%volume_letter%\atmosphere\fusee-mtc.bin" >nul
IF EXIST "%volume_letter%\atmosphere\kip_patches\default_nogc\*.*" rmdir /s /q "%volume_letter%\atmosphere\kip_patches\default_nogc" >nul
IF EXIST "%volume_letter%\atmosphere\config\BCT.ini" del /q "%volume_letter%\atmosphere\config\BCT.ini" >nul
IF EXIST "%volume_letter%\atmosphere\config_templates\BCT.ini" del /q "%volume_letter%\atmosphere\config_templates\BCT.ini" >nul
IF EXIST "%volume_letter%\atmosphere\fusee-secondary.bin" del /q "%volume_letter%\atmosphere\fusee-secondary.bin" >nul
IF EXIST "%volume_letter%\atmosphere\flags\clean_stratosphere_for_0.19.0.flag" del /q "%volume_letter%\atmosphere\flags\clean_stratosphere_for_0.19.0.flag" >nul
IF EXIST "%volume_letter%\Atmosphere_fusee-primary.bin" del /Q /S "%volume_letter%\Atmosphere_fusee-primary.bin" >nul 2>&1
IF EXIST "%volume_letter%\switch\KosmosToolbox\*.*" rmdir /S /Q "%volume_letter%\switch\KosmosToolbox" >nul 2>&1
IF EXIST "%volume_letter%\switch\KosmosUpdater\*.*" rmdir /S /Q "%volume_letter%\switch\KosmosUpdater" >nul 2>&1
IF EXIST "%volume_letter%\switch\HekateToolbox\*.*" rmdir /S /Q "%volume_letter%\switch\HekateToolbox" >nul 2>&1
IF EXIST "%volume_letter%\bootloader\hekate_ipl.ini.old" del /q "%volume_letter%\bootloader\hekate_ipl.ini.old" >nul 2>&1
IF EXIST "%volume_letter%\switch\DeepSea-Updater\DeepSeaUpdater.nro" del /q "%volume_letter%\switch\DeepSea-Updater\DeepSeaUpdater.nro" >nul 2>&1
IF EXIST "%volume_letter%\switch\ChoiDuJourNX" rmdir /s /q "%volume_letter%\switch\ChoiDuJourNX"
IF EXIST "%volume_letter%\switch\ChoiDuJourNX.nro" del /q "%volume_letter%\switch\ChoiDuJourNX.nro" >nul
IF EXIST "%volume_letter%\nsp_forwaders" rmdir /s /q "%volume_letter%\nsp_forwaders"
IF EXIST "%volume_letter%\readme.html" del /q "%volume_letter%\readme.html" >nul
IF EXIST "%volume_letter%\readme.md" del /q "%volume_letter%\readme.md" >nul
IF EXIST "%volume_letter%\bootloader\bootlogo.bmp" del /q "%volume_letter%\bootloader\bootlogo.bmp" >nul
set /p theme_delete=Souhaitez-vous supprimer le thème du menu principal (à faire avant de mettre à jour le firmware)? (o/n): 
if /i "%theme_delete:~0,1%" == "o" (
	IF EXIST "%volume_letter%\atmosphere\contents\0100000000001000" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000001000"
	IF EXIST "%volume_letter%\atmosphere\contents\0100000000001013" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000001013"
	IF EXIST "%volume_letter%\atmosphere\contents\0100000000001007" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000001007"
	IF EXIST "%volume_letter%\atmosphere\contents\0100000000000811" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000000811"
	IF EXIST "%volume_letter%\atmosphere\contents\0100000000000039" rmdir /s /q "%volume_letter%\atmosphere\contents\0100000000000039"
)
echo.
echo Nettoyage terminé, vous pouvez maintenant installer le pack Switch_AIO_LS_pack sur votre SD.
echo.
pause
:end_script
endlocal