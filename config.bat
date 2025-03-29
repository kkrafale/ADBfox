::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBBfXgWEPWe/RrkV5uz0086CsUYJW/IDVoDN2/SeIfMH6wWsJ98R0HNWndgwBRhXcFyibQBU
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdFy5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBBfXgWEPWe/RrkV5uz0086CsUYJW/IDVoDN2/SeIfMH6wWsJ98R91h+nsQUQh5Ae3I=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
cls
title ADBfox 1.8 - Android Debug Bridge Tool
color 0A

:: ASCII Art
echo.
echo       ===                     ===       
echo      =+++=        --:::-    ==++=       
echo       +++=-: :::::::::::::::=+++=       
echo        ==--::::::::::::::::::-==        
echo       ::::::::::::::::::::::::::        
echo %%%%%%=::::::::::::::::::::::::::=#%%%%%#
echo %@@% -=+**=::::::::::::::::::::::::  %@@%
echo %@%#**#######***-::::::--::::--:=++ %@% 
echo %%*#######%%####%#++++#*###%######*#%%% 
echo  %%#####%@@%###%#+++++#%##%@@%#####*%%% 
echo  +######%@%#####+++++++#%##%@%#######%  
echo =-=##########%#++=====++*%##########+-= 
echo ----=+*####*+++========++++*####*+=---= 
echo ==++++********+++++++++++*******++++==  
echo.
echo ============================================
echo           ADBfox 1.8 - Android Debug Bridge
echo ============================================
echo 1 - List connected devices
echo 2 - Restart device
echo 3 - Reboot to bootloader
echo 4 - Reboot to recovery
echo 5 - Install APK
echo 6 - Execute ADB sideload
echo 7 - Open ADB shell
echo 8 - Exit
echo ============================================
echo.
set /p option="Select an option: "

if "%option%"=="1" goto list_devices
if "%option%"=="2" goto restart_device
if "%option%"=="3" goto reboot_bootloader
if "%option%"=="4" goto reboot_recovery
if "%option%"=="5" goto install_apk
if "%option%"=="6" goto sideload
if "%option%"=="7" goto open_shell
if "%option%"=="9" goto change_color
if "%option%"=="8" exit

:list_devices
echo Listing connected devices...
cd /d "%~dp0files"
adb devices
pause
goto menu

:restart_device
echo Restarting device...
cd /d "%~dp0files"
adb reboot
pause
goto menu

:reboot_bootloader
echo Rebooting to bootloader...
cd /d "%~dp0files"
adb reboot bootloader
pause
goto menu

:reboot_recovery
echo Rebooting to recovery...
cd /d "%~dp0files"
adb reboot recovery
pause
goto menu

:install_apk
echo Please enter the path to the APK file:
set /p apk_path="APK Path: "
cd /d "%~dp0files"
adb install "%apk_path%"
pause
goto menu

:sideload
echo Please select the ZIP file to sideload:
set /p zip_file="ZIP File Path: "
cd /d "%~dp0files"
adb sideload "%zip_file%"
pause
goto menu

:open_shell
echo Opening ADB shell...
cd /d "%~dp0files"
adb shell
pause
goto menu

:change_color
cls
echo Select a color scheme:
echo 1 - Green
echo 2 - Blue
echo 3 - Red
echo 4 - Yellow
echo 5 - Rainbow
echo 6 - Back to main menu
set /p color_option="Choose an option: "

if "%color_option%"=="1" color 0A & goto menu
if "%color_option%"=="2" color 1F & goto menu
if "%color_option%"=="3" color 4F & goto menu
if "%color_option%"=="4" color 6F & goto menu
if "%color_option%"=="5" goto rainbow
if "%color_option%"=="6" goto menu

:rainbow
:: Rainbow color effect without restarting the script
cls
echo Running rainbow colors! Press any key to stop...
:rainbow_effect
color 0A
timeout /t 1 >nul
color 0B
timeout /t 1 >nul
color 0C
timeout /t 1 >nul
color 0D
timeout /t 1 >nul
color 0E
timeout /t 1 >nul
color 0F
timeout /t 1 >nul
if not exist "C:\Windows\System32\nircmd.exe" exit
goto rainbow_effect

:menu
cls
goto start
