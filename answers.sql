-- Week 7 Assignment
-- Question 1: Achieving 1NF (First Normal Form)
-- Normalizing the ProductDetail table by ensuring atomic values (one product per row)

CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100) -- Changed from 'Products' to singular for clarity
);

INSERT INTO ProductDetail (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- Question 2: Achieving 2NF (Second Normal Form)
-- Splitting OrderDetails into two tables: orders and product
-- to remove partial dependencies

-- Step 1: Create 'orders' table with OrderID and CustomerName
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 2: Create 'product' table with details linked to orders
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    productName VARCHAR(100),
    quantity INT,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(OrderID)
);

INSERT INTO product (product_id, productName, quantity, order_id)
VALUES 
(1, 'Laptop', 2, 101),
(2, 'Mouse', 1, 101),
(3, 'Tablet', 3, 102),
(4, 'Keyboard', 2, 102),
(5, 'Mouse', 1, 102),
(6, 'Phone', 1, 103);
