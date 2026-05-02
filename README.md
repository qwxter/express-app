# Express App with CI/CD

## 🚀 Live Demo

**Application URL:** https://your-app.up.railway.app

*(Замени на свою реальную ссылку от Railway)*

## 📋 Description

Simple Express.js application with automated CI/CD pipeline using GitHub Actions and Docker.

## 🛠️ Tech Stack

- Node.js + Express
- Docker & Docker Compose
- GitHub Actions (CI/CD)
- Docker Hub (container registry)
- Railway (cloud deployment)

## 🔄 CI/CD Pipeline

This project uses GitHub Actions for automatic deployment:

1. **Build Job:**
   - Builds Docker image
   - Pushes to Docker Hub
   
2. **Deploy Job:**
   - Automatically deploys to Railway
   - Triggers on every push to `main` branch

## 📦 Local Development

### Using Docker Compose:

```bash
docker compose up -d
