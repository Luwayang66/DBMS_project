CREATE TABLE Patient (
    patient_id      INT PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    date_of_birth   DATE,
    gender          CHAR(1),
    blood_group     VARCHAR(5),
    phone           VARCHAR(15),
    address         VARCHAR(200),
    admission_date  DATE,
    status          VARCHAR(10)
);

CREATE TABLE Doctor (
    doctor_id       INT PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    specialization  VARCHAR(100),
    phone           VARCHAR(15),
    email           VARCHAR(100),
    department      VARCHAR(50),
    availability    VARCHAR(20)
);

CREATE TABLE Appointment (
    appointment_id  INT PRIMARY KEY,
    patient_id      INT,
    doctor_id       INT,
    appointment_date DATE,
    appointment_time TIME,
    reason          VARCHAR(200),
    status          VARCHAR(10),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctor(doctor_id)
);

CREATE TABLE Treatment (
    treatment_id    INT PRIMARY KEY,
    patient_id      INT,
    doctor_id       INT,
    diagnosis       VARCHAR(300),
    prescription    TEXT,
    treatment_date  DATE,
    bill_amount     DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctor(doctor_id)
);

INSERT INTO Patient VALUES (1, 'Vikram', 'Singh', '1985-08-22', 'M', 'B+', '9822233344', 'Jaipur', '2024-03-10', 'ADMITTED');
INSERT INTO Patient VALUES (2, 'Anita', 'Desai', '1990-11-05', 'F', 'O+', '9844455566', 'Surat', '2024-03-12', 'DISCHARGED');

INSERT INTO Doctor VALUES (1, 'Dr. Rajesh', 'Kumar', 'Cardiologist', '9866677788', 'rajesh@hospital.com', 'Cardiology', 'Available');
INSERT INTO Doctor VALUES (2, 'Dr. Meera', 'Iyer', 'Neurologist', '9888899900', 'meera@hospital.com', 'Neurology', 'Available');

INSERT INTO Appointment VALUES (1, 1, 1, '2024-03-10', '10:30:00', 'Chest pain', 'COMPLETED');
INSERT INTO Appointment VALUES (2, 2, 2, '2024-03-12', '14:00:00', 'Migraine', 'COMPLETED');

INSERT INTO Treatment VALUES (1, 1, 1, 'Mild angina', 'Aspirin 75mg daily, Atorvastatin 10mg', '2024-03-10', 5000.00);
INSERT INTO Treatment VALUES (2, 2, 2, 'Chronic migraine', 'Sumatriptan 50mg as needed', '2024-03-12', 3500.00);

UPDATE Patient SET status = 'DISCHARGED' WHERE patient_id = 1;
UPDATE Doctor  SET availability = 'Unavailable' WHERE doctor_id = 1;

DELETE FROM Treatment   WHERE treatment_id = 2;
DELETE FROM Appointment WHERE appointment_id = 2;
DELETE FROM Patient     WHERE patient_id = 2;
