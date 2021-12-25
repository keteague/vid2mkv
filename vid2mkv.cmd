@echo off
goto :start


File: vid2mkv
Version: 1.0.2021.12.25.1406
Description: Convert video files to MKV format
Author: Ken Teague
Email: kteague at pobox dot com


:start
set _ffmpeg="C:\Program Files\ffmpeg\bin\ffmpeg.exe"


if not exist %_ffmpeg% goto :noffmpeg
if [%1]==[] goto :help


:convert
echo Converting file to MKV format...
%_ffmpeg% -i "%1" -acodec copy -vcodec copy "%~n1.mkv"
del "%1"
goto:eof


:help
echo.
echo vid2mkv
echo Convert video files to MKV format.
echo.
echo Syntax:
echo     %0 "My Video File.mp4"
echo.
goto:eof


:noffmpeg
echo.
echo Missing: ffmpeg.exe
echo Aborting!
echo.
echo FFMPEG is required to convert video files from MP4 to MKV.
echo You can download FFMPEG from:
echo     https://www.gyan.dev/ffmpeg/builds/
echo     https://github.com/BtbN/FFmpeg-Builds/releases
echo.
echo If FFMPEG is installed, perhaps you didn't set the _ffmpeg variable.
echo.
goto:eof