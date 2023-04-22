@echo off
set ARGS='-here','-defterm','-shell','bash'
:Loop
If "%~1" == "" GoTo Done
Set ARGS=%ARGS%,'%~1'
Shift
GoTo Loop
:Done
Rem PushD %MSYS2_ROOT%
powershell -Command "{Exit (Start-Process -NoNewWindow -Wait -FilePath $env:MSYS2_CMD -ArgumentList @( %ARGS% ) -PassThru).ExitCode}"
Set Err=%ErrorLevel%
Rem PopD
Exit %Err%
