@echo off
title Dump CLSID - trhacknon
echo ================================================
echo    Extraction de tous les CLSID de Windows
echo    (par trhacknon)
echo ================================================
echo.

set OUTPUT=%~dp0clsid_full.txt

echo [*] Generation de la liste complete dans %OUTPUT%
echo.

:: Appel PowerShell pour lire le registre
powershell -NoLogo -NoProfile -Command ^
 "Get-ChildItem 'HKCR:\CLSID' | ForEach-Object { ^
    $clsid = $_.PSChildName; ^
    $name = (Get-ItemProperty -Path $_.PSPath -ErrorAction SilentlyContinue).'(Default)'; ^
    if ($name) { ^
        \"$name|{$clsid}\" ^
    } else { ^
        \"(SansNom)|{$clsid}\" ^
    } ^
 } | Out-File -FilePath '%OUTPUT%' -Encoding UTF8"

echo.
echo [+] Extraction terminee !
echo [+] Fichier genere : %OUTPUT%
pause
