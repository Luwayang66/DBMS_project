CREATE TABLE Customer (
    customer_id     INT PRIMARY KEY,
    customer_name   VARCHAR(100) NOT NULL,
    address         VARCHAR(200),
    phone           VARCHAR(15),
    email           VARCHAR(100),
    gst_number      VARCHAR(20)
);

CREATE TABLE Product (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(100) NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL,
    quantity_stock  INT,
    category        VARCHAR(50)
);

CREATE TABLE Bill (
    bill_id         INT PRIMARY KEY,
    bill_date       DATE,
    customer_id     INT,
    total_amount    DECIMAL(12,2),
    tax_amount      DECIMAL(12,2),
    grand_total     DECIMAL(12,2),
    payment_status  VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Bill_Item (
    bill_item_id    INT PRIMARY KEY,
    bill_id         INT,
    product_id      INT,
    quantity        INT,
    rate            DECIMAL(10,2),
    amount          DECIMAL(12,2),
    FOREIGN KEY (bill_id)    REFERENCES Bill(bill_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Customer VALUES (1, 'Amit Traders', 'Connaught Place, New Delhi', '9811122233', 'amit@email.com', '07AAACA1234A1Z5');
INSERT INTO Customer VALUES (2, 'Neha Stores', 'Karol Bagh, New Delhi', '9833344455', 'neha@email.com', NULL);

INSERT INTO Product VALUES (1, 'Rice 5kg Bag',   350.00, 100, 'Grocery');
INSERT INTO Product VALUES (2, 'Wheat Flour 10kg', 420.00, 80, 'Grocery');
INSERT INTO Product VALUES (3, 'Cooking Oil 1L',   150.00, 200, 'Grocery');

INSERT INTO Bill VALUES (1, '2024-03-15', 1, 1140.00, 102.60, 1242.60, 'PAID');
INSERT INTO Bill VALUES (2, '2024-03-16', 2,  350.00,  31.50,  381.50, 'UNPAID');

INSERT INTO Bill_Item VALUES (1, 1, 1, 2, 700.00);
INSERT INTO Bill_Item VALUES (2, 1, 3, 3, 450.00);
INSERT INTO Bill_Item VALUES (3, 2, 1, 1, 350.00);

UPDATE Product SET unit_price = 360.00 WHERE product_id = 1;
UPDATE Bill    SET payment_status = 'PAID' WHERE bill_id = 2;

DELETE FROM Bill_Item WHERE bill_item_id = 3;
DELETE FROM Bill     WHERE bill_id = 2;
DELETE FROM Customer WHERE customer_id = 2;
