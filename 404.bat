@echo off
:: Check for administrator rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator Privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
echo Running with administrator privileges...

:: This script sets the DNS for a network adapter
:: Replace 'Wi-Fi' or 'Ethernet' with the correct network adapter name
:: Replace '10.202.10.10' and '10.202.10.11' with the DNS servers you want to use

set adapter_name=Ethernet
set primary_dns=10.202.10.202
set secondary_dns=10.202.10.102

echo Changing DNS settings for %adapter_name%...
netsh interface ip set dns name="%adapter_name%" static %primary_dns%
netsh interface ip add dns name="%adapter_name%" %secondary_dns% index=2

:: Success message
echo DNS settings have been updated!
echo -----------------------------------------
echo.


echo Made by VeX
echo.
echo  ____   ____     ____  ___
echo  \   \ /   /____ \   \/  /
echo   \   Y   // __ \ \     / 
echo    \     /\  ___/ /     \ 
echo     \___/  \___  ___/\  \
echo -----------------------------------------
:: Wait for user input before closing
pause