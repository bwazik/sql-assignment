CREATE TABLE governorates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE stores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    governorate_id INT,
    FOREIGN KEY (governorate_id) REFERENCES governorates(id)
);

CREATE TABLE suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    brief_data TEXT
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE store_products (
    store_id INT,
    product_id INT,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES stores(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Query 1: Get all order numbers with product code starting with S18 and price > 100
SELECT DISTINCT orderNumber 
FROM orderdetails 
WHERE productCode LIKE 'S18%' AND price > 100;

-- Query 2: Get all payments made on day 5 or 6
SELECT * 
FROM payments 
WHERE DAY(paymentDate) IN (5, 6);

-- Query 3: Get the fifth-highest credit limit of customers in the USA with '5555' in phone
SELECT DISTINCT creditLimit 
FROM customers 
WHERE country = 'USA' AND phone LIKE '%5555%' 
ORDER BY creditLimit DESC 
LIMIT 1 OFFSET 4;
