@echo off
title CLSID Selector - trhacknon
color 0A
setlocal enabledelayedexpansion

:: Fichier de sortie
set OUTPUT=%~dp0clsid_full.txt
if exist "%OUTPUT%" del "%OUTPUT%"

:: Bureau
set DESKTOP=%USERPROFILE%\Desktop

:: --- 1. Extraction CLSID ---
echo =====================================================
echo       CLSID Explorer - Dev Black Hat : trhacknon
echo =====================================================
echo [*] Extraction des CLSID depuis le registre...
for /f "tokens=*" %%K in ('reg query "HKCR\CLSID"') do (
    set CLSID=%%K
    echo !CLSID! | find "{" >nul
    if !errorlevel! == 0 (
        for /f "tokens=2,*" %%A in ('reg query "%%K" /ve 2^>nul ^| find "REG_SZ"') do (
            set NAME=%%B
            if "!NAME!"=="" set NAME=(SansNom)
            echo !NAME!^|!CLSID!>>"%OUTPUT%"
        )
    )
)
echo [+] Extraction terminee : %OUTPUT%
echo.

:: --- 2. Charger CLSID dans des variables avec index ---
set i=0
for /f "tokens=1,2 delims=|" %%a in (%OUTPUT%) do (
    set /a i+=1
    set "NAME[!i!]=%%a"
    set "CLSID[!i!]=%%b"
    set "SELECT[!i!]=0"
)
set MAX=%i%

:MENU
cls
echo =====================================================
echo      CLSID Selector - Cocher/Décocher - trhacknon
echo =====================================================
echo.
echo Utilisez le numero pour cocher/decocher. Ex: 1,3,5
echo [C] Creer les CLSID selectionnes
echo [A] Cocher tout
echo [U] Decocher tout
echo [Q] Quitter
echo.

:: Afficher liste avec statut
for /L %%i in (1,1,%MAX%) do (
    if !SELECT[%%i]!==1 (set mark=[X]) else (set mark=[ ])
    echo %%i !mark! !NAME[%%i]!
)
echo.

set /p inp="Selection / commande : "

:: Gestion des commandes
if /i "%inp%"=="Q" goto END
if /i "%inp%"=="C" goto CREATE
if /i "%inp%"=="A" (
    for /L %%i in (1,1,%MAX%) do set "SELECT[%%i]=1"
    goto MENU
)
if /i "%inp%"=="U" (
    for /L %%i in (1,1,%MAX%) do set "SELECT[%%i]=0"
    goto MENU
)

:: Cocher/décocher selon les numéros entrés
for %%n in (%inp:,= %) do (
    if "!SELECT[%%n]!"=="1" (set "SELECT[%%n]=0") else (set "SELECT[%%n]=1")
)
goto MENU

:CREATE
echo.
echo [*] Creation des CLSID selectionnes sur le Bureau...
for /L %%i in (1,1,%MAX%) do (
    if !SELECT[%%i]!==1 (
        mkdir "%DESKTOP%\!NAME[%%i]!.!CLSID[%%i]!" 2>nul
        echo [+] !NAME[%%i]! cree
    )
)
pause
goto MENU

:END
echo Bye ! - trhacknon
pause
exit
