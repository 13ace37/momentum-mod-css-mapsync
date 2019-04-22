CALL "util\getDate.bat"
echo [*] Copying momentum maps into a backup folder! This may take a while! 
if not exist "%momDir:"=%\mapsBackup %dateS%" (
    md "%momDir:"=%\mapsBackup %dateS%"
) else (
    rmdir /q /s "%momDir:"=%\mapsBackup %dateS%"
) 
xcopy /s /y /c %momMapDir% "%momDir:"=%\mapsBackup %dateS%"
echo [*] Finished!