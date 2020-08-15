FROM python:3.7-alpine
MAINTAINER App Devz Ltd

WORKDIR /app

ENV PYTHONUNBUFFERED 1

ADD ./requirements.txt /requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install -r ./requirements.txt

RUN mkdir /app
COPY ./app /app
COPY boot.sh ./
RUN chmod a+x boot.sh

RUN adduser -D user
USER user

EXPOSE 8000
ENTRYPOINT ["./boot.sh"]
