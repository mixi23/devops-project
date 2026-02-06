
FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /usr/local/lib /usr/local/lib
COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
