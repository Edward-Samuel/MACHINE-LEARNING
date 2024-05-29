USE ML;
ALTER TABLE Customers
ADD COLUMN TotalAmount DECIMAL(10, 2);

UPDATE Customers c
JOIN (
    SELECT CustomerID, SUM(Amount) AS TotalAmount
    FROM Purchases
    GROUP BY CustomerID
) p ON c.CustomerID = p.CustomerI
SET c.TotalAmount = p.TotalAmount;
SELECT * FROM customers;

CREATE TABLE CustomerData AS
SELECT CustomerID, Age, TotalAmount
FROM Customers
WHERE TotalAmount IS NOT NULL;

ALTER TABLE CustomerData ADD COLUMN RandomNumber FLOAT;
UPDATE CustomerData SET RandomNumber = RAND();
SELECT * FROM customerdata;

CREATE TABLE TrainingSet AS
SELECT * FROM CustomerData
WHERE RandomNumber <= 0.7;
SELECT * FROM trainingset;

CREATE TABLE TestingSet AS
SELECT * FROM CustomerData
WHERE RandomNumber > 0.7;
SELECT * FROM testingset;