@echo off
REM Check if Chocolatey is installed
choco -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Chocolatey is not installed. Installing Chocolatey...
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
) ELSE (
    echo Chocolatey is already installed.
)

REM Specify the virtual environment directory
SET VENV_DIR=path\to\your\virtual\environment

REM Check if the virtual environment exists
IF EXIST "%VENV_DIR%" (
    echo Activating the virtual environment...
    CALL "%VENV_DIR%\Scripts\activate.bat"
) ELSE (
    echo Virtual environment does not exist. Creating the virtual environment...
    python -m venv "%VENV_DIR%"
    IF EXIST "%VENV_DIR%" (
        echo Virtual environment created. Activating...
        CALL "%VENV_DIR%\Scripts\activate.bat"
    ) ELSE (
        echo Failed to create virtual environment. Please check the path and try again.
        pause
        exit /b 1
    )
)

REM Install pytesseract in the virtual environment
echo Installing pytesseract...
pip install pytesseract
pip install keyauth


echo Setup completed.
pause
