@echo off
REM Face Recognition App Setup Script for Windows
echo 🚀 Setting up Face Recognition App...

REM Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python not found. Please install Python 3.8 or higher.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('python --version') do set python_version=%%i
echo ✅ Python found: %python_version%

REM Create virtual environment
echo 📦 Creating virtual environment...
python -m venv .venv

REM Activate virtual environment
echo 🔄 Activating virtual environment...
call .venv\Scripts\activate.bat

REM Upgrade pip
echo ⬆️ Upgrading pip...
python -m pip install --upgrade pip

REM Install requirements
echo 📚 Installing dependencies...
if exist requirements.txt (
    pip install -r requirements.txt
) else (
    echo ❌ requirements.txt not found!
    pause
    exit /b 1
)

REM Set up environment file
if not exist .env (
    echo ⚙️ Setting up environment file...
    copy .env.example .env
    echo 📝 Please edit .env file with your SECRET_KEY and DATABASE_URL
    echo 💡 Tip: Run 'python -c "import secrets; print(secrets.token_hex(32))" to generate a SECRET_KEY
) else (
    echo ✅ .env file already exists
)

REM Create known_person directory
if not exist known_person mkdir known_person
echo 📁 Created known_person directory for face images

echo.
echo 🎉 Setup complete! Next steps:
echo 1. Edit .env file with your SECRET_KEY
echo 2. Run: python app.py
echo 3. Open: http://127.0.0.1:5000
echo.
echo 📖 See README.md for detailed usage instructions
pause