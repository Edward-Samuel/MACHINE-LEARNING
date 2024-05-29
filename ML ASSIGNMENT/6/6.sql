USE ML;

SELECT ProductID FROM Purchases WHERE CustomerID=1;
SELECT DISTINCT CustomerID
FROM Purchases
WHERE ProductID IN(SELECT ProductID FROM Purchases WHERE CustomerID=1)
AND CustomerID!=1;
SELECT DISTINCT ProductID
FROM Purchases
WHERE CustomerID IN(SELECT DISTINCT CustomerID FROM Purchases WHERE ProductID IN(2,3) AND CustomerID !=1);
SELECT ProductID
FROM Purchases
WHERE CustomerID IN(2,5)
AND ProductID NOT IN(2,3);
SELECT p.ProductID,p.ProductName
FROM Products p
WHERE p.ProductID IN(1);

CREATE TABLE Churn(
    CustomerID INT PRIMARY KEY,
    HasChurned BOOLEAN,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Churn(CustomerID,HasChurned)
SELECT c.CustomerID,
       CASE
           WHEN MAX(p.PurchaseDate) < CURDATE() - INTERVAL 6 MONTH THEN TRUE
           ELSE FALSE
       END AS HasChurned
FROM Customers c
LEFT JOIN Purchases p ON c.CustomerID=p.CustomerID
GROUP BY c.CustomerID;

SELECT c.CustomerID,c.Name,c.Age,ch.HasChurned,COUNT(p.PurchaseID) AS TotalPurchases,AVG(p.Amount) AS AvgPurchaseAmount
FROM Customers c
JOIN Churn ch ON c.CustomerID=ch.CustomerID
LEFT JOIN Purchases p ON c.CustomerID=p.CustomerID
GROUP BY c.CustomerID,c.Name,c.Age,ch.HasChurned
ORDER BY TotalPurchases DESC;

CREATE TABLE CustomerFeatures AS
SELECT c.CustomerID,COUNT(p.PurchaseID) AS TotalPurchases,AVG(p.Amount) AS AvgPurchaseAmount
FROM Customers c
LEFT JOIN Purchases p ON c.CustomerID=p.CustomerID
GROUP BY c.CustomerID;

SELECT CustomerID,TotalPurchases,AvgPurchaseAmount
FROM CustomerFeatures
ORDER BY RAND()
LIMIT 3;
