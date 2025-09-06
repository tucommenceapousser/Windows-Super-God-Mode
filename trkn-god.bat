@echo off
setlocal enabledelayedexpansion

:: Bureau utilisateur
set "desktop=%USERPROFILE%\Desktop"

:: Fichier contenant tous les CLSID (Nom|CLSID)
set "clsidfile=clsid_full.txt"

if not exist "%clsidfile%" (
    echo [ERREUR] Fichier %clsidfile% introuvable !
    pause
    exit /b
)

echo [*] Création des dossiers CLSID sur le Bureau...
for /f "tokens=1,2 delims=|" %%a in (%clsidfile%) do (
    mkdir "%desktop%\%%a.%%b" 2>nul
    echo [+] %%a -> %%b
)

echo [OK] Terminé !
pause
