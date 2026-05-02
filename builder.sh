#!/bin/bash

# Проверяем, что переданы оба аргумента
if [ $# -ne 2 ]; then
    echo "Usage: $0 <github-repo> <dockerhub-repo>"
    echo "Example: $0 mluukkai/express_app mluukkai/testing"
    exit 1
fi

GITHUB_REPO=$1
DOCKERHUB_REPO=$2

# Создаём временную папку для клонирования
TEMP_DIR=$(mktemp -d)
echo "📁 Creating temporary directory: $TEMP_DIR"

# Клонируем репозиторий
echo "🔄 Cloning https://github.com/$GITHUB_REPO..."
git clone "https://github.com/$GITHUB_REPO.git" "$TEMP_DIR"

if [ $? -ne 0 ]; then
    echo "❌ Failed to clone repository"
    exit 1
fi

# Переходим в папку с репозиторием
cd "$TEMP_DIR"

# Проверяем, что Dockerfile существует
if [ ! -f Dockerfile ]; then
    echo "❌ Dockerfile not found in repository root"
    exit 1
fi

# Собираем Docker образ
echo "🔨 Building Docker image..."
docker build -t "$DOCKERHUB_REPO" .

if [ $? -ne 0 ]; then
    echo "❌ Failed to build Docker image"
    exit 1
fi

# Пушим образ в Docker Hub
echo "📤 Pushing to Docker Hub..."
docker push "$DOCKERHUB_REPO"

if [ $? -ne 0 ]; then
    echo "❌ Failed to push to Docker Hub"
    exit 1
fi

# Очищаем временную папку
echo "🧹 Cleaning up..."
cd /
rm -rf "$TEMP_DIR"

echo "✅ Successfully built and pushed $DOCKERHUB_REPO"
