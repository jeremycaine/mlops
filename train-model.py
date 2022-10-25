import os
import tensorflow as tf
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

import io
import ibm_boto3
from ibm_botocore.client import Config, ClientError

PATH = os.getenv('PATH')
print(PATH)

# LOC_TEST_CSV = "test-input.csv"

COS_APIKEY = os.environ['CLOUD_OBJECT_STORAGE_APIKEY']
COS_RESOURCE_NSTANCE_ID=os.environ['CLOUD_OBJECT_STORAGE_RESOURCE_INSTANCE_ID']

cos = ibm_boto3.resource("s3",
        ibm_api_key_id=COS_APIKEY,
        ibm_service_instance_id=COS_RESOURCE_NSTANCE_ID,
        config=Config(signature_version="oauth"),
        endpoint_url='https://s3.us-east.cloud-object-storage.appdomain.cloud'
        )

print(COS_APIKEY)
print(COS_RESOURCE_NSTANCE_ID)

# -- Build the model
# train_df: pd.DataFrame = pd.read_csv(LOC_TRAIN_CSV, header=None)
#test_df: pd.DataFrame = pd.read_csv(LOC_TEST_CSV, header=None)

#data: test_df.loc[1:, 1:2].values
#print(data)

cities = pd.DataFrame([['Sacramento', 'California'], ['Miami', 'Florida']], columns=['City', 'State'])
x = cities.to_csv(index=False)
print(x)

print("data loaded")
