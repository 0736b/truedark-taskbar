@echo off

REM Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please run the script as an administrator.
    pause
    exit /b
)

echo Editing Explorer's shell icon registry value...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /t REG_SZ /d "%windir%\System32\shell32.dll,-50" /f
echo Registry value edited successfully.

echo Restarting Windows Explorer...
taskkill /f /im explorer.exe
start explorer.exe

echo Disabled shortcut arrow icon!.
