# Node.js CI/CD Pipeline to Railway

Automated deployment pipeline for Node.js application.

## Live Demo
Application deployed on Railway:
https://node-pipeline-production.up.railway.app

## Local Setup
docker compose up -d

Open http://localhost:3000

## Auto-deployment
On every git push to main branch:
1. GitHub Actions builds Docker image
2. Image is pushed to Docker Hub
3. Railway automatically deploys new version

## Technologies
- Node.js + Express
- Docker + Docker Compose
- GitHub Actions (CI/CD)
- Watchtower (local auto-update)
- Railway (cloud hosting)
