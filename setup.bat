@echo off
setlocal enabledelayedexpansion

REM === VARIABLES ===
set "VS_INSTALLER=%TEMP%\VSCodeSetup.exe"
set "SETTINGS_URL=https://raw.githubusercontent.com/iliyasbt0569/vscode-clear-setup/refs/heads/main/settings.json"
set "SETTINGS_PATH=%APPDATA%\Code\User\settings.json"
set "CODE_PATH=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd"

echo.
echo [1/5] Downloading latest VS Code installer...
curl -L "https://update.code.visualstudio.com/latest/win32-x64-user/stable" -o "%VS_INSTALLER%"

echo.
echo [2/5] Installing VS Code silently with Add to PATH...
start /wait "vscode setup" "%VS_INSTALLER%" /VERYSILENT /MERGETASKS=!runcode,addcontextmenufiles,addcontextmenufolders,addtopath

echo.
echo [3/5] Installing Ayu Theme extension...
"%CODE_PATH%" --install-extension teabyii.ayu

echo.
echo [4/5] Downloading and applying settings.json...
curl -L "%SETTINGS_URL%" -o "%SETTINGS_PATH%"

echo.
echo [5/5] Launching VS Code...
start "vscode" "code"

echo.
echo ✅ VS Code setup complete!
pause
