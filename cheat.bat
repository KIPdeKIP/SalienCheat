@echo off
cd %~dp0
setlocal enabledelayedexpansion

if not exist php.exe (
	echo PHP wasn't detected; we'll download and install it for you.
	PowerShell -ExecutionPolicy Unrestricted -File "downloadphp.ps1"
)

if not exist gettoken.json (
	echo Missing gettoken.json
	echo Please navigate to https://steamcommunity.com/saliengame/gettoken and save the page in its entirety into this folder as gettoken.json
	echo Press any key to continue . . .
	pause >nul
)

echo The script can be terminated at any time by pressing Ctrl-C

:start
php cheat.php
goto start
