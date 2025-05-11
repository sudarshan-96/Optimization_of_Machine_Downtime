import pandas as pd

def clean_sensor_data(filepath):
    df = pd.read_csv(filepath)
    df.drop_duplicates(inplace=True)
    df.fillna(method='ffill', inplace=True)
    return df