#!/bin/bash

# Проверяем, передано ли два аргумента
if [ $# -ne 2 ]; then
    echo "❌ Ошибка: нужно 2 аргумента!"
    echo "Использование: ./builder.sh <github-repo> <dockerhub-repo>"
    echo "Пример: ./builder.sh mluukkai/express_app mluukkai/testing"
    exit 1
fi

# Получаем аргументы
GITHUB_REPO=$1
DOCKERHUB_REPO=$2

echo "📥 Клонируем репозиторий: $GITHUB_REPO"
git clone "https://github.com/$GITHUB_REPO.git" temp-repo

if [ $? -ne 0 ]; then
    echo "❌ Ошибка при клонировании репозитория"
    exit 1
fi

cd temp-repo

echo "🐳 Собираем Docker образ..."
docker build -t "$DOCKERHUB_REPO" .

if [ $? -ne 0 ]; then
    echo "❌ Ошибка при сборке Docker образа"
    cd ..
    rm -rf temp-repo
    exit 1
fi

echo "📤 Публикуем образ в Docker Hub: $DOCKERHUB_REPO"
docker push "$DOCKERHUB_REPO"

if [ $? -ne 0 ]; then
    echo "❌ Ошибка при публикации образа"
    cd ..
    rm -rf temp-repo
    exit 1
fi

cd ..
rm -rf temp-repo

echo "✅ Готово! Образ $DOCKERHUB_REPO успешно опубликован!"
