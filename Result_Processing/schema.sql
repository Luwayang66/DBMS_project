CREATE TABLE Student (
    student_id      INT PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    date_of_birth   DATE,
    gender          CHAR(1),
    email           VARCHAR(100),
    phone           VARCHAR(15),
    address         VARCHAR(200),
    department_id   INT,
    admission_date  DATE
);

CREATE TABLE Course (
    course_id       INT PRIMARY KEY,
    course_name     VARCHAR(100) NOT NULL,
    credits         INT,
    department_id   INT,
    semester        INT
);

CREATE TABLE Enrollment (
    enrollment_id   INT PRIMARY KEY,
    student_id      INT,
    course_id       INT,
    semester        INT,
    academic_year   INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id)  REFERENCES Course(course_id)
);

CREATE TABLE Result (
    result_id       INT PRIMARY KEY,
    enrollment_id   INT,
    marks_obtained  DECIMAL(5,2),
    max_marks       DECIMAL(5,2) DEFAULT 100.00,
    grade           VARCHAR(2),
    grade_point     DECIMAL(3,2),
    result_status   VARCHAR(10)
);

INSERT INTO Student VALUES (1, 'Rahul', 'Sharma', '2002-05-15', 'M', 'rahul@college.edu', '9876543210', 'Delhi', 101, '2021-07-01');
INSERT INTO Student VALUES (2, 'Priya', 'Verma', '2003-02-20', 'F', 'priya@college.edu', '9876501234', 'Mumbai', 102, '2021-07-01');

INSERT INTO Course VALUES (101, 'Database Management Systems', 4, 101, 5);
INSERT INTO Course VALUES (102, 'Operating Systems', 4, 101, 5);

INSERT INTO Enrollment VALUES (1, 1, 101, 5, 2024);
INSERT INTO Enrollment VALUES (2, 1, 102, 5, 2024);

INSERT INTO Result VALUES (1, 1, 85.50, 100.00, 'A', 9.00, 'PASS');
INSERT INTO Result VALUES (2, 2, 72.00, 100.00, 'B', 8.00, 'PASS');

UPDATE Result SET marks_obtained = 88.00, grade = 'A+', grade_point = 9.50 WHERE result_id = 1;
UPDATE Student  SET phone = '9998887776' WHERE student_id = 2;

DELETE FROM Result        WHERE result_id = 2;
DELETE FROM Enrollment    WHERE enrollment_id = 2;
DELETE FROM Student       WHERE student_id = 2;
