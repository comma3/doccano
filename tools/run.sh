#!/usr/bin/env bash

set -o errexit

if [[ ! -d "app/staticfiles" ]]; then python app/manage.py collectstatic --noinput; fi



gunicorn --bind="0.0.0.0:${PORT:-8000}" --workers="${WORKERS:-1}" --pythonpath=app app.wsgi --timeout 300
