/*
Q1: Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter. 
*/
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM PRODUCTION.Product P;

/*
Q2: Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
    excludes the rows that ListPrice is 0.
*/
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM PRODUCTION.PRODUCT P
WHERE P.ListPrice <> 0;

/*
Q3: Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
    the rows that are NULL for the Color column.
*/    
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM PRODUCTION.Product P
WHERE P.Color IS NULL;

/*
Q4: Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
    the rows that are not NULL for the Color column.
*/
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM PRODUCTION.Product P
WHERE P.Color IS NOT NULL;

/*
Q5: Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, 
    the rows that are not NULL for the column Color, and the column ListPrice has a value greater than zero.
*/
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM PRODUCTION.Product P
WHERE P.Color IS NOT NULL AND P.ListPrice > 0;

/*
Q6: Write a query that concatenates the columns Name and Color from the Production.Product table by excluding the rows that are null for color.
*/
SELECT P.Name + ' ' + P.Color AS NAME_COLOR
FROM Production.Product P
WHERE P.Color IS NOT NULL;

/*
Q7: Write a query that generates the following result set  from Production.Product:
    NAME: LL Crankarm  --  COLOR: Black
    NAME: ML Crankarm  --  COLOR: Black
    NAME: HL Crankarm  --  COLOR: Black
    NAME: Chainring Bolts  --  COLOR: Silver
    NAME: Chainring Nut  --  COLOR: Silver
    NAME: Chainring  --  COLOR: Black
*/
SELECT 'NAME: ' + P.Name + ' -- COLOR: ' + P.Color AS Descripton
FROM Production.Product P
WHERE P.Color IN ('Black', 'Silver');

/*
Q8: Write a query to retrieve the to the columns ProductID and Name from the Production.Product table filtered by ProductID from 400 to 500
*/
SELECT P.ProductID, P.Name
FROM Production.Product P
WHERE P.ProductID BETWEEN 400 AND 500;

/*
Q9: Write a query to retrieve the to the columns  ProductID, Name and color from the Production.Product table 
    restricted to the colors black and blue
*/
SELECT P.ProductID, P.Name
FROM Production.Product P
WHERE P.Color IN ('Black', 'Blue');

/*
Q10: Write a query to get a result set on products that begins with the letter S.
*/
SELECT P.Name
FROM Production.Product P
WHERE P.Name LIKE 'S%';

/*
Q11: Write a query that retrieves the columns Name and ListPrice from the Production.Product table. 
     Your result set should look something like the following. Order the result set by the Name column. 
        Name                                               ListPrice
        Seat Lug                                              00,00
        Seat Post                                             00,00
        Seat Stays                                            00,00
        Seat Tube                                             00,00
        Short-Sleeve Classic Jersey, L                        53,99
        Short-Sleeve Classic Jersey, M                        53,99
*/
SELECT P.Name, P.ListPrice
FROM Production.Product P
WHERE P.Name LIKE 'S%' 
ORDER BY P.Name;


/*
Q12: Write a query that retrieves the columns Name and ListPrice from the Production.Product table. 
     Your result set should look something like the following. Order the result set by the Name column. 
     The products name should start with either 'A' or 'S'
        Name                                               ListPrice
        Adjustable Race                                      000,00
        All-Purpose Bike Stand                               159,00
        AWC Logo Cap                                         008,99
        Seat Lug                                             000,00
        Seat Post                                            000,00
*/
SELECT P.Name, P.ListPrice
FROM Production.Product P
WHERE P.Name LIKE 'A%' OR P.Name LIKE 'S%'
ORDER BY P.Name;


/*
Q13: Write a query so you retrieve rows that have a Name that begins with the letters SPO, 
     but is then not followed by the letter K. After this zero or more letters can exists. 
     Order the result set by the Name column.
*/
SELECT *
FROM Production.Product P
WHERE P.Name LIKE 'SPO[^K]%'
ORDER BY P.Name;

/*
Q14: Write a query that retrieves unique colors from the table Production.Product. Order the results  in descending  manner.
*/
SELECT DISTINCT P.Color
FROM Production.Product P
ORDER BY P.Color DESC;

/*
Q15. Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color
from the Production.Product table. Sort based on Color first and then ProductSubcategoryID, both in
descending order. We do not want any rows that are NULL.in any of the two columns in the result.
*/

SELECT DISTINCT P.ProductSubcategoryID,P.Color 
FROM Production.Product P 
WHERE P.ProductSubcategoryID IS NOT NULL AND P.Color IS NOT NULL 
ORDER BY P.Color DESC, P.ProductSubcategoryID DESC;
