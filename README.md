# Walmart-Store-Sales-Forecasting

This repository contains scripts related to Walmart store **historical sales analysis** and **forecasting**. <hr>

Below are descriptions of the folders and files: 
## 1. walmart sales analysis and forecasting.ipynb:
script contains EDA, sales forecasting and key insights/recommendation

### Exploratory data analysis (EDA)
- time series analysis
- summary statistic
- sales affected by features
- Features Selection: `Lasso Regularisation`

### Sales forecasting
- Simple model: `LinearRegression`, `RandomForestRegressor`, `XGBoost`
- Statistical model: `ARIMA`, `SARIMAX`
- Deep learning: `LSTM` (Long Short-term Memory Networks)

## 2. Tables.sql: 
written using `PostgreSQL` 
- **train, test, stores and features** table are created to store data from the csv files.

## 3. Data cleaning.sql 
cleaning data and export out (selected folder is in Downloads/walmart/data in my local device)
- Replace `Null` to 0
- Ensure consistent data type format specifically date
- Remove outliers
- Remove negative value in relavant columns

## 4. data
folder containing all the required dataset (in csv format):
- features.csv
- stores.csv
- train.csv
- test.csv
- sampleSubmission.csv

## 5. final_submission.csv
contains all forecasted sales from the selected machine learning model in csv format.
