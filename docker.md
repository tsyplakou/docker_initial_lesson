### **Основы Docker: Введение**

Docker — это платформа для контейнеризации, которая позволяет разработчикам упаковывать приложения и их зависимости в изолированные контейнеры. Контейнеры работают одинаково в разных средах — на локальной машине, сервере или в облаке.

---

## 🔹 **Основные концепции Docker**

### **1. Контейнеризация vs Виртуализация**
- Виртуальные машины (VM) создают полные копии операционной системы.
- Контейнеры используют ядро ОС и изолируют процессы внутри неё, что делает их более лёгкими и быстрыми.

| Характеристика | Виртуальная машина | Контейнер |
|--------------|------------------|----------|
| Размер | ГБ | МБ |
| Скорость запуска | Минуты | Секунды |
| Изоляция | Полная (собственная ОС) | Частичная (разделяет ядро) |
| Производительность | Ниже из-за гипервизора | Выше (нет накладных расходов на ОС) |

---

### **2. Основные компоненты Docker**
- **Образы (Images)** – шаблоны для создания контейнеров.
- **Контейнеры (Containers)** – изолированные среды выполнения, созданные из образов.
- **Dockerfile** – скрипт для автоматической сборки образов.
- **Volumes** – способ хранения данных контейнера вне его изоляции.
- **Сетевые мосты (Networks)** – механизмы связи между контейнерами.
- **Docker Compose** – инструмент для работы с многоконтейнерными приложениями.

---

## 🔹 **Установка Docker**
📌 Для установки Docker на Windows, macOS или Linux перейдите на [официальный сайт](https://www.docker.com/get-started).

**Проверка установки:**  
```bash
docker --version
```
Ожидаемый результат: `Docker version XX.XX.XX`

---

## 🔹 **Базовые команды Docker**
### **1. Запуск контейнера**
```bash
docker run hello-world
```
Запускает тестовый контейнер и проверяет работу Docker.

### **2. Список работающих контейнеров**
```bash
docker ps
```
Флаг `-a` показывает все контейнеры (даже остановленные):
```bash
docker ps -a
```

### **3. Остановка и удаление контейнера**
```bash
docker stop <container_id>
docker rm <container_id>
```

### **4. Загрузка образа**
```bash
docker pull nginx
```

### **5. Запуск контейнера с именем**
```bash
docker run --name my_nginx -d -p 8080:80 nginx
```
📌 Контейнер будет доступен по адресу `http://localhost:8080`

### **6. Удаление образа**
```bash
docker rmi nginx
```

### **7. Вход в контейнер**
```bash
docker exec -it <container_id> bash
```

---

## 🔹 **Dockerfile: Автоматическая сборка образов**
Dockerfile — это сценарий для создания Docker-образа.

Пример `Dockerfile` для Python-приложения:
```dockerfile
# Используем официальный образ Python
FROM python:3.9

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы проекта
COPY . .

# Устанавливаем зависимости
RUN pip install -r requirements.txt

# Запускаем приложение
CMD ["python", "app.py"]
```

Сборка образа:
```bash
docker build -t my_python_app .
```
Запуск контейнера:
```bash
docker run -d -p 5000:5000 my_python_app
```

---

## 🔹 **Docker Compose: Управление несколькими контейнерами**
`docker-compose.yml` позволяет запускать несколько контейнеров одной командой.

Пример `docker-compose.yml`:
```yaml
version: '3'
services:
  web:
    image: nginx
    ports:
      - "8080:80"
  db:
    image: postgres
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
```

Запуск:
```bash
docker-compose up -d
```

Остановка:
```bash
docker-compose down
```

---

## 🔹 **Где использовать Docker**
✅ Локальная разработка  
✅ Деплой приложений  
✅ Тестирование  
✅ CI/CD (автоматизация сборки и развертывания)

---

## 🔹 **Заключение**
Docker — мощный инструмент для управления контейнерами. Он помогает избежать проблем с окружением и зависимостями, ускоряет развертывание и масштабирование приложений.

🚀 **Что дальше?**  
1️⃣ Разобраться с Docker Networks  
2️⃣ Освоить Volumes для хранения данных  
3️⃣ Изучить Docker Swarm или Kubernetes для оркестрации контейнеров

🔹 **Есть вопросы?** 😃