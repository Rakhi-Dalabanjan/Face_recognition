# Security and Privacy Guidelines

## Face Image Security

⚠️ **IMPORTANT**: This repository does NOT store face images in version control for privacy and security reasons.

### What was removed:
- All face images from `known_person/` folder have been permanently removed from Git history
- The `known_person/` folder is now in `.gitignore` to prevent accidental commits

### For deployment:
1. **Local Development**: Create face image folders locally in `known_person/[name]/` after cloning
2. **Production**: Store face images in:
   - AWS S3 with private access
   - Local storage on production server (not in code repo)
   - Encrypted storage solutions

### Best practices:
- ✅ Never commit face images to version control
- ✅ Use encrypted storage for sensitive biometric data
- ✅ Implement proper access controls
- ✅ Regular security audits
- ✅ Inform users about data collection and usage

### Legal compliance:
- Ensure GDPR/privacy law compliance
- Get explicit consent before storing biometric data
- Implement data deletion capabilities
- Maintain audit logs

### Environment Variables:
Store sensitive data in environment variables:
- `DATABASE_URL` - Database connection string
- `SECRET_KEY` - Flask session encryption key
- `STORAGE_PATH` - Path to secure image storage (production)