@echo off
:: Check for administrator rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator Privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
echo Running with administrator privileges...


set adapter_name=Ethernet
set primary_dns=208.67.222.222
set secondary_dns=208.67.220.220

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

pause