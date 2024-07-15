create database online_order;
use online_order;

drop database online_order;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address TEXT
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO Products (Name, Description, Price, Stock) VALUES
('Laptop', 'High-performance laptop', 999.99, 10),
('Smartphone', 'Latest model smartphone', 699.99, 25),
('Tablet', 'Portable and powerful tablet', 399.99, 15),
('Headphones', 'Noise-cancelling over-ear headphones', 199.99, 50),
('Smartwatch', 'Feature-packed smartwatch', 249.99, 30),
('Gaming Console', 'Next-gen gaming console', 499.99, 20),
('Camera', 'DSLR camera with 24MP sensor', 799.99, 12),
('Bluetooth Speaker', 'Portable Bluetooth speaker', 99.99, 40),
('Monitor', '27-inch 4K UHD monitor', 299.99, 18),
('Keyboard', 'Mechanical keyboard with RGB lighting', 89.99, 60),
('Mouse', 'Wireless ergonomic mouse', 49.99, 75),
('Printer', 'All-in-one wireless printer', 149.99, 22),
('External Hard Drive', '1TB external hard drive', 59.99, 45),
('Router', 'Dual-band WiFi router', 79.99, 25),
('Flash Drive', '64GB USB 3.0 flash drive', 14.99, 100);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Elm St'),
('Alice', 'Johnson', 'alice.johnson@example.com', '5556789012', '789 Maple Ave'),
('Bob', 'Williams', 'bob.williams@example.com', '5551234567', '321 Oak Dr'),
('Emily', 'Davis', 'emily.davis@example.com', '5552345678', '654 Pine St'),
('Michael', 'Brown', 'michael.brown@example.com', '5553456789', '987 Cedar Rd'),
('Jessica', 'Taylor', 'jessica.taylor@example.com', '5554567890', '741 Birch Ln'),
('Daniel', 'Anderson', 'daniel.anderson@example.com', '5555678901', '852 Walnut St'),
('Sarah', 'Thomas', 'sarah.thomas@example.com', '5556789012', '963 Spruce Ct'),
('David', 'Jackson', 'david.jackson@example.com', '5557890123', '123 Chestnut St'),
('Laura', 'White', 'laura.white@example.com', '5558901234', '456 Cherry Blvd'),
('James', 'Harris', 'james.harris@example.com', '5559012345', '789 Magnolia Way'),
('Linda', 'Martinez', 'linda.martinez@example.com', '5550123456', '321 Poplar Pl'),
('Robert', 'Clark', 'robert.clark@example.com', '5551234567', '654 Willow Rd'),
('Patricia', 'Lewis', 'patricia.lewis@example.com', '5552345678', '987 Ash Ln');

INSERT INTO Orders (CustomerID, TotalAmount) VALUES
(1, 1699.98),
(2, 799.99),
(3, 459.98),
(4, 1299.97),
(5, 249.99),
(6, 1099.98),
(7, 399.98),
(8, 149.98),
(9, 699.99),
(10, 1499.99),
(11, 89.99),
(12, 299.99),
(13, 1199.98),
(14, 649.98),
(15, 199.98);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 999.99),
(1, 2, 1, 699.99),
(2, 3, 2, 399.99),
(3, 4, 1, 199.99),
(3, 5, 1, 259.99),
(4, 6, 1, 499.99),
(4, 7, 1, 799.98),
(5, 8, 2, 124.99),
(6, 9, 1, 299.99),
(6, 10, 1, 799.99),
(7, 11, 2, 49.99),
(7, 12, 1, 299.99),
(8, 13, 1, 59.99),
(8, 14, 1, 89.99),
(9, 15, 1, 79.99),
(10, 1, 1, 999.99),
(10, 2, 1, 499.99),
(11, 3, 1, 89.99),
(12, 4, 1, 299.99),
(13, 5, 2, 599.99),
(14, 6, 1, 199.99),
(15, 7, 2, 99.99);

INSERT INTO Payments (OrderID, Amount, PaymentMethod) VALUES
(1, 1699.98, 'Credit Card'),
(2, 799.99, 'PayPal'),
(3, 459.98, 'Debit Card'),
(4, 1299.97, 'Credit Card'),
(5, 249.99, 'Cash'),
(6, 1099.98, 'Bank Transfer'),
(7, 399.98, 'Credit Card'),
(8, 149.98, 'PayPal'),
(9, 699.99, 'Credit Card'),
(10, 1499.99, 'Debit Card'),
(11, 89.99, 'Cash'),
(12, 299.99, 'Credit Card'),
(13, 1199.98, 'PayPal'),
(14, 649.98, 'Debit Card'),
(15, 199.98, 'Credit Card');


select *from Customers;
select *from Orders;
select *from products;
select *from OrderDetails;


SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName, p.Name, od.Quantity, od.Price
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

