@echo off
setlocal enabledelayedexpansion
 
::批量去掉文件名前N个字符，如果有文件夹会搜索文件夹下的每个文件进行修改
set /p format=Please enter the file format you want to operate:
set /p deletenum=Please enter the number of characters before the file name you want to delete:
for /r %%i in (.) do (
    for /f "delims=" %%a in (' dir /b "%%i\*.%format%" 2^>nul ') do (
		set "t=%%~na"
        ren "%%i\%%a" "!t:~%deletenum%!%%~xa"
    )
)
 
pause