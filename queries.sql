-- 1. retrieve all orders for a specific customer
select o.orderID,o.orderDate, o.totalAmount,oi.productID
from orders o
join orderItems oi on o.orderID = oi.orderID
WHERE o.customerID = 1;


-- 2.find the total sales for each product
SELECT 
    productID,
    SUM(quantity * price) AS total_sales
FROM orderItems
GROUP BY productID;


-- 3.calculate the average order value 
select avg( totalAmount) as avg_order_value 
from orders;

-- 4.List the top 5 customers by total spending 
select customer.customerID, orders.totalAmount as total_spending
from customer 
join orders 
on customer.customerID = orders.customerID
order by totalAmount desc
limit 5;

-- 5.Retrieve the most popular product category
select c.categoryName, sum(oi.quantity) as total_sold
from orderItems oi
join product p on oi.productID = p.productID
join categories c on p.categoryID = c.categoryID
group by c.categoryName
order by total_sold desc
limit 1;


-- 6.list all product that are out of stock
select * from product
where stock = 0;

-- 7.find customer who placed orders in the last 30 days
select  customer.firstName, customer.lastName, customer.customerID, orders.orderDate
from customer 
join orders on customer.customerID = orders.customerID
where orderDate >= now() - interval 60 day;

-- 8.calculate the total number of placed each month
SELECT 
    YEAR(orderDate) AS Year,
    MONTHNAME(orderDate) AS Month,
    COUNT(orderID) AS TotalOrders
FROM orders
GROUP BY YEAR(orderDate), MONTHNAME(orderDate);

-- 9 Retrieve the details of the most recent order
select * from orders 
order by orderID desc
limit 1;

-- 10. find the average price of products in each category
select avg(p.price) as avg_price , c.categoryName, c.categoryID
from categories c
join product p 
on c.categoryID = p.categoryID
group by c.categoryName,  c.categoryID;



