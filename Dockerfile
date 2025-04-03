FROM node:18-slim

WORKDIR /app

# Копируем файлы package.json для основного пакета и всех вложенных пакетов
COPY package*.json ./
COPY src/*/package*.json ./src/

# Устанавливаем корневые зависимости
RUN npm ci

# Копируем исходный код
COPY . .

# Установка зависимостей для всех workspaces
RUN npm ci --workspaces

# Компилируем TypeScript
RUN npm run build

# Переменная окружения для порта
ENV PORT=8080
EXPOSE 8080

# Переменная окружения для API Key
ENV GOOGLE_MAPS_API_KEY=""

# Запускаем приложение
CMD ["node", "src/google-maps/dist/index.js"]
