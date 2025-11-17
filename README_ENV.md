# Environment Setup Guide

## Quick Setup for New Users

### 1. Copy Environment Template
```bash
# Windows PowerShell/CMD
copy .env.example .env

# macOS/Linux
cp .env.example .env
```

### 2. Edit .env File
Open `.env` in any text editor and set:

```env
# Required: Flask session security (generate a random string)
SECRET_KEY=your-super-secret-random-string-here

# Optional: Database URL (defaults to SQLite if not set)
# For MySQL: mysql+pymysql://username:password@host:port/database
# For PostgreSQL: postgresql://username:password@host:port/database
DATABASE_URL=sqlite:///people.db
```

### 3. Generate a Secure SECRET_KEY
```python
# Run this in Python to generate a secure key:
import secrets
print(secrets.token_hex(32))
```

## Production Deployment

### AWS Elastic Beanstalk
```bash
eb setenv SECRET_KEY=your-production-key
eb setenv DATABASE_URL=your-production-db-url
```

### Heroku
```bash
heroku config:set SECRET_KEY=your-production-key
heroku config:set DATABASE_URL=your-production-db-url
```

### Docker
```bash
docker run -e SECRET_KEY=your-key -e DATABASE_URL=your-db-url face-recognition
```

## Security Notes

- ✅ Never commit `.env` to version control
- ✅ Use different keys for development and production
- ✅ Rotate keys regularly in production
- ✅ Use AWS Secrets Manager or similar for production secrets
