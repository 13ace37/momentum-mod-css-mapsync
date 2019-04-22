@ECHO off
:require

CALL config.bat


GOTO configCheck


:configCheck

if %cssDir% == "" goto cssDirE1
if %momDir% == "" goto momDirE1
if not exist %cssDir% goto cssDirE2
echo [+] css directory seems to be valid
if not exist %momDir% goto momDirE2
echo [+] momentum directory seems to be valid

set cssMapDir="%cssDir:"=%\cstrike\download\maps"
if not exist %cssMapDir% goto cssDirE2
echo [+] css map directory seems to be valid
set momMapDir="%momDir:"=%\maps"
if not exist %momMapDir% goto momDirE2
echo [+] momentum map directory seems to be valid


goto syncMaps



:cssDirE1
color 04
echo no css directory defined!
pause > NUL
exit

:momDirE1
color 04
echo no momentum directory defined!
pause > NUL
exit

:cssDirE2
color 04
echo css directory invalid!
pause > NUL
exit

:momDirE2
color 04
echo momentum directory invalid!
pause > NUL
exit


:syncMaps

CALL "util\backupMaps.bat"
CALL "util\symlink.bat"


pause
exit > NUL