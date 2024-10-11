@echo off
setlocal

:: Set the source and destination folders
set "source_folder=H:\GitHub\cyberscript-mod-template\bin\x64\plugins\cyber_engine_tweaks\mods\mytemplate\libs"
set "destination_folder=H:\GitHub\datapack\datapack"

:: Set the file name to check and replace (without path)
set "file_name=cyberlibs.lua"

:: Check and replace matching files in destination subfolders
for /r "%destination_folder%" %%f in (*) do (
    if /i "%%~nxf"=="%file_name%" (
        if exist "%source_folder%\%file_name%" (
            echo Replacing "%%f" with "%source_folder%\%file_name%"
            copy /y "%source_folder%\%file_name%" "%%f"
        )
    )
)

echo File check and replace completed for %file_name%.


set "source_folder=H:\GitHub\cyberscript-mod-template\bin\x64\plugins\cyber_engine_tweaks\mods\mytemplate"

:: Set the file name to check and replace (without path)
set "file_name=init.lua"

:: Check and replace matching files in destination subfolders
for /r "%destination_folder%" %%f in (*) do (
    if /i "%%~nxf"=="%file_name%" (
        if exist "%source_folder%\%file_name%" (
            echo Replacing "%%f" with "%source_folder%\%file_name%"
            copy /y "%source_folder%\%file_name%" "%%f"
        )
    )
)

echo File check and replace completed for %file_name%.



:: Set the source and destination folders
set "source_folder=H:\GitHub\cyberscript-mod-template\bin\x64\plugins\cyber_engine_tweaks\mods\mytemplate\libs"
set "destination_folder=G:\SteamLibrary\steamapps\common\Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods"

:: Set the file name to check and replace (without path)
set "file_name=cyberlibs.lua"

:: Check and replace matching files in destination subfolders
for /r "%destination_folder%" %%f in (*) do (
    if /i "%%~nxf"=="%file_name%" (
        if exist "%source_folder%\%file_name%" (
            echo Replacing "%%f" with "%source_folder%\%file_name%"
            copy /y "%source_folder%\%file_name%" "%%f"
        )
    )
)

echo File check and replace in mods folder completed for %file_name%.
pause
