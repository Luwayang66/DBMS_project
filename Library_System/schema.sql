CREATE TABLE Member (
    member_id       INT PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    email           VARCHAR(100),
    phone           VARCHAR(15),
    address         VARCHAR(200),
    membership_date DATE,
    membership_type VARCHAR(20)
);

CREATE TABLE Book (
    book_id         INT PRIMARY KEY,
    title           VARCHAR(200) NOT NULL,
    author          VARCHAR(100),
    isbn            VARCHAR(20),
    publisher       VARCHAR(100),
    publication_year INT,
    category        VARCHAR(50),
    total_copies    INT,
    available_copies INT
);

CREATE TABLE Borrow (
    borrow_id       INT PRIMARY KEY,
    member_id       INT,
    book_id         INT,
    issue_date      DATE,
    due_date        DATE,
    return_date     DATE,
    fine_amount     DECIMAL(8,2) DEFAULT 0.00,
    status          VARCHAR(10),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id)   REFERENCES Book(book_id)
);

INSERT INTO Member VALUES (1, 'Sneha', 'Gupta', 'sneha@library.com', '9855566677', 'Pune', '2023-01-15', 'Student');
INSERT INTO Member VALUES (2, 'Arjun', 'Mehta', 'arjun@library.com', '9877788899', 'Nagpur', '2023-06-20', 'Faculty');

INSERT INTO Book VALUES (1, 'The C Programming Language', 'Kernighan & Ritchie', '9780131103627', 'Prentice Hall', 1988, 'Computer Science', 5, 3);
INSERT INTO Book VALUES (2, 'Clean Code', 'Robert C. Martin', '9780132350884', 'Prentice Hall', 2008, 'Computer Science', 3, 2);
INSERT INTO Book VALUES (3, 'A Brief History of Time', 'Stephen Hawking', '9780553380163', 'Bantam', 1998, 'Physics', 4, 4);

INSERT INTO Borrow VALUES (1, 1, 1, '2024-03-01', '2024-03-15', '2024-03-14', 0.00, 'RETURNED');
INSERT INTO Borrow VALUES (2, 2, 2, '2024-03-10', '2024-03-24', NULL, 0.00, 'BORROWED');

UPDATE Book SET available_copies = available_copies - 1 WHERE book_id = 1;
UPDATE Borrow SET return_date = '2024-03-20', fine_amount = 30.00, status = 'RETURNED' WHERE borrow_id = 2;

DELETE FROM Borrow WHERE borrow_id = 2;
DELETE FROM Member WHERE member_id = 2;
