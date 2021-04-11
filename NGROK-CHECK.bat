@echo off
echo Downloading all files...
curl --silent -O https://www.7-zip.org/a/7z1900-x64.exe
curl --silent -O
echo Installing IDM...
powershell -command "Expand-Archive -force IDM.zip"
cd IDM
FOR %%i IN ("Internet Download Manager*.exe") DO Set FileName="%%i"
%FileName% /SILENT
echo Installing 7-zip...
7z1900-x64.exe /S
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator taodicakhia /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
echo To change another VM region, Create new organization (Your current VM location:  %LO% )
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, please paste new NGROK TOKEN in YML. Check Tunnel here: https://dashboard.ngrok.com/status/tunnels " && exit
echo User: administrator
echo Pass: taodicakhia
ping -n 999999 10.10.0.10 >nul
