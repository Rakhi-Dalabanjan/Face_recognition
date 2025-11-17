# Environment and secrets

Copy `.env.example` to `.env` in the project root and fill real values. Never commit `.env` into git.

Example:

```powershell
copy .env.example .env
# then edit .env with real SECRET_KEY and DATABASE_URL
```

Recommended steps before pushing to GitHub:

- Ensure `.gitignore` contains `.env` and your virtual environment folder (already added).
- Use environment variables or a secrets manager (AWS Secrets Manager, Parameter Store) in production.
