-- 11. list customer who have never placed an order
select c.customerID, c.firstName,c.lastName, c.email,c.phone
from customer c
join orders o
on c.customerID = o.customerID
where o.orderID = null;

-- 12. retrive the total quantity sold for each product
select sum(oi.quantity)  AS total_quantity_sold, p.productName
from  orderItems oi
join product p
on p.productID = oi.productID
group by p.productName;

-- 13. calculate the total revenue generated from each category
SELECT 
    p.category,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM orderItems oi
JOIN product p ON oi.productID = p.productID
GROUP BY p.category;

-- 14.find the highest-price product in each category
SELECT  categories.categoryName, MAX(product.price) AS highest_price
FROM product
JOIN categories
ON  categories.categoryID = product.categoryID
GROUP BY  categories.categoryName;

-- 15.retrive orders with a total amount greater than specific value
select   orderID , totalAmount
from orders
where   totalAmount > 5000;

-- 16.list products along with the number of orders they appers in 
select p.productName ,count(oi.orderID) as number_of_orders
from product p 
join orderItems oi
on p.productID = oi.productID
group by p.productName;

-- 17. find the top 3 most frequently ordered product
SELECT p.productName, COUNT(oi.orderID) AS total_orders
FROM product p
JOIN orderItems oi
ON p.productID = oi.productID
GROUP BY p.productName
ORDER BY total_orders DESC
LIMIT 3;

-- 18. calculate the total number of customer for each country
select count(   customerID) as total_num_of_customer , country
from customer
group by customerID;

-- 19. retrive the list of customer along with thier total spending
select c.customerID ,c.firstName,c.lastName , sum(o.totalAmount) as TotalSpending
from customer c
join orders o
on c.customerID = o.customerID
group by c.customerID ,c.firstName,c.lastName ;



-- 20.list orders with more than a specified number of items
SELECT o.orderID, COUNT(oi.orderItemID) AS total_items
FROM orders o
JOIN orderItems oi
ON oi.orderID = o.orderID
GROUP BY o.orderID
HAVING COUNT(oi.orderItemID) >= 1
ORDER BY total_items;