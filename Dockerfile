FROM python:3
ADD train-model.py /
RUN pip install tensorflow
RUN pip install pandas
RUN pip install numpy
RUN pip install matplotlib

CMD [ "python", "./train-model.py"]