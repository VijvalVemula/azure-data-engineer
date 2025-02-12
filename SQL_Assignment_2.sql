-- Q1
SELECT COUNT(*) AS ProductCount
FROM Production.Product;


-- Q2
SELECT COUNT(P.ProductSubcategoryID) AS TotalProductsInSubcategory
FROM Production.Product AS P
WHERE P.ProductSubcategoryID IS NOT NULL;


--Q3
SELECT P.ProductSubcategoryID, COUNT(P.ProductID) AS CountedProducts
FROM Production.Product P
GROUP BY P.ProductSubcategoryID;

--Q4
SELECT P.ProductSubcategoryID, COUNT(P.ProductID) AS CountedProducts
FROM Production.Product P
GROUP BY P.ProductSubcategoryID
HAVING P.ProductSubcategoryID IS NULL;

--Q5
SELECT SUM(PI.Quantity)
FROM Production.ProductInventory PI;

--Q6
SELECT PI.ProductID, SUM(PI.Quantity) AS TheSum
FROM Production.ProductInventory PI
WHERE PI.LocationID = 40
GROUP BY PI.ProductID
HAVING SUM(PI.Quantity) < 100;

--Q7
SELECT PI.Shelf, PI.ProductID, SUM(PI.Quantity) AS TheSum
FROM Production.ProductInventory PI
WHERE PI.LocationID = 40
GROUP BY PI.Shelf, PI.ProductID
HAVING SUM(PI.Quantity) < 100;

--Q8
SELECT PI.LocationID, AVG(PI.Quantity) AS TheAvg
FROM Production.ProductInventory PI
WHERE PI.LocationID = 10
GROUP BY PI.LocationID;

--Q9
SELECT PI.ProductID, PI.Shelf, AVG(PI.Quantity) AS TheAvg
FROM Production.ProductInventory PI
GROUP BY PI.ProductID, PI.Shelf;


--Q10
SELECT PI.ProductID, PI.Shelf, AVG(PI.Quantity) AS TheAvg
FROM Production.ProductInventory PI
WHERE PI.Shelf <> 'N/A'
GROUP BY PI.ProductID, PI.Shelf;

--Q11
SELECT P.Color, P.Class, COUNT(*) AS TheCount, AVG(P.ListPrice) AS TheAvg
FROM Production.Product P
WHERE P.Color IS NOT NULL AND P.Class IS NOT NULL
GROUP BY P.Color, P.Class;


--Q12
SELECT CR.Name AS COUNTRY, SP.Name AS PROVINCE
FROM Person.CountryRegion CR 
JOIN Person.StateProvince SP ON CR.CountryRegionCode = SP.CountryRegionCode;

--Q13
SELECT CR.Name AS COUNTRY, SP.Name AS PROVINCE
FROM Person.CountryRegion CR 
JOIN Person.StateProvince SP ON CR.CountryRegionCode = SP.CountryRegionCode
WHERE CR.Name IN ('Germany', 'Canada');

--FROM NORTHWIND DATABASE
--Q14
SELECT  DISTINCT P.ProductID, P.ProductName, O.OrderDate
FROM Orders O 
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON P.ProductID = OD.ProductID
WHERE O.OrderDate >= '1997-12-01'

--Q15
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) AS TotalQuantitySold
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.ShipPostalCode
ORDER BY TotalQuantitySold DESC;

--Q16
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) AS TotalQuantitySold
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= '1997-12-01'  
GROUP BY o.ShipPostalCode
ORDER BY TotalQuantitySold DESC;

--Q17
SELECT City, COUNT(CustomerID) AS NumberOfCustomers
FROM Customers
GROUP BY CitY;

--Q18
SELECT City, COUNT(CustomerID) AS NumberOfCustomers
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 2;

--Q19
SELECT c.ContactName AS CustomerName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate > '1998-01-01'
ORDER BY o.OrderDate;

--Q20
SELECT c.ContactName AS CustomerName, MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName
ORDER BY MostRecentOrderDate DESC;

--Q21
SELECT c.ContactName AS CustomerName, COUNT(od.ProductID) AS ProductsBought
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.ContactName;

--Q22
SELECT c.CustomerID, COUNT(od.ProductID) AS ProductsBought
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING COUNT(od.ProductID) > 100;

--Q23
SELECT DISTINCT s.CompanyName AS SupplierCompanyName, sh.CompanyName AS ShippingCompanyName
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Shippers sh ON o.ShipVia = sh.ShipperID
ORDER BY SupplierCompanyName, ShippingCompanyName;

--Q24
SELECT o.OrderDate, p.ProductName
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderDate, p.ProductName;

--Q25
SELECT e1.EmployeeID AS Employee1ID, e1.FirstName + ' ' + e1.LastName AS Employee1Name,
       e2.EmployeeID AS Employee2ID, e2.FirstName + ' ' + e2.LastName AS Employee2Name,
       e1.Title AS JobTitle
FROM Employees e1
JOIN Employees e2 ON e1.Title = e2.Title
WHERE e1.EmployeeID < e2.EmployeeID
ORDER BY JobTitle, Employee1Name, Employee2Name;

--Q26
SELECT e.ReportsTo AS ManagerID, m.FirstName + ' ' + m.LastName AS ManagerName, COUNT(*) AS EmployeeCount
FROM Employees e
JOIN Employees m ON e.ReportsTo = m.EmployeeID
GROUP BY e.ReportsTo, m.FirstName, m.LastName
HAVING COUNT(*) > 2
ORDER BY EmployeeCount DESC;
 
--Q27
SELECT City, CompanyName , ContactName, 'Customer' AS Type
FROM Customers
UNION ALL
SELECT City, CompanyName , ContactName, 'Supplier' AS Type
FROM Suppliers
ORDER BY City, Type, CompanyName;





