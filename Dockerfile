FROM python:3.10-slim as python-base

ENV PORT=4001

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential

WORKDIR /app
COPY requirements.txt /app/

RUN pip3 install -r requirements.txt

WORKDIR /app
COPY . /app

ENTRYPOINT /usr/local/bin/uvicorn main:app --host 0.0.0.0 --port $PORT