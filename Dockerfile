FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
# Uncomment the line below if you add dependencies to requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
