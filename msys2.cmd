@echo off
set ARGS='-here','-defterm','-shell','bash','-no-start'
:Loop
If "%~1" == "" GoTo Done
Set ARGS=%ARGS%,'%~1'
Shift
GoTo Loop
:Done
powershell -Command "{Exit (Start-Process -NoNewWindow -Wait -FilePath $env:MSYS2_CMD -ArgumentList @( %ARGS% ) -WorkingDirectory $pwd.Path  -PassThru).ExitCode}"
Exit %ErrorLevel%
