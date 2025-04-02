#!/bin/bash

# Установка зависимостей
npm ci

# Компиляция TypeScript
npx tsc

# Делаем файлы исполняемыми
chmod +x dist/index.js

echo "Сборка завершена успешно!" 