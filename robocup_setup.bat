:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process -Verb runAs -FilePath '%~0'"
    exit /b
)

:: Your main commands go here
echo Running as administrator!

echo Installing pyenv
powershell -command "Set-ExecutionPolicy Unrestricted"
cd Desktop
mkdir Robocup
cd Robocup

powershell -command "Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1" "
pause
pyenv
pip install gym==0.24.1
pip install pybullet

pause