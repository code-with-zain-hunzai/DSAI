create schema retailshop;
use retailshop;
select * from online_retail;

SELECT customerID, 
SUM(Quantity * UnitPrice) AS TotalSpace
FROM online_retail
GROUP BY CustomerID
limit 10;

SELECT CustomerID,count(DISTINCT StockCode) AS UniqueProduct
FROM online_retail
Group by CustomerID

SELECT CustomerID,count(distinct InvoiceNo) AS NumberOfPurchase
FROM online_retail
group by CustomerID
having count(distinct InvoiceNo) = 1;

SELECT A.StockCode AS Product1,
	   B.StockCode AS Product2,
       count(*) AS TimePurchasedTogether
FROM online_retail AS A
join online_retail B ON A.InvoiceNo = B.InvoiceNO AND A.StockCode> B.StockCode
group by A.StockCode, B. StockCode
order by TimePurchasedTogether desc;

#AdvanceQueries
select CustomerID,
count(InvoiceNO) AS PurchaseFrequency
from online_retail 
group by CustomerID
order by PurchaseFrequency desc;

select Country,
avg(UnitPrice * Quantity) AS AverageOrderValue
from online_retail
group by Country
order by AverageOrderValue desc;

select CustomerID,
max(InvoiceDate) AS LastPurchaseDate
from online_retail
group by CustomerID
having max(InvoiceDate) < date_sub(curdate(), interval 6 month);

SELECT A.StockCode AS Product1,
	   B.StockCode AS Product2,
       count(*) AS TimePurchasedTogether
FROM online_retail AS A
join online_retail B ON A.InvoiceNo = B.InvoiceNO AND A.StockCode < B.StockCode
group by A.StockCode, B. StockCode
order by TimePurchasedTogether desc;

SELECT 
  YEAR(InvoiceDate) AS Year, 
  MONTH(InvoiceDate) AS Month, 
  SUM(UnitPrice * Quantity) AS TotalSales
FROM 
  online_retail
GROUP BY 
  Year, Month
ORDER BY 
  Year, Month;


