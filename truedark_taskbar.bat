@echo off

REM Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please run the script as an administrator.
    pause
    exit /b
)

echo Editing Explorer's accent registry value...
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d 0000000000000000000000000000000000000000000000000000000000000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d 0 /f
echo Registry value edited successfully.

echo Setting Show accent color on Start, taskbar, and action center...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d 1 /f

echo Restarting Windows Explorer...
taskkill /f /im explorer.exe
start explorer.exe

echo True dark taskbar!.