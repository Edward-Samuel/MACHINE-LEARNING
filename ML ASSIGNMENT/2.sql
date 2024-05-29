USE ML;
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT
);

INSERT INTO Customers VALUES
(1,'John Doe',28),
(2,'Jane Smith',34),
(3,'Emily Davis',40),
(4,'Michael Brown',25),
(5,'Sarah Wilson',30);
SELECT * FROM customers;

CREATE TABLE Products(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);
INSERT INTO Products(ProductID,ProductName) VALUES
(1,'Smart Phone'),
(2,'Refridgerator'),
(3,'Television');
SELECT * FROM products;

CREATE TABLE Purchases(
    PurchaseID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Amount DECIMAL(10,2),
    PurchaseDate DATE,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);
DROP TABLE purchases;
INSERT INTO Purchases(PurchaseID,CustomerID,ProductID,Amount,PurchaseDate) VALUES
(1,1,2,120.50,'2023-01-15'),
(2,2,3,250.00,'2023-01-17'),
(3,1,3,300.75,'2023-02-11'),
(4,3,1,500.00,'2023-02-15'),
(5,2,2,150.25,'2023-03-10'),
(6,4,1,100.00,'2023-03-20'),
(7,5,3,450.50,'2023-04-05');
SELECT * FROM purchases;

-- MEAN
SELECT AVG(Amount) AS Mean
FROM Purchases;

-- Median
SELECT Amount AS Median
FROM(
    SELECT Amount,
           ROW_NUMBER() OVER(ORDER BY Amount) AS RowAsc,
           ROW_NUMBER() OVER(ORDER BY Amount DESC) AS RowDesc
    FROM Purchases
) AS subquery
WHERE RowAsc=RowDesc
   OR RowAsc+1=RowDesc
   OR RowAsc=RowDesc+1;

-- STANDARD DEVIATION
SELECT STDDEV(Amount) AS StdDevAmount
FROM Purchases;

-- TOP 5 CUSTOMERS
SELECT c.CustomerID,c.Name,SUM(p.Amount) AS TotalAmount
FROM Customers c
JOIN Purchases p ON c.CustomerID=p.CustomerID
GROUP BY c.CustomerID,c.Name
ORDER BY TotalAmount DESC
LIMIT 5;

-- CUSTOMER AGE DISTRIBUTION
SELECT 
    CASE
        WHEN Age < 20 THEN '< 20'
        WHEN Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS AgeGroup,
    COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY AgeGroup
ORDER BY AgeGroup;