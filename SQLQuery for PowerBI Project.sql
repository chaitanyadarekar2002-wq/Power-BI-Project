select * from dbo.Sales_dataset
select * from dbo.Product_database
select ProductID , ProductName , UPPER(TRIM(Category)) as CleanCategory , Brand , CostPrice from Product_database

select SalesID,ProductID,CustomerID,StoreID,CAST(date as DATE) as SalesDate,Quantity,SalesAmount from dbo.Sales_dataset
select * from Inventory_database
select InventoryID , Date ,ProductID,StoreID,OpeningStock,PurchaseQty,SalesQty,coalesce(ClosingStock,0) as ClosingStock from Inventory_database

select s.SalesID,s.Date,s.Quantity,P.ProductName,p.Category,c.Name,c.City,st.Region,st.StoreName from dbo.Sales_dataset
join Product_database p on s.ProductID = p.ProductID
join Customer_dataset c on s.CustomerID = c.CustomerID
join Store_dataset st on s.StoreID = st.StoreId;

SELECT 
    s.SalesID,
    s.Date,
    s.Quantity,
    p.ProductName,
    p.Category,
    c.Name,
    c.City,
    st.Region,
    st.StoreName
FROM dbo.Sales_dataset s
JOIN Product_database p ON s.ProductID = p.ProductID
JOIN Customer_dataset c ON s.CustomerID = c.CustomerID
JOIN Store_dataset st ON s.StoreID = st.StoreId;


select Date,Year(Date)as year,month(Date)as month,day(Date)as day,Quarter(Date)as quarter,week(Date)as weekofyear,
FORMAT(Date,"MMM-YYYY") YearMonth from Date_database;

SELECT 
    Date,
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    DAY(Date) AS day,
    DATEPART(QUARTER, Date) AS quarter,
    DATEPART(WEEK, Date) AS weekofyear,
    FORMAT(Date, 'MMM-yyyy') AS YearMonth
FROM Date_database;

select s.date,p.productid,s.storeid,p.ProductName,sum(s.quantity) as TotalQty from dbo.Sales_dataset s 
join Product_database p on s.productid=p.ProductID
group by s.date,p.ProductID,s.StoreID,p.ProductName;

select p.ProductId,p.ProductName, ROUND(sum(p.SellingPrice)/sum(s.quantity),0) as ASP
from dbo.Sales_dataset s
join Product_database p on s.productid=p.ProductID
group by p.ProductID,p.ProductName