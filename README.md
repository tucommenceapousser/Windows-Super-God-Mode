# "Super God Mode" For Windows

This PowerShell script <b>creates shortcuts to all special shell folders, named folders, task links, system settings, deep links, and URL protocols in Windows</b>, providing easy access to a wide range of system settings and features.

It was inspired by the famously nicknamed "God Mode" folder and creates many more shortcuts than even that. 

➤ Note: It's not really a "mode", that's just a catchy name. Running this doesn't change any system settings, it just creates a folder containing a ton of shortcuts.

## Screenshots

<p align="center">
<img width="700" alt="GUI Window" src="https://github.com/user-attachments/assets/d318373c-d4d4-4521-bf57-8b4a4b4273ee">
</p><p align="center">
<img width="290" alt="Results" src="https://github.com/user-attachments/assets/4d01fbad-b597-4433-bd67-2638ded8a6ed">
<img width="392" alt="Output Folders" src="https://github.com/user-attachments/assets/898efc48-ddc6-4875-b906-b89963d5778e">
</p>



## Features

- Creates shortcuts for various Windows components:
  - **CLSID Shell Folders**
  - **Named Special Folders**
  - **Task Links** (sub-pages within shell folders and control panel menus)
  - **System settings** (ms-settings: links)
  - **"Deep Links"** (direct links to various settings menus across Windows)
  - **URL Protocols**
  - **Hidden App Links** (Internal-use and undocumented URL links used by apps)
- Generates CSV files with detailed information about the shortcuts
- Saves XML content retrieved from shell32.dll and other sources for reference
- Graphical User Interface (GUI) for easy configuration
- Release versions signed with EV code signing certificate

## How to Run:

### Option 1 (Easier): Using .Bat Launcher
1. Download the latest version of the script. (Direct link [here](https://github.com/ThioJoe/Windows-Super-God-Mode/releases/latest/download/Super_God_Mode.ps1))
2. Download the launcher batch file to the same location. (Direct link [here](https://github.com/ThioJoe/Windows-Super-God-Mode/releases/latest/download/SuperGodMode-EasyLauncher.bat))
3. Run the batch file.

### Option 2: Manually running

1. Download the latest version of the script. (Direct link [here](https://github.com/ThioJoe/Windows-Super-God-Mode/releases/latest/download/Super_God_Mode.ps1))
2. Open PowerShell to the directory with the script. (Tip: In File Explorer, just type "PowerShell.exe" into the address bar to open it to that path).
3. Run the following command to allow script execution temporarily for the current session. 
   ```
   Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
   ```
   ^ **Note:** You might see a warning about changing the execution policy, but the `-Scope Process` part ensures that the change is only temporary, and will only apply to that specific PowerShell window, so you can choose to allow. You can read more in [this article](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-5.1#-scope). 
   
5. Run the script:
   ```
   .\Super_God_Mode.ps1
   ```
   - If no parameters are provided, a GUI will appear for easy configuration.
   - You can also run the script with optional parameters (see below).

## Video: Demonstration

<p align="center">Demonstration Video: https://www.youtube.com/watch?v=CnATL9kJPn8</p>

<p align="center"><a href="https://www.youtube.com/watch?v=CnATL9kJPn8"> <img width="750" src="https://github.com/user-attachments/assets/1d5d5c88-aa50-4909-845a-8598e759a6b7"></a></p>

<p align="center">(Takes you to YouTube, not embedded. See timestamps in video description.)</p>


## CLI Parameters

Note: Except for `-Debug` and `-Verbose`, you must use `-NoGUI` for arguments to take effect.

#### Alternative Options Arguments

- `-DontGroupTasks`: Prevent grouping task shortcuts by application name
- `-UseAlternativeCategoryNames`: Use alternative category names for task links
- `-AllURLProtocols`: Include third-party URL protocols from installed software
- `-DeepScanHiddenLinks`: Scans for hidden links in all files in the install directory of non-appx-package apps, otherwise only the main binary file is searched.
- `-CollectExtraURLProtocolInfo`: Collect additional information about URL protocols
- `-AllowDuplicateDeepLink`: Will not skip Deep Link shortcuts that are exactly the same as an existing task link

#### Control Output

- `-Output`: Specify a custom output folder path
- `-KeepPreviousOutputFolders`: Don't auto-delete existing output folders before running

#### Arguments to Limit Shortcut Creation

- `-NoStatistics`: Don't create statistics folder and files
- `-NoReadMe`: Don't create tips text file
- `-SkipCLSID`: Skip creating shortcuts for CLSID-based shell folders
- `-SkipNamedFolders`: Skip creating shortcuts for named special folders
- `-SkipTaskLinks`: Skip creating shortcuts for task links
- `-SkipMSSettings`: Skip creating shortcuts for ms-settings: links
- `-SkipDeepLinks`: Skip creating shortcuts for deep links
- `-SkipURLProtocols`: Skip creating shortcuts for URL protocols
- `-SkipHiddenAppLinks`: Skip creating shortcuts to hidden app links

#### Debugging

- `-Verbose`: Enable verbose output. Can be used with or without `-NoGUI`.
- `-Debug`: Enable debug output (also enables verbose output). Can be used with or without `-NoGUI`.
- `-timing`: Enable timing output to show how long each section of the script takes to run. Also enabled by verbose/debug switches.
- `-debugSkipAppxSearch`: Skip searching for hidden links in AppX packages, and only search for non-appx programs.
- `-debugSearchOnlyProtocolList`: Specify a comma-separated list of URL protocols (surrounded by quotes) to search for, and no others.
- `uniqueOutputFolder`: Append a unique identifier to the output folder name to prevent overwriting existing folders.

#### Advanced Arguments

- `-NoGUI`: Skip the GUI dialog and run with default or provided parameters
- `-CustomDLLPath`: Specify a custom DLL file path for shell32.dll
- `-CustomLanguageFolderPath`: Specify a path to a folder containing language-specific MUI files
- `-CustomSystemSettingsDLLPath`: Specify a custom path to the SystemSettings.dll file
- `-CustomAllSystemSettingsXMLPath`: Specify a custom path to the "AllSystemSettings_" XML file

### Example

```powershell
.\Super_God_Mode.ps1 -Output "C:\SuperGodMode" -AllURLProtocols -Verbose
```

## Notes

- Some shortcuts may not work on all Windows versions due to differences in available features.
- The script does not modify any system settings; it only creates shortcuts to existing Windows features.
- All parameters and GUI settings are optional. The script will run with default settings if the user doesn't change anything.

## Frequently Asked Questions
- See Wiki Page for FAQs: https://github.com/ThioJoe/Windows-Super-God-Mode/wiki/Frequently-Asked-Questions
___

# Extra Tools

The "Extra Tools" folder contains additional scripts that complement the main functionality of Windows Super God Mode:

### Get_DLL_String_Reference.ps1

This script allows you to easily retrieve the localized string of a single specific string reference.

Features:
- Interactively prompts for string references
- Resolves and displays the localized string values
- Supports the `@dllpath,-resourceID` format

Usage:
1. Run the script in PowerShell
2. Enter the string reference when prompted (e.g., `@%SystemRoot%\system32\shell32.dll,-9227`)
3. The script will display the resolved string value

### Windows_XML_String_Resolver.ps1

This script processes entire XML files containing Windows string references and resolves them to their actual string values. Mostly intended to be used with the XML from shell32.dll.mun containing all the Windows task links.

Features:
- Processes entire XML files, replacing string references with their resolved values
- Supports custom DLL paths for resolving strings
- Generates a new XML file with resolved strings

Usage:
```powershell
.\Windows_XML_String_Resolver.ps1 -XmlFilePath "path\to\your\file.xml" [-CustomResourcePaths "shell32=C:\custom\path\shell32.dll", "user32=C:\another\path\user32.mui"] [-Debug]
```

### Get-MS-Settings-Strings.ps1

This script will find text strings of "ms-settings:" in a DLL file and output them to a text file. 
It is a standalone version of the feature built into the main script. Intended mainly for: "C:\Windows\ImmersiveControlPanel\SystemSettings.dll".

Usage:
```
`.\Get-MS-Settings-Strings.ps1 -DllPath "C:\Windows\ImmersiveControlPanel\SystemSettings.dll" -OutputFilePath "SystemSettings-MS-Settings.txt"
```
- If not specified via arguments, the script will prompt the user for the DLL path, and output to the same directory as the script.

### Find_URLs_From_AppxPackage_Files.ps1

This script fetches the URI protocols for each installed AppxPackage via their AppxManifest.xml file, then brute force searches for those URIs in all files in the app's install directory.
It is a standalone version of the feature built into the main script, but might not be up to date!

Usage:
- No arguments necessary:  `.\Find_URLs_From_AppxPackage_Files.ps1`

perso:

## 📂 CLSID cachés Windows
 
 
À utiliser comme : `Nom.{CLSID}`
 
 
### ⚙️ Réglages & configuration
 
 
- **GodMode (tous les réglages)** `{ED7BA470-8E54-465E-825C-99712043E01C}`
 
- **Panneau de configuration** `{21EC2020-3AEA-1069-A2DD-08002B30309D}`
 
- **Paramètres PC (Windows 10/11)** `{F1B32785-6FBA-4FCF-9D55-7B8E7F157091}`
 

 
### 🖥️ Système
 
 
- **Centre Réseau et partage** `{8E908FC9-BECC-40F6-915B-F4CA0E70D03D}`
 
- **Connexions réseau** `{7007ACC7-3202-11D1-AAD2-00805FC1270E}`
 
- **Gestionnaire de périphériques** `{74246bfc-4c96-11d0-abef-0020af6b0b7a}`
 
- **Outils administratifs** `{D20EA4E1-3957-11D2-A40B-0C5020524153}`
 
- **Gestion des disques** `{74246bfc-4c96-11d0-abef-0020af6b0b7a}`
 

 
### 📑 Fichiers & bibliothèques
 
 
- **Mes Documents** `{450D8FBA-AD25-11D0-98A8-0800361B1103}`
 
- **Mes Images** `{7BD29E00-76C1-11CF-9DD0-00A0C9034933}`
 
- **Téléchargements** `{374DE290-123F-4565-9164-39C4925E467B}`
 

 
### 🛠️ Divers outils
 
 
- **Programmes et fonctionnalités (désinstaller)** `{7b81be6a-ce2b-4676-a29e-eb907a5126c5}`
 
- **Pare-feu Windows** `{4026492F-2F69-46B8-B9BF-5654FC07E423}`
 
- **Tâches planifiées** `{D6277990-4C6A-11CF-8D87-00AA0060F5BF}`
 
- **Journal des événements** `{F3A614DC-ABE0-11D1-8FB1-00A0C90F26F9}`
 
- **Politiques de sécurité locales** `{62D8ED13-C9D0-4CE8-A914-47DD628FB1B0}`
 
- **Gestion de l’ordinateur** `{20D04FE0-3AEA-1069-A2D8-08002B30309D}`
 

 
### 🎵 Multimédia
 
 
- **Périphériques audio** `{0F6F268D-6D61-4B15-B06C-9381D06236CC}`
 
- **Caméras et scanners** `{6bdd1fc6-810f-11d0-bec7-08002be2092f}`

```bash
GodMode|{ED7BA470-8E54-465E-825C-99712043E01C}
PanneauDeConfiguration|{21EC2020-3AEA-1069-A2DD-08002B30309D}
AdminTools|{D20EA4E1-3957-11D2-A40B-0C5020524153}
ConnexionsReseau|{7007ACC7-3202-11D1-AAD2-00805FC1270E}
PeripheriquesEtImprimantes|{A8A91A66-3A7D-4424-8D24-04E180695C7A}
ProgrammesEtFonctionnalites|{7b81be6a-ce2b-4676-a29e-eb907a5126c5}
TachesPlanifiees|{D6277990-4C6A-11CF-8D87-00AA0060F5BF}
LogsEvenements|{F3A614DC-ABE0-11D1-8FB1-00A0C90F26F9}
GestionnairePeripheriques|{74246bfc-4c96-11d0-abef-0020af6b0b7a}
PareFeuWindows|{4026492F-2F69-46B8-B9BF-5654FC07E423}
CentreReseau|{8E908FC9-BECC-40F6-915B-F4CA0E70D03D}
GestionOrdinateur|{20D04FE0-3AEA-1069-A2D8-08002B30309D}
MesDocuments|{450D8FBA-AD25-11D0-98A8-0800361B1103}
MesImages|{7BD29E00-76C1-11CF-9DD0-00A0C9034933}
Telechargements|{374DE290-123F-4565-9164-39C4925E467B}
Videos|{18989B1D-99B5-455B-841C-AB7C74E4DDFC}
Musique|{4BD8D571-6D19-48D3-BE97-422220080E43}
Favoris|{1777F761-68AD-4D8A-87BD-30B759FA33DD}
Imprimantes|{2227A280-3AEA-1069-A2DE-08002B30309D}
RacineOrdinateur|{871C5380-42A0-1069-A2EA-08002B30309D}
ExplorateurRecent|{22877A6D-37A1-461A-91B0-DBDA5AAEBC99}
ExplorateurBureau|{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}
ExplorateurUtilisateur|{59031a47-3f72-44a7-89c5-5595fe6b30ee}
Corbeille|{645FF040-5081-101B-9F08-00AA002F954E}
PanneauSon|{F2DDFC82-8F12-4CDD-B7DC-D4FE1425AA4D}
CentreMaintenance|{1F3E8A7C-8F5D-4F7C-B09E-2CDB63C2F78F}
WindowsUpdate|{36eef7db-88ad-4e81-ad49-0e313f0c35f8}
OptionsAlimentation|{025A5937-A6BE-4686-A844-36FE4BEC8B6D}
OptionsSouris|{6C8EEC18-8D75-41B2-A177-8831D59D2D50}
OptionsClavier|{BB06C0E4-D293-4f75-8A90-CB05B6477EEE}
OptionsInternet|{A3DD4F92-658A-410F-84FD-6FBBBEF2FFFE}
PolitiquesLocales|{62D8ED13-C9D0-4CE8-A914-47DD628FB1B0}
Performance|{78F3955E-3B90-4184-BD14-5397C15F1EFC}
OutilsPerformance|{B2C761C6-29BC-4f19-9251-E6195265BAF1}
GestionDisques|{74246bfc-4c96-11d0-abef-0020af6b0b7a}
Services|{D9EF8727-CAC2-4E60-809E-86F80A666C91}
GestionPartages|{8E908FC9-BECC-40F6-915B-F4CA0E70D03D}
GestionStockage|{BB06C0E4-D293-4f75-8A90-CB05B6477EEE}
ParametresPC|{F1B32785-6FBA-4FCF-9D55-7B8E7F157091}
CentreMobilite|{15eae92e-f17a-4431-9f28-805e482dafd4}
CentreSecurite|{994133C0-3E5F-49F9-9D47-1F3A1E6A4174}
CentreAccessibilite|{2C7BB4C4-01BB-11D3-9BC5-00C04F79EFC3}
OutilsDeDepannage|{C58C4893-3BE0-4B45-ABB5-A63E4B8C8651}
GestionCouleurs|{B2C761C6-29BC-4f19-9251-E6195265BAF1}
OptionsIndexation|{87D66A43-7B11-4A28-9811-C86EE395ACF7}
CentreSynchronisation|{F1390A9A-A3F4-4661-9A26-909F3D20F2E0}
OptionsDossier|{6DFD7C5C-2451-11D3-A299-00C04F8EF6AF}
ConnexionsDistantes|{992CFFA0-F557-101A-88EC-00DD010CCC48}
...
