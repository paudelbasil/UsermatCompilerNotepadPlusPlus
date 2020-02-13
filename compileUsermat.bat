REM Created by: Basil J. Paudel
REM Date: 2/13/2020
REM *******************************************************

@echo off
SETLOCAL
REM *************************************************************
REM ********* Retrieve filepath of the usermat to compile *******
REM ********* You need to pass file information when calling ****
REM ********* this script from Notepad++ $(FULL_CURRENT_PATH) ***
REM ********* D:\compileUsermat.bat $(FULL_CURRENT_PATH) ********
REM ********* Run the above command line from Notepad++ *********
REM *************************************************************

Set filename=%1
For %%A in ("%filename%") do (
    Set Folder=%%~dpA
    Set Name=%%~nxA
)
echo.Folder is: %Folder%
REM echo.Name is: %Name%

cd /d %Folder%
echo %cd%
REM copy ansys compiler if it's not present in the current directory

:CheckForFile

if exist "%Folder%ANSUSERSHARED.bat" goto RunCompiler
echo "FILE NOT FOUND. COPYING..."

REM *******************************************************
REM *********** PATH FOR ANSYS UPF BAT COMPILER ***********
REM *******************************************************
Set foo="C:\Program Files\Ansys Inc\v194\ansys\custom\user\winx64\ANSUSERSHARED.bat"

if not exist %foo% goto end1
copy %foo% %Folder%
pause

:RunCompiler
%Folder%ANSUSERSHARED.bat
more link.log
pause
goto end2 

:end1
echo "FILE SOURECE NOT FOUND"
pause

:end2
