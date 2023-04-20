@echo off
set ARGS="%~1"
Shift
:Loop
If "%~1" == "" GoTo Done
Set ARGS=%ARGS%,'%~1'
Shift
GoTo Loop
:Done
powershell -Command "& {Exit (Start-Process -NoNewWindow -Wait -FilePath $env:MSYS2_CMD -ArgumentList $( %ARGS% ) -PassThru).ExitCode}"
Exit %ErrorLevel%
