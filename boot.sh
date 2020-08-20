#!/bin/sh
# this script is used to boot a Docker container
source venv/bin/activate
cd app
python manage.py wait_for_db.py &&
  python manage.py migrate &&
  python manage.py runserver 0.0.0.0:8000
cd ..
#exec gunicorn -b :5000 --access-logfile - --error-logfile - microblog:app
