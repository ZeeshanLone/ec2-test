FROM python:3.12.3-slim-bullseye
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 8000

HEALTHCHECK --interval=60s --timeout=5s --retries=3 --start-period=30s CMD curl --fail http://localhost:8000/health || exit 1

CMD ["uvicorn", "main:app", "--port", "8000", "--host", "0.0.0.0"]

LABEL version="0.1.0"
LABEL description="FastAPI application for Agent"