# Face Recognition Flask App

A real-time face recognition web application built with Flask, OpenCV, and SQLAlchemy.

## 🚀 Quick Setup

### 1. Clone the Repository
```bash
git clone https://github.com/Rakhi-Dalabanjan/Face_recognition.git
cd Face_recognition
```

### 2. Set Up Python Virtual Environment
```bash
# Create virtual environment
python -m venv .venv

# Activate virtual environment
# On Windows:
.venv\Scripts\activate
# On macOS/Linux:
source .venv/bin/activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Set Up Environment Variables
```bash
# Copy the example environment file
copy .env.example .env  # Windows
# cp .env.example .env    # macOS/Linux

# Edit .env file and add your values:
# - SECRET_KEY: A secure random string for Flask sessions
# - DATABASE_URL: Your database connection string (optional, defaults to SQLite)
```

### 5. Run the Application
```bash
python app.py
```

The app will be available at `http://127.0.0.1:5000`

## 📋 Features

- **Real-time Face Detection**: Uses webcam for live face detection
- **Face Recognition**: Identifies known persons from uploaded training images
- **Person Management**: Add new people with multiple training images
- **Privacy-First**: Face images are stored locally, never in version control
- **Database Support**: SQLite (default) or MySQL/PostgreSQL via environment variables

## 🔧 System Requirements

- Python 3.8 or higher
- Webcam access for live face detection
- 2GB RAM minimum (4GB recommended for better performance)

### Required System Libraries
**Windows**: Usually included with Python
**Ubuntu/Debian**:
```bash
sudo apt-get update
sudo apt-get install python3-opencv libgl1-mesa-glx libglib2.0-0
```
**macOS**: 
```bash
brew install opencv
```

## 📁 Project Structure

```
├── app.py              # Main Flask application
├── models.py           # Database models
├── requirements.txt    # Python dependencies
├── Procfile           # For deployment (Heroku/AWS)
├── Dockerfile         # Container deployment
├── .env.example       # Environment variables template
├── .gitignore         # Git ignore rules
├── templates/         # HTML templates
│   ├── index.html     # Main face recognition page
│   └── add_person.html # Add person form
├── known_person/      # Face training images (local only)
└── instance/          # SQLite database (auto-created)
```

## 👤 Adding People for Recognition

1. Navigate to `http://127.0.0.1:5000/add_person`
2. Fill in person details (name, email, phone, DOB)
3. Upload 3-5 clear face images of the person
4. Images will be stored in `known_person/[name]/` folder locally

**Important**: Face images are never committed to Git for privacy reasons.

## 🚀 Deployment Options

### Option 1: AWS Elastic Beanstalk
```bash
# Install EB CLI
pip install awsebcli

# Initialize and deploy
eb init -p python-3.11 face-recognition-app
eb create production
eb setenv SECRET_KEY=your-secret-key DATABASE_URL=your-db-url
eb deploy
```

### Option 2: Docker
```bash
# Build image
docker build -t face-recognition .

# Run container
docker run -p 5000:5000 -e SECRET_KEY=your-key face-recognition
```

### Option 3: Heroku
```bash
# Install Heroku CLI, then:
heroku create your-app-name
heroku config:set SECRET_KEY=your-secret-key
git push heroku main
```

## 🔒 Security & Privacy

- ✅ Face images stored locally only (never in Git)
- ✅ Database credentials via environment variables
- ✅ HTTPS recommended for production
- ✅ Session security with SECRET_KEY

See `SECURITY_PRIVACY.md` for detailed security guidelines.

## 🐛 Troubleshooting

### Common Issues:

**"No module named 'cv2'"**: Install OpenCV
```bash
pip install opencv-python opencv-contrib-python
```

**Camera access denied**: Check browser permissions for camera access

**"No face detected"**: Ensure good lighting and face is clearly visible

**Database errors**: Check DATABASE_URL in .env file

### Performance Tips:
- Use good lighting for better face detection
- Provide 3-5 diverse training images per person
- Restart app after adding new people to retrain the model

## 📄 License

This project is for educational purposes. Ensure compliance with privacy laws (GDPR, etc.) when using biometric data.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

**Note**: Never commit face images or sensitive data in pull requests.