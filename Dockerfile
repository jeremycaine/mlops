FROM python:3
# FROM python:3.8-slim-buster

WORKDIR /job

COPY requirements.txt requirements.txt
RUN pip install tensorflow
RUN pip install pandas
RUN pip install numpy
RUN pip install matplotlib

CMD [ "python3", "./train-model.py"]