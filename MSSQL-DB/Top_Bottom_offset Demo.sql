--TOP 10 Record
SELECT TOP (10) *
  FROM [AdventureWorks2019].[HumanResources].[Employee]
  GO
-- LAST 10 Record 
SELECT * FROM [HumanResources].[Employee] 
ORDER BY [BusinessEntityID]
OFFSET (SELECT COUNT(*) FROM [HumanResources].[Employee])-10 ROWS
FETCH NEXT 10 ROWS ONLY;
GO
-- OFFSET 
SELECT * FROM [HumanResources].[Employee] 
ORDER BY [BusinessEntityID]
OFFSET 100 ROWS
FETCH NEXT 10 ROWS ONLY;