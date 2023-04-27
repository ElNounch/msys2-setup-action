@start /WAIT /B %MSYS2_CMD% -here -defterm -shell bash -no-start %*
@exit %ErrorLevel%
