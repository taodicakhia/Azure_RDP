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
net user administrator THTH-channel /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
echo To change another VM region, Create New organization (Your current VM location:  %LO% )
echo Region Available: West Europe, Central US, East Asia, Brazil South, Canada Central, Autralia East, UK South, South India
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Rerun failed jobs to get a new RDP.
net user installer /delete
curl -o "C:\Users\Public\Desktop\Readme-create-by-TinHocThucHanh.txt" https://raw.githubusercontent.com/eweiss2021/Azure_RDP/main/Readme-create-by-TinHocThucHanh.txt > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\SetupBrowser.zip" https://raw.githubusercontent.com/eweiss2021/Azure_RDP/main/SetupBrowser.zip > out.txt 2>&1
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, please paste new NGROK TOKEN in YML. Check Tunnel here: https://dashboard.ngrok.com/status/tunnels " && exit
echo User: administrator
echo Pass: THTH-channel
echo View more: https://youtube.com/c/tinhocthuchanh
echo Visit Create VPS-RDP FREE ALL: https://www.youtube.com/playlist?list=PLMAkivgExRAQi9Mb2_uJfDoMYvdwQXPY-
ping -n 999999 10.10.0.10 >nul
