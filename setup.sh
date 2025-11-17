#!/bin/bash
# Face Recognition App Setup Script
# Works on macOS, Linux, and Windows (with Git Bash)

echo "🚀 Setting up Face Recognition App..."

# Check Python version
python_version=$(python --version 2>&1)
if [[ $python_version == *"Python 3"* ]]; then
    echo "✅ Python found: $python_version"
else
    echo "❌ Python 3 is required. Please install Python 3.8 or higher."
    exit 1
fi

# Create virtual environment
echo "📦 Creating virtual environment..."
python -m venv .venv

# Activate virtual environment
echo "🔄 Activating virtual environment..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Windows
    source .venv/Scripts/activate
else
    # macOS/Linux
    source .venv/bin/activate
fi

# Upgrade pip
echo "⬆️ Upgrading pip..."
python -m pip install --upgrade pip

# Install requirements
echo "📚 Installing dependencies..."
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    echo "❌ requirements.txt not found!"
    exit 1
fi

# Set up environment file
if [ ! -f ".env" ]; then
    echo "⚙️ Setting up environment file..."
    cp .env.example .env
    echo "📝 Please edit .env file with your SECRET_KEY and DATABASE_URL"
    echo "💡 Tip: Run 'python -c \"import secrets; print(secrets.token_hex(32))\"' to generate a SECRET_KEY"
else
    echo "✅ .env file already exists"
fi

# Create known_person directory
mkdir -p known_person
echo "📁 Created known_person directory for face images"

echo ""
echo "🎉 Setup complete! Next steps:"
echo "1. Edit .env file with your SECRET_KEY"
echo "2. Run: python app.py"
echo "3. Open: http://127.0.0.1:5000"
echo ""
echo "📖 See README.md for detailed usage instructions"