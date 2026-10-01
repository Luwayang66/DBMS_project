CREATE TABLE Category (
    category_id     INT PRIMARY KEY,
    category_name   VARCHAR(50) NOT NULL
);

CREATE TABLE SM_Product (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(100) NOT NULL,
    category_id     INT,
    brand           VARCHAR(50),
    unit_price      DECIMAL(10,2) NOT NULL,
    stock_quantity  INT,
    expiry_date     DATE,
    barcode         VARCHAR(20),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Cashier (
    cashier_id      INT PRIMARY KEY,
    cashier_name    VARCHAR(100) NOT NULL,
    shift           VARCHAR(10),
    phone           VARCHAR(15)
);

CREATE TABLE Sale (
    sale_id         INT PRIMARY KEY,
    sale_date       DATE,
    sale_time       TIME,
    cashier_id      INT,
    customer_name   VARCHAR(100),
    subtotal        DECIMAL(12,2),
    discount        DECIMAL(12,2),
    tax_amount      DECIMAL(12,2),
    total_amount    DECIMAL(12,2),
    payment_method  VARCHAR(10),
    FOREIGN KEY (cashier_id) REFERENCES Cashier(cashier_id)
);

CREATE TABLE Sale_Item (
    sale_item_id    INT PRIMARY KEY,
    sale_id         INT,
    product_id      INT,
    quantity        INT,
    unit_price      DECIMAL(10,2),
    item_total      DECIMAL(12,2),
    FOREIGN KEY (sale_id)    REFERENCES Sale(sale_id),
    FOREIGN KEY (product_id) REFERENCES SM_Product(product_id)
);

INSERT INTO Category VALUES (1, 'Beverages');
INSERT INTO Category VALUES (2, 'Snacks');
INSERT INTO Category VALUES (3, 'Dairy');

INSERT INTO SM_Product VALUES (1, 'Coca-Cola 500ml',    1, 'Coca-Cola',  40.00, 150, '2025-06-01', '890123450001');
INSERT INTO SM_Product VALUES (2, 'Lays Magic Masala',  2, 'Lays',       20.00, 200, '2025-04-15', '890123450002');
INSERT INTO SM_Product VALUES (3, 'Amul Taaza Milk 1L', 3, 'Amul',       66.00, 100, '2024-03-25', '890123450003');

INSERT INTO Cashier VALUES (1, 'Rohit Verma', 'Morning', '9812345670');
INSERT INTO Cashier VALUES (2, 'Pooja Nair',  'Evening', '9809876543');

INSERT INTO Sale VALUES (1, '2024-03-20', '10:15:00', 1, 'Walk-in Customer', 126.00, 0.00, 11.34, 137.34, 'UPI');
INSERT INTO Sale VALUES (2, '2024-03-20', '11:30:00', 1, 'Walk-in Customer',  60.00, 5.00,  5.40,  60.40, 'CASH');

INSERT INTO Sale_Item VALUES (1, 1, 1, 2, 40.00,  80.00);
INSERT INTO Sale_Item VALUES (2, 1, 3, 1, 66.00,  66.00);
INSERT INTO Sale_Item VALUES (3, 2, 2, 3, 20.00,  60.00);

UPDATE SM_Product SET stock_quantity = stock_quantity - 2 WHERE product_id = 1;
UPDATE Sale      SET payment_method = 'CARD' WHERE sale_id = 2;

DELETE FROM Sale_Item WHERE sale_item_id = 3;
DELETE FROM Sale      WHERE sale_id = 2;
