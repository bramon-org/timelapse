@echo off
set ffmpeg_path="c:\bramon\tools\ffmpeg.exe"

set sourcefolder=%1
set extension=%2

if %1.==. set sourcefolder="."

if %2.==. set extension="jpg"

(for /r "%sourcefolder%" %%i in ("*=*.%extension%") do @echo file '%%i') > concat.txt

%ffmpeg_path% -r 24 -f concat -i concat.txt -s hd1080 -vcodec libx264 -crf 18 -preset slow timelapse.mp4

del concat.txt