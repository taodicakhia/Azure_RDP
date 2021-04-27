@echo off
title VPS-Azure
curl --silent -O https://raw.githubusercontent.com/TheDarkMythos/Ngrok-Exe/master/ngrok.exe 
curl --silent -O https://raw.githubusercontent.com/taodicakhia/Azure_RDP/main/NGROK-CHECK.bat
copy ngrok.exe C:\Windows\System32 >nul
start NGROK.bat >nul
curl --silent ifconfig.co/json > info.txt
type info.txt | jq -r .ip > ip.txt
type info.txt | jq -r .country_iso > country_iso.txt
type info.txt | jq -r .country > country.txt
set /p IP=<ip.txt
set /P RE=<country_iso.txt
set /P LO<=country.txt
if %RE%==US (start ngrok tcp 3389)
if %RE%==CA (start ngrok tcp 3389)
if %RE%==HK (start ngrok tcp --region ap 3389)
if %RE%==SG (start ngrok tcp --region ap 3389)
if %RE%==NL (start ngrok tcp --region eu 3389)
if %RE%==IE (start ngrok tcp --region eu 3389)
if %RE%==GB (start ngrok tcp --region eu 3389)
if %RE%==BR (start ngrok tcp --region sa 3389)
if %RE%==AU (start ngrok tcp --region au 3389)
if %RE%==IN (start ngrok tcp --region in 3389)
NGROK-CHECK.bat
