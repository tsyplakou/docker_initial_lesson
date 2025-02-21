# Используем официальный образ Python
FROM python:3.13

# Устанавливаем рабочую директорию
WORKDIR /app

COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install -r requirements.txt

# Копируем файлы проекта
COPY . .

# Запускаем приложение
ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]

# docker build -t simple_fastapi .
# docker run -p 8080:8080 simple_fastapi
