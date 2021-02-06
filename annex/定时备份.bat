set BACKUPDATE=%date:~0,4%%date:~5,2%%date:~8,2%
set USER=****
set PASSWORD=****
set DATABASE=****
if not exist "D:\app\Administrator\flash_recovery_area\wjgis\BACKUPSET\backup\data"       mkdir D:\app\Administrator\flash_recovery_area\wjgis\BACKUPSET\backup\data
if not exist "D:\app\Administrator\flash_recovery_area\wjgis\BACKUPSET\backup\log"        mkdir D:\app\Administrator\flash_recovery_area\wjgis\BACKUPSET\backup\log
set DATADIR=D:\app\Administrator\flash_recovery_area\wjgis\BACKUPSET\backup\data
set LOGDIR=D:\app\Administrator\flash_recovery_area\wjgis\BACKUPSET\backup\log
exp %USER%/%PASSWORD%@%DATABASE% file=%DATADIR%\data_%BACKUPDATE%.dmp log=%LOGDIR%\log_%BACKUPDATE%.log
forfiles /p "%DATADIR%" /s /m *.* /d -3 /c "cmd /c del @path"
forfiles /p "%LOGDIR%" /s /m *.* /d -3 /c "cmd /c del @path"
exit