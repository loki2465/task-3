-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Order Items table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(101, 'Alice', 'New York'),
(102, 'Bob', 'Chicago'),
(103, 'Charlie', 'Los Angeles'),
(104, 'Diana', 'Houston'),
(105, 'Evan', 'Phoenix'),
(106, 'Fiona', 'Philadelphia'),
(107, 'George', 'San Antonio'),
(108, 'Hannah', 'San Diego'),
(109, 'Ivan', 'Dallas'),
(110, 'Julia', 'San Jose');

INSERT INTO orders VALUES
(1, 101, '2023-01-10', 900.00),
(2, 102, '2023-01-15', 120.00),
(3, 103, '2023-02-05', 250.00),
(4, 104, '2023-02-20', 620.00),
(5, 105, '2023-03-01', 85.00),
(6, 106, '2023-03-12', 560.00),
(7, 107, '2023-04-08', 330.00),
(8, 108, '2023-04-25', 740.00),
(9, 109, '2023-05-11', 430.00),
(10, 110, '2023-05-28', 280.00);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 900.00),
(2, 'Headphones', 'Electronics', 120.00),
(3, 'Book', 'Books', 25.00),
(4, 'Smartphone', 'Electronics', 620.00),
(5, 'Notebook', 'Stationery', 10.00),
(6, 'Pen', 'Stationery', 5.00),
(7, 'Tablet', 'Electronics', 330.00),
(8, 'Monitor', 'Electronics', 740.00),
(9, 'Keyboard', 'Electronics', 430.00),
(10, 'Backpack', 'Accessories', 280.00);

INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 10),
(4, 4, 4, 1),
(5, 5, 5, 3),
(6, 6, 6, 10),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1);

# Use SELECT, WHERE, ORDER BY, GROUP BY
SELECT city, COUNT(*) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > 200
GROUP BY city
ORDER BY total_orders DESC;

#Use JOINS (INNER, LEFT, RIGHT)
-- INNER JOIN
SELECT o.order_id, c.name, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- LEFT JOIN
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN (some DBMS like MySQL support RIGHT JOIN)
SELECT o.order_id, c.name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;

#Write subqueries
-- Get customers who placed orders worth more than average total
SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(total_amount) > (
        SELECT AVG(total_amount) FROM orders
    )
);

#.Use aggregate functions (SUM, AVG)
SELECT category, SUM(p.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY category;

#.Create views for analysis
CREATE VIEW customer_order_summary AS
SELECT c.name, COUNT(o.order_id) AS order_count, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

#Optimize queries with indexes
-- Useful Indexes
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_customers_city ON customers(city);