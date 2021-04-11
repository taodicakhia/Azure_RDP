@echo off
echo Downloading all files...
curl --silent -O https://www.7-zip.org/a/7z1900-x64.exe
curl --silent -O https://raw.githubusercontent.com/taodicakhia/Azure_RDP/main/IDM.zip
echo Installing IDM...
powershell -command "Expand-Archive -force IDM.zip"
cd IDM
FOR %%i IN ("Internet Download Manager*.exe") DO Set FileName="%%i"
%FileName% /SILENT
cd ..
echo Installing 7-zip...
7z1900-x64.exe /S
