@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=F:\Videos\converter\Trimmer.exe
REM BFCPEICON=F:\Videos\converter\logo0.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Wallpaper Maker - Downloader and Trimmer
REM BFCPEVERDESC=Downloads youtube videos and trims them.
REM BFCPEVERCOMPANY=https://mon5termatt.club
REM BFCPEVERCOPYRIGHT=What?
REM BFCPEOPTIONEND
@ECHO ON
@echo off
echo.Welcome to my program, please use this responsibly.
echo.This program Download and Converts MKV to MP4
echo.while also trimming it for use in Wallpaper Engine
powershell -c "Invoke-WebRequest -Uri 'http://cdn.clarkit.us/files/Programs/Wallpaper_Maker/motd.txt' -OutFile './motd.txt'"
echo.------------------------------------------------------------------------
echo.
type motd.txt
del motd.txt
echo.
echo.
pause
cls
echo.            
Echo.    [1] Download a Video From Youtube
Echo.    [2] Convert the MKV to MP4
Echo.        And Trim the Video
Echo.    [3] Update and check for issues

Echo.    [4] Exit

ECHO.
choice /C:1234 /N /M ".Enter Your Choice [1,2,3,4] : "

if errorlevel 4 exit
if errorlevel 3 goto:update
if errorlevel 2 goto:trim
if errorlevel 1 goto:download







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
echo.Select your file
rem BrowseFiles
set file=%result%
set /p start="Enter START time (IN SECONDS): "
set /p duration="Enter END time (IN SECONDS): "
rem Subtract %duration% %start%
set end=%result%
HandBrakeCLI.exe -i %file% -o %file%_trim.mp4 --start-at duration:%start% --stop-at duration:%end% -e x264 -q 20.0 -r 30 —per -x264-preset fast —x264-profile baseline -O
cls
echo.Video trimming has completed, please hit any key to exit
pause
exit

:update
cls
echo.     What do you want to update:
echo.
Echo.    [1] YoutubeDL
Echo.    [2] HandBrake
Echo.    [2] FFMPEG
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
youtubedl -U
pause
goto:update
:3
echo.Step 1: Download the latest version of FFMPEG
echo.Step 2: Navigate to the bin folder
echo.Step 3: Extract the bin folder to here
start http://url.mon5termatt.club/ffmpeg
pause
goto:update

