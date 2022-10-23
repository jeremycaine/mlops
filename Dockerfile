FROM python:3
# FROM python:3.8-slim-buster

WORKDIR /job

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .

CMD [ "python3", "./train-model.py"]