FROM python:3.7-alpine
MAINTAINER App Devz Ltd

ENV PYTHONUNBUFFERED 1

ADD ./requirements.txt /requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install -r requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
