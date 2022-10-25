FROM --platform=linux/amd64 python:3.9-slim

WORKDIR /job

COPY requirements.txt requirements.txt
RUN pip install tensorflow
RUN pip install pandas
RUN pip install numpy
RUN pip install matplotlib

CMD [ "python3", "./train-model.py"]