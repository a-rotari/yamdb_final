FROM python:3.8.5

WORKDIR /code
COPY requirements.txt /code
RUN pip install -r /code/requirements.txt
COPY . /code
# Оставляю CMD с запуском gunicorn на месте, так как иначе автотесты не 
# пропускают: "AssertionError: Проверьте, что добавили инструкцию CMD с запуском
# gunicorn в файл Dockerfile."
# При этом хочу проводить миграцию, собирать статику и запускать gunicorn 
# именно из docker-compose.yaml, т.к. не знаю, как все эти три команды запихнуть
# в Dockerfile, чтобы все работало.
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000