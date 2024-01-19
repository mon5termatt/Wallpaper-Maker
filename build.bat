echo.Welcome to my program, please use it responsibly.
echo.I do not support copyright infringment so be sure to
echo.only use this program on material you own ;) 
echo.
echo.This Program Download and Converts MKV/WEBM to MP4
echo.While also trimming it for use in Wallpaper Engine
echo.
pause
:start
cls
echo.            
Echo.    [1] Download a Video From Youtube
Echo.    [2] Convert the Video to MP4
Echo.    [3] Convert And Trim the Video
Echo.    [4] Exit
echo.
echo.
Set /P _num=Enter Your Choice [1-5] : || Set _num=NothingChosen
If "%_num%"=="NothingChosen" goto error
If /i "%_num%"=="1" goto download
If /i "%_num%"=="2" set edit=no && cls && goto trim
If /i "%_num%"=="3" set edit=yes && cls && goto trim
If /i "%_num%"=="4" exit
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
echo.Enter Start Time: 
set /p hr="Hours: "
set /p mn="Minutes: "
set /p sc="Seconds: "
rem Multiply %hr% 3600
set ct1=%result%
rem Multiply %mn 60 
set ct2=%result%
rem Add %ct1% %ct2%
set ct3=%result%
rem Add %ct3% %sc%
set start=%result%
set result=
echo.Enter End Time: 
set /p hr="Hours: "
set /p mn="Minutes: "
set /p sc="Seconds: "
rem Multiply %hr% 3600
set ct1=%result%
rem Multiply %mn 60 
set ct2=%result%
rem Add %ct1% %ct2%
set ct3=%result%
rem Add %ct3% %sc%
set end=%result%
set result=
rem Subtract %end% %start%
set duration=%result%
cls
:no
HandBrakeCLI.exe -i %file% -o %file%_trim.mp4 --start-at duration:%start% --stop-at duration:%duration% -e x264 -q 20.0 -r 30 —per -x264-preset fast —x264-profile baseline -O
cls
echo.Video Trimming has completed, Please hit any key to exit...
pause > nul
exit
