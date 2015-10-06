; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{17BCC5E8-31AC-47D1-AF5E-7E5863F55FC5}
AppName=ZC Dice
AppVerName=ZC Dice 1.0
AppPublisher=Zeta Centauri, Inc
AppPublisherURL=http://zetacentauri.com
AppSupportURL=http://zetacentauri.com
AppUpdatesURL=http://zetacentauri.com
DefaultDirName={pf}\Zeta Centauri/ZC Dice
DefaultGroupName=Zeta Centauri/ZC Dice
OutputBaseFilename=ZCDice1Setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "F:\src\GameDice\GameDice\bin\Release\GameDice.exe"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\ZC Dice"; Filename: "{app}\GameDice.exe"; WorkingDir: "{app}"
Name: "{group}\{cm:ProgramOnTheWeb,ZC Dice}"; Filename: "http://zetacentauri.com/software_zcdice.htm"
Name: "{commondesktop}\ZC Dice"; Filename: "{app}\GameDice.exe"; Tasks: desktopicon; WorkingDir: "{app}"
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\ZC Dice"; Filename: "{app}\GameDice.exe"; Tasks: quicklaunchicon; WorkingDir: "{app}"

[Run]
Filename: "{app}\GameDice.exe"; Description: "{cm:LaunchProgram,ZC Dice}"; Flags: nowait postinstall skipifsilent

