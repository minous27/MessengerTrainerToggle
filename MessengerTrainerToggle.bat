::This Batch File will assist in changing out the DLL for The Messenger so you can uninstall the Trainer more easily.
::Get the argument passed in for which DLL to provide (real or mod).
@echo off

set arg1=%1

ECHO "%arg1%"

IF NOT DEFINED arg1 (
	ECHO Please provide an argument to this batch file. 'real' for real game install and 'trainer' for trainer install.
	EXIT /B 1
)

::Get the location for that DLL and the destination location for the DLL.
For /F "tokens=1* delims==" %%A in (MessengerTrainerToggleBat.properties) DO (
	IF "%%A"=="MESSENGER_REAL_DLL_LOCATION" set MESSENGER_REAL_DLL_LOCATION=%%B
	IF "%%A"=="MESSENGER_MOD_DLL_LOCATION" set MESSENGER_MOD_DLL_LOCATION=%%B
	IF "%%A"=="MESSENGER_DLL_INSTALL_LOCATION" set MESSENGER_DLL_INSTALL_LOCATION=%%B
)

ECHO "%MESSENGER_REAL_DLL_LOCATION%"
ECHO "%MESSENGER_MOD_DLL_LOCATION%"
ECHO "%MESSENGER_DLL_INSTALL_LOCATION%"

::Move the DLL to the required location.

IF "%arg1%"=="real" (
	COPY /Y "%MESSENGER_REAL_DLL_LOCATION%" "%MESSENGER_DLL_INSTALL_LOCATION%"
	IF %ERRORLEVEL% == 0 (ECHO Installed Real DLL file "%MESSENGER_REAL_DLL_LOCATION%" to location "%MESSENGER_DLL_INSTALL_LOCATION%". Godspeed Messenger!)	
) ELSE IF "%arg1%"=="trainer" (
	COPY /Y "%MESSENGER_MOD_DLL_LOCATION%" "%MESSENGER_DLL_INSTALL_LOCATION%"
	IF %ERRORLEVEL% == 0 (ECHO Installed Real DLL file "%MESSENGER_MOD_DLL_LOCATION%" to location "%MESSENGER_DLL_INSTALL_LOCATION%". Let the training begin!)
) ELSE (
	ECHO Please provide a valid argument. 'real' for real game install and 'trainer' for trainer install.
)