FROM python:3.10-slim AS builder
WORKDIR /job
ENV PATH="/venv/bin:$PATH"
COPY requirements.txt ./
RUN python -m venv /venv
RUN pip install --upgrade pip
RUN pip install -r requirements.txt 

# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.10-slim AS job

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
ENV JOB_HOME /job
ENV PATH="/venv/bin:$PATH"
WORKDIR $JOB_HOME
COPY --from=builder /venv /venv
COPY ./train-model.py ./train-model.py

CMD [ "python3", "./train-model.py"]
