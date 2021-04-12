@echo off
echo Downloading all files...
curl --silent -O https://raw.githubusercontent.com/taodicakhia/Azure_RDP/main/IDM.exe
curl --silent -O https://www.7-zip.org/a/7z1900-x64.exe
curl --silent -O qbittorrent.exe "https://uc4c86222d8e84143fcf9d5f959a.dl.dropboxusercontent.com/cd/0/get/BMfspqqN0GGf3sJAczE5oMB6hkwRmi2RmRX_s0FWy5BMNZYP2aHqrheVwpKhlyOxwqh7UINp2CDEFMIfuGQhA3puARodmJ9XC-K58XRKv1XbZqeplAuqr_9Y-z4sF2rSDIruh8mvTki8yU6bxZ3O3TgD/file"
echo Installing IDM...
IDM.exe /SILENT
echo Installing 7-zip...
7z1900-x64.exe /S
echo Installing qBittorrent...
qbittorrent.exe /S
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
