--FEATURES TABLE -- 
-- Remove null values
-- Count NULL values in the features table
SELECT
    COUNT(CASE WHEN MarkDown1 IS NULL THEN 1 END) AS missing_markdown1,
    COUNT(CASE WHEN MarkDown2 IS NULL THEN 1 END) AS missing_markdown2,
    COUNT(CASE WHEN MarkDown3 IS NULL THEN 1 END) AS missing_markdown3,
    COUNT(CASE WHEN MarkDown4 IS NULL THEN 1 END) AS missing_markdown4,
    COUNT(CASE WHEN MarkDown5 IS NULL THEN 1 END) AS missing_markdown5,
	COUNT(CASE WHEN CPI IS NULL THEN 1 END) AS missing_cpi,
	COUNT(CASE WHEN Unemployment IS NULL THEN 1 END) AS missing_unemployment
FROM features;

-- Replace the Null values to 0 for Markdown1-5, CPI and unemployment
UPDATE features
SET 
    MarkDown1 = COALESCE(MarkDown1, 0),
    MarkDown2 = COALESCE(MarkDown2, 0),
    MarkDown3 = COALESCE(MarkDown3, 0),
    MarkDown4 = COALESCE(MarkDown4, 0),
    MarkDown5 = COALESCE(MarkDown5, 0),
    CPI = COALESCE(CPI, 0),
    Unemployment = COALESCE(Unemployment, 0);

-- Check NULL values in the features table again
SELECT
    COUNT(CASE WHEN MarkDown1 IS NULL THEN 1 END) AS missing_markdown1,
    COUNT(CASE WHEN MarkDown2 IS NULL THEN 1 END) AS missing_markdown2,
    COUNT(CASE WHEN MarkDown3 IS NULL THEN 1 END) AS missing_markdown3,
    COUNT(CASE WHEN MarkDown4 IS NULL THEN 1 END) AS missing_markdown4,
    COUNT(CASE WHEN MarkDown5 IS NULL THEN 1 END) AS missing_markdown5,
	COUNT(CASE WHEN CPI IS NULL THEN 1 END) AS missing_cpi,
	COUNT(CASE WHEN Unemployment IS NULL THEN 1 END) AS missing_unemployment
FROM features;

-- Ensure consistent date format
ALTER TABLE features ALTER COLUMN Date TYPE DATE USING Date::DATE;
SELECT * FROM features LIMIT 10;


-- TRAIN TABLE --
-- Remove negative sales --
-- Count number of negative values
SELECT count(*)
FROM train
WHERE Weekly_sales < 0;

-- Update the negative values to 0
UPDATE train
SET 
    Weekly_Sales = CASE WHEN Weekly_Sales < 0 THEN 0 ELSE Weekly_Sales END;

-- Check the number of negative values again
SELECT COUNT(*)
FROM train
WHERE Weekly_sales < 0;

-- Remove outliers sales 
-- Find the number of outliers using a threshold (3 standard deviation from the mean)
SELECT COUNT(*)
FROM train
WHERE Weekly_Sales > (SELECT AVG(Weekly_Sales) + 3 * STDDEV(Weekly_Sales) FROM train);

-- Replace outliers with mean sales
UPDATE train
SET Weekly_Sales = (SELECT AVG(Weekly_Sales) FROM train)
WHERE Weekly_Sales > (SELECT AVG(Weekly_Sales) + 3 * STDDEV(Weekly_Sales) FROM train);

-- Ensure consistent date format
ALTER TABLE train ALTER COLUMN Date TYPE DATE USING Date::DATE;
SELECT * FROM train LIMIT 10;

-- TEST TABLE--
-- Ensure consistent date format
ALTER TABLE test ALTER COLUMN Date TYPE DATE USING Date::DATE;
SELECT * FROM test LIMIT 10;

-------------------------------------------------------------------------
--Export 
COPY (SELECT * FROM train) TO 'C:/Users/ckcho/Downloads/walmart/data/train.csv' CSV HEADER;
COPY (SELECT * FROM test) TO 'C:/Users/ckcho/Downloads/walmart/data/test.csv' CSV HEADER;
COPY (SELECT * FROM stores) TO 'C:/Users/ckcho/Downloads/walmart/data/stores.csv' CSV HEADER;
COPY (SELECT * FROM features) TO 'C:/Users/ckcho/Downloads/walmart/data/features.csv' CSV HEADER;



