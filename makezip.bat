@echo off
rem Get the folder path of the executed batch file
set "folderPath=%~dp0"
rem Get the folder name
for %%F in ("%folderPath:~0,-1%") do set "folderName=%%~nF"
rem Add .7zip at the end of the folder name
set "archiveName=%folderName%.7z"

rem Delete any existing archive with the same name
if exist "%archiveName%" del "%archiveName%"

rem Run 7z.exe to create the archive
7z.exe a "%archiveName%" .\bin
7z.exe a "%archiveName%" .\r6