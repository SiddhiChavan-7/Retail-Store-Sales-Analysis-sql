create database onlineRetailDB;

use onlineRetailDB;


-- customer table
create table customer(
   customerID int auto_increment primary key,
   firstName varchar(50),
   lastName varchar(50),
   email varchar(50),
   phone varchar(12),
   address varchar(200),
   city varchar(12),
   state varchar(30),
   country varchar(80),
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP
);   

-- 3 products table
CREATE TABLE product(
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(20),
    categoryID INT,
    price DECIMAL(10,2),
    stock INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
);

-- 2 categories table
CREATE TABLE categories(
     categoryID INT AUTO_INCREMENT PRIMARY KEY,
     categoryName VARCHAR(20),
     description VARCHAR(50)
);


-- 4 orders table
CREATE TABLE orders(
     orderID INT AUTO_INCREMENT PRIMARY KEY,
     customerID INT,
     orderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
     totalAmount DECIMAL(10,2),
     FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

-- 5 OrderItems table
CREATE TABLE orderItems(
     orderItemID INT AUTO_INCREMENT PRIMARY KEY,
     orderID INT,
     productID INT,
     quantity INT,
     price DECIMAL(10,2),
     FOREIGN KEY(productID) REFERENCES product(productID),
     FOREIGN KEY(orderID) REFERENCES orders(orderID)
);
     

