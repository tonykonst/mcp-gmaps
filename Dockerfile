FROM node:18-slim

WORKDIR /app

# Копируем файлы package.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm ci

# Копируем исходный код
COPY . .

# Компилируем TypeScript
RUN npm run build

# Переменная окружения для порта
ENV PORT=8080
EXPOSE 8080

# Запускаем приложение
CMD ["node", "src/google-maps/dist/index.js"]
