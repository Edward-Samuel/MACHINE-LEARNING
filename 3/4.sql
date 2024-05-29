USE ML;
CREATE TABLE sales(
    Online_Store INT,
    Monthly_Sales INT,
    Advertising_Dollars FLOAT
);
INSERT INTO sales
VALUES (1,368,1.7),(2,340,1.5),(3,665,2.8),(4,954,5),(5,331,1.3),(6,556,2.2),(7,376,1.3);
SELECT * FROM sales;

-- Create a table for training data (80% of the data)
CREATE TABLE IF NOT EXISTS sales_training AS
SELECT * FROM sales
WHERE id % 5 <> 0;

-- Create a table for testing data (20% of the data)
CREATE TABLE IF NOT EXISTS sales_testing AS
SELECT * FROM sales
WHERE id % 5 = 0;

-- Add a column for predicted monthly sales in the testing table
ALTER TABLE sales_testing ADD COLUMN Predicted_Monthly_Sales DOUBLE;

-- Calculate RMSE using SQL
SELECT 
    SQRT(AVG(POWER(Predicted_Monthly_Sales - Monthly_Sales, 2))) AS RMSE
FROM 
    sales_testing;

-- Calculate MAE using SQL
SELECT 
    AVG(ABS(Predicted_Monthly_Sales - Monthly_Sales)) AS MAE
FROM 
    sales_testing;
