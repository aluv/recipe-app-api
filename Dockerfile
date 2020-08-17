FROM python:3.7-alpine
MAINTAINER App Devz Ltd

RUN adduser -D user

WORKDIR /home/recipe

ENV PYTHONUNBUFFERED 1

ADD ./requirements.txt /home/recipe/requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install -r requirements.txt

COPY app app
COPY boot.sh ./
RUN chmod a+x boot.sh

RUN chown -R user:user ./
USER user

EXPOSE 8000
ENTRYPOINT ["./boot.sh"]
