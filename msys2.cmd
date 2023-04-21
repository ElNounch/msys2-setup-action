@echo off
set ARGS='%~1'
Shift
:Loop
If "%~1" == "" GoTo Done
Set ARGS=%ARGS%,'%~1'
Shift
GoTo Loop
:Done
PushD %MSYS2_ROOT%
powershell -Command "set-ps-debug -yrace 3 && {Exit (Start-Process -NoNewWindow -Wait -FilePath $env:MSYS2_CMD -ArgumentList @( %ARGS% ) -PassThru).ExitCode}"
Set Err=%ErrorLevel%
PopD
Exit %Err%
