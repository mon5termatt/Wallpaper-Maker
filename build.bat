@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=F:\Videos\converter\Downloader And Trimmer.exe
REM BFCPEICON=F:\Videos\converter\logo0.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.3.0.0
REM BFCPEVERPRODUCT=Wallpaper Maker - Downloader and Trimmer
REM BFCPEVERDESC=Downloads youtube videos and trims them.
REM BFCPEVERCOMPANY=https://mon5termatt.club
REM BFCPEVERCOPYRIGHT=What?
REM BFCPEOPTIONEND
@ECHO ON
@echo off

echo.Welcome to my program, please use it responsibly.
echo.I do not support copyright infringment so be sure to
echo.only use this program on material you own ;) 
echo.
echo.This Program Download and Converts MKV/WEBM to MP4
echo.While also trimming it for use in Wallpaper Engine
powershell -c "Invoke-WebRequest -Uri 'http://cdn.mon5termatt.club/files/Programs/Wallpaper_Maker/v1300.txt' -OutFile './motd.txt'"
echo.------------------------------------------------------------------------
type motd.txt
del motd.txt
echo.
pause
:start
cls
echo.            
Echo.    [1] Download a Video From Youtube
Echo.    [2] Convert the Video to MP4
Echo.    [3] Convert And Trim the Video
Echo.    [4] Update Requirements
Echo.    [5] Exit
echo.
echo.
Set /P _num=Enter Your Choice [1-5] : || Set _num=NothingChosen
If "%_num%"=="NothingChosen" goto error
If /i "%_num%"=="1" goto download
If /i "%_num%"=="2" set edit=no && cls && goto trim
If /i "%_num%"=="3" set edit=yes && cls && goto trim
If /i "%_num%"=="4" goto update
If /i "%_num%"=="5" exit
:error
echo.Invalid option
timeout 3 > nul
cls
goto start
:download
cls
set url=https://www.youtube.com/watch?v=dQw4w9WgXcQ
set /p url="Paste URL: "
echo.Read more about modifiers on the Youtube DL page
echo.If using a playlist but you only want THAT video
echo.Use --no-playlist as the modifier
set /p mod="Paste Optional Modifiers: "
cls
youtube-dl %url% %mod% --no-progress --ignore-config
:: Clear URLS
set "url="
set "mod="
echo.
echo.-----------------------------------
echo.
echo. [1] Download Another
echo. [2] Convert and Trim
echo.
choice /C:12 /N /M ".Enter Your Choice [1,2] : "
if errorlevel 2 goto:trim
if errorlevel 1 goto:download
:trim
cls
echo.Select your file
rem BrowseFiles
set file=%result%
goto %edit%
:yes
set /p start="Enter START time (IN SECONDS): "
set /p duration="Enter END time (IN SECONDS): "
rem Subtract %duration% %start%
set end=%result%
:no
HandBrakeCLI.exe -i %file% -o %file%_trim.mp4 --start-at duration:%start% --stop-at duration:%end% -e x264 -q 20.0 -r 30 —per -x264-preset fast —x264-profile baseline -O
cls
echo.Video Trimming has completed, Please hit any key to exit...
pause > nul
exit
:update
cls
echo.     What do you want to update:
echo.
Echo.    [1] YoutubeDL
Echo.    [2] HandBrake
Echo.    [3] FFMPEG
echo.    [4] Exit
choice /C:1234 /N /M ".Enter Your Choice [1,2,3,4] : "
if errorlevel 4 exit
if errorlevel 3 goto:3
if errorlevel 2 goto:2
if errorlevel 1 goto:1
:2
echo.Download the latest version of Handbrake
echo.Then drag it into the folder and overwrite the old file 
start http://url.mon5termatt.club/handbrake
pause
goto:update
:1
echo.Download the latest version of Youtube DL
echo.Then drag it into the folder and overwrite the old file 
start http://url.mon5termatt.club/youtubedl
pause
goto:update
:3
echo.Step 1: Download the latest version of FFMPEG
echo.Step 2: Navigate to the bin folder
echo.Step 3: Extract the bin folder to here
start http://url.mon5termatt.club/ffmpeg
pause
goto:update