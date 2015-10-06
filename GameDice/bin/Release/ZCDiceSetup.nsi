;Include Modern UI

  !include "MUI2.nsh"
  !include "FileAssociation.nsh"

Name "ZC Dice 1"
OutFile "ZCDice1Setup.exe"
InstallDir "$PROGRAMFILES\Zeta Centauri\ZC Dice"
InstallDirRegKey HKLM "Software\ZC Dice" "Install_Dir"
RequestExecutionLevel admin
!define MUI_ICON "ZCDice.ico"
!define MUI_UNICON "ZCDice.ico"

;Version Information

  VIProductVersion "1.0.0.0"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "ZC Dice"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "Zeta Centauri"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright 2010-2012 Zeta Centauri"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "ZC Dice Installer"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "1.0.0.0"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "1.0.0.0"

;Interface Settings

  !define MUI_ABORTWARNING

;Pages

  !insertmacro MUI_PAGE_LICENSE "License.txt"
;  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
      !define MUI_FINISHPAGE_NOAUTOCLOSE
      !define MUI_FINISHPAGE_RUN
      !define MUI_FINISHPAGE_RUN_CHECKED
      !define MUI_FINISHPAGE_RUN_TEXT "Launch ZC Dice"
      !define MUI_FINISHPAGE_RUN_FUNCTION "LaunchProgram"
      !define MUI_FINISHPAGE_SHOWREADME ""
      !define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
      !define MUI_FINISHPAGE_SHOWREADME_TEXT "Create Desktop Shortcut"
      !define MUI_FINISHPAGE_SHOWREADME_FUNCTION finishpageaction
  !insertmacro MUI_PAGE_FINISH
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;Languages
 
  !insertmacro MUI_LANGUAGE "English"


; The stuff to install
Section "ZC Dice"

  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File "ZCDice.exe"
  File "License.txt"
  File "ZCDice.ico"
  
  ; Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\ZCDice "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ZCDice" "DisplayName" "ZC Dice"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ZCDice" "DisplayVersion" "1"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ZCDice" "Publisher" "Zeta Centauri"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ZCDice" "DisplayIcon" "$INSTDIR\ZCDice.ico"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ZCDice" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ZCDice" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ZCDice" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
  
SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\Zeta Centauri\ZC Dice"
  CreateShortCut "$SMPROGRAMS\Zeta Centauri\ZC Dice\ZC Dice.lnk" "$INSTDIR\ZCDice.exe" "" "" 0
  ;CreateShortCut "$SMPROGRAMS\Zeta Centauri\ZC Dice\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  WriteINIStr "$SMPROGRAMS\Zeta Centauri\ZC Dice\ZC Dice Website.url" "InternetShortcut" "URL" "http://zetacentauri.com/software_zcdice.htm"
  
SectionEnd

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ZCDice"
  DeleteRegKey HKLM SOFTWARE\ZCDice

  ; Remove files and uninstaller
  Delete $INSTDIR\ZCDice.exe
  Delete $INSTDIR\License.txt
  Delete $INSTDIR\uninstall.exe
  Delete $INSTDIR\ZCDice.ico

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\Zeta Centauri\ZC Dice\*.*"
  Delete "$DESKTOP\ZC Dice.lnk"
  Delete "$SMPROGRAMS\Zeta Centauri\ZC Dice\ZC Dice Website.url"
  ;DeleteINISec "$SMPROGRAMS\Zeta Centauri\ZC Dice\ZC Dice Website.url" "InternetShortcut"

  ; Remove directories used
  RMDir "$SMPROGRAMS\Zeta Centauri\ZC Dice"
  RMDir "$SMPROGRAMS\Zeta Centauri"
  RMDir "$INSTDIR"


SectionEnd

Function LaunchProgram
  ExecShell "" "$SMPROGRAMS\Zeta Centauri\ZC Dice\ZC Dice.lnk"
FunctionEnd

Function finishpageaction
  CreateShortcut "$DESKTOP\ZC Dice.lnk" "$instdir\ZCDice.exe"
FunctionEnd