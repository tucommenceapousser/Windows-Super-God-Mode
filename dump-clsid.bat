@echo off
title Dump CLSID sans PowerShell - trhacknon
setlocal enabledelayedexpansion

echo ================================================
echo    Extraction CLSID via REG QUERY (no PowerShell)
echo    (par trhacknon)
echo ================================================
echo.

set OUTPUT=%~dp0clsid_full.txt
if exist "%OUTPUT%" del "%OUTPUT%"

echo [*] Generation de la liste complete dans %OUTPUT%
echo.

for /f "tokens=*" %%K in ('reg query "HKCR\CLSID"') do (
    set CLSID=%%K
    rem On verifie que c'est bien un GUID {xxxx-...}
    echo !CLSID! | find "{" >nul
    if !errorlevel! == 0 (
        for /f "tokens=2,*" %%A in ('reg query "%%K" /ve 2^>nul ^| find "REG_SZ"') do (
            set NAME=%%B
            if "!NAME!"=="" set NAME=(SansNom)
            echo !NAME!^|!CLSID!>>"%OUTPUT%"
        )
    )
)

echo.
echo [+] Extraction terminee !
echo [+] Fichier genere : %OUTPUT%
pause
