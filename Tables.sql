--create table
DROP TABLE IF EXISTS train, test, features, stores;

CREATE TABLE train (
    store INT,
    dept INT,
    date DATE,
    weekly_sales FLOAT,
    is_holiday BOOLEAN
);

CREATE TABLE test (
    Store INT,
    Dept INT,
    Date DATE,
    IsHoliday BOOLEAN
);

CREATE TABLE features (
    Store INT,
    Date DATE,
    Temperature FLOAT,
    Fuel_Price FLOAT,
    MarkDown1 FLOAT,
    MarkDown2 FLOAT,
    MarkDown3 FLOAT,
    MarkDown4 FLOAT,
    MarkDown5 FLOAT,
    CPI FLOAT,
    Unemployment FLOAT,
    IsHoliday BOOLEAN
);

CREATE TABLE stores (
    Store INT PRIMARY KEY,
    Type CHAR(1),
    Size INT
);

copy train FROM 'C:/Users/ckcho/Downloads/walmart/data/train.csv' DELIMITER ',' CSV HEADER;
copy test FROM 'C:/Users/ckcho/Downloads/walmart/data/test.csv' DELIMITER ',' CSV HEADER;
copy stores FROM 'C:/Users/ckcho/Downloads/walmart/data/stores.csv' DELIMITER ',' CSV HEADER;
copy features FROM 'C:/Users/ckcho/Downloads/walmart/data/features.csv' DELIMITER ',' CSV HEADER;
