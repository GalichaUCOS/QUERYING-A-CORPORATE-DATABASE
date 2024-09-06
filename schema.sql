DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Shippings;


CREATE TABLE school_years (
    school_year_id INT PRIMARY KEY,
    year_start INT NOT NULL,
    year_end INT NOT NULL
);

CREATE TABLE semesters (
    semester_id INT PRIMARY KEY,
    school_year_id INT,
    semester INT
);

CREATE TABLE grading_periods (
    grading_period_id INT PRIMARY KEY,
    semester_id INT,
    grading_period INT
);


CREATE TABLE registrar_staffs (
    registrar_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    date_added DATE NOT NULL
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    dean_id INT,
    added_by INT,
    date_added DATE NOT NULL,
    school_year_id INT
);

CREATE TABLE programs (
    program_id INT PRIMARY KEY,
    registrar_id INT,
    department_id INT,
    school_year_id INT,
    program_name VARCHAR(100) NOT NULL,
    date_added TIMESTAMP NOT NULL
);

CREATE TABLE available_subjects (
    available_subject_id INT PRIMARY KEY,
    program_id INT,
    school_year_id INT,
    semester_id INT,
    registrar_id INT,
    is_minor_subject BOOLEAN,
    available_subject_name VARCHAR(100) NOT NULL,
    year_level INT,
    date_added DATE NOT NULL
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    program_id INT,
    username VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    year_level INT,
    date_of_birth DATE NOT NULL,
    date_added DATE NOT NULL
);

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dean_id INT,
    date_of_birth DATE NOT NULL,
    date_added DATE NOT NULL
);

CREATE TABLE deans (
    dean_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    registrar_id INT,
    dept_id INT,
    date_added DATE NOT NULL
);

CREATE TABLE grades (
    grade_id INT PRIMARY KEY,
    class_id INT,
    faculty_id INT,
    student_id INT,
    school_year_id INT,
    grading_period_id INT,
    grade DECIMAL(5, 2)
);

CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    available_subject_id INT,
    room_id INT,
    program_id INT,
    faculty_id INT,
    registrar_id INT,
    section_number VARCHAR(10),
    day VARCHAR(10),
    time_start TIME,
    time_end TIME,
    date_added DATE NOT NULL
);

CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    registrar_id INT,
    date_added DATE NOT NULL
);

CREATE TABLE enrolled_subjects (
    enrolled_subject_id INT PRIMARY KEY,
    student_id INT,
    class_id INT,
    semester_id INT,
    registrar_id INT,
    is_paid BOOLEAN,
    date_added DATE NOT NULL
);


INSERT INTO school_years (school_year_id, year_start, year_end) VALUES
(1, 2019, 2020),
(2, 2020, 2021);

INSERT INTO semesters (semester_id, school_year_id, semester) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2);

INSERT INTO grading_periods (grading_period_id, semester_id, grading_period) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 2, 4);


INSERT INTO registrar_staffs (registrar_id, username, first_name, last_name, date_of_birth, date_added) VALUES
(1, 'reg_staff1', 'Alice', 'Johnson', '1985-01-15', '2024-01-01'),
(2, 'reg_staff2', 'Bob', 'Smith', '1990-02-20', '2024-01-02'),
(3, 'reg_staff3', 'Charlie', 'Brown', '1988-03-25', '2024-01-03'),
(4, 'reg_staff4', 'Diana', 'White', '1992-04-30', '2024-01-04'),
(5, 'reg_staff5', 'Ethan', 'Green', '1980-05-05', '2024-01-05');


INSERT INTO departments (department_id, department_name, dean_id, added_by, date_added, school_year_id) VALUES
(1, 'Computer Science', 1, 1, '2024-01-01', 1),
(2, 'Business Administration', 2, 2, '2024-01-02', 1),
(3, 'Engineering', 3, 3, '2024-01-03', 1),
(4, 'Arts and Humanities', 4, 4, '2024-01-04', 1),
(5, 'Health Sciences', 5, 5, '2024-01-05', 1);


INSERT INTO programs (program_id, registrar_id, department_id, school_year_id, program_name, date_added) VALUES
(1, 1, 1, 1, 'Bachelor of Science in Computer Science', '2024-01-15 10:00:00'),
(2, 2, 1, 1, 'Bachelor of Science in Information Technology', '2024-01-16 11:00:00'),
(3, 3, 2, 1, 'Bachelor of Business Administration', '2024-01-17 12:00:00'),
(4, 4, 2, 1, 'Bachelor of Marketing', '2024-01-18 13:00:00'),
(5, 5, 3, 2, 'Bachelor of Mechanical Engineering', '2024-01-19 14:00:00'),
(6, 1, 3, 2, 'Bachelor of Civil Engineering', '2024-01-20 15:00:00'),
(7, 2, 4, 2, 'Bachelor of Fine Arts', '2024-01-21 16:00:00'),
(8, 3, 4, 2, 'Bachelor of Music', '2024-01-22 17:00:00'),
(9, 4, 5, 2, 'Bachelor of Nursing', '2024-01-23 18:00:00'),
(10, 5, 5, 2, 'Bachelor of Public Health', '2024-01-24 19:00:00');


INSERT INTO available_subjects (available_subject_id, program_id, school_year_id, semester_id, registrar_id, is_minor_subject, available_subject_name, year_level, date_added) VALUES
(1, 1, 1, 1, 1, FALSE, 'Data Structures', 1, '2024-01-01'),
(2, 1, 1, 1, 1, FALSE, 'Algorithms', 1, '2024-01-02'),
(3, 2, 1, 1, 2, FALSE, 'Web Development', 1, '2024-01-03'),
(4, 3, 1, 1, 3, FALSE, 'Marketing Principles', 1, '2024-01-04'),
(5, 4, 1, 1, 4, FALSE, 'Consumer Behavior', 1, '2024-01-05'),
(6, 5, 2, 2, 5, FALSE, 'Thermodynamics', 2, '2024-01-06'),
(7, 5, 2, 2, 1, FALSE, 'Fluid Mechanics', 2, '2024-01-07'),
(8, 6, 2, 2, 2, FALSE, 'Structural Analysis', 2, '2024-01-08'),
(9, 7, 2, 2, 3, FALSE, 'Art History', 2, '2024-01-09'),
(10, 8, 2, 2, 4, FALSE, 'Music Theory', 2, '2024-01-10'),
(11, 9, 2, 2, 5, FALSE, 'Nursing Fundamentals', 2, '2024-01-11'),
(12, 10, 2, 2, 1, FALSE, 'Public Health Policy', 2, '2024-01-12'),
(13, 1, 1, 1, 1, TRUE, 'Discrete Mathematics', 1, '2024-01-13'),
(14, 2, 1, 1, 2, TRUE, 'Database Management', 1, '2024-01-14'),
(15, 3, 1, 1, 3, TRUE, 'Business Ethics', 1, '2024-01-15'),
(16, 4, 1, 1, 4, TRUE, 'Digital Marketing', 1, '2024-01-16'),
(17, 5, 2, 2, 5, TRUE, 'Engineering Ethics', 2, '2024-01-17'),
(18, 6, 2, 2, 1, TRUE, 'Environmental Engineering', 2, '2024-01-18'),
(19, 7, 2, 2, 2, TRUE, 'Art Criticism', 2, '2024-01-19'),
(20, 8, 2, 2, 3, TRUE, 'Music Composition', 2, '2024-01-20');


INSERT INTO students (student_id, program_id, username, first_name, last_name, year_level, date_of_birth, date_added) VALUES
(1, 1, 'john_doe', 'John', 'Doe', 1, '2002-05-15', '2024-01-01'),
(2, 2, 'jane_smith', 'Jane', 'Smith', 2, '2001-06-20', '2024-01-02'),
(3, 1, 'alice_jones', 'Alice', 'Jones', 3, '2000-07-25', '2024-01-03'),
(4, 3, 'bob_brown', 'Bob', 'Brown', 4, '1999-08-30', '2024-01-04'),
(5, 2, 'charlie_white', 'Charlie', 'White', 1, '2002-09-10', '2024-01-05'),
(6, 4, 'juan_dela_cruz', 'Juan', 'Dela Cruz', 2, '2000-01-01', '2024-01-06'),
(7, 6, 'maria_santos', 'Maria', 'Santos', 3, '1999-02-02', '2024-01-07'),
(8, 8, 'pedro_garcia', 'Pedro', 'Garcia', 4, '1998-03-03', '2024-01-08'),
(9, 10, 'ana_robles', 'Ana', 'Robles', 1, '1997-04-04', '2024-01-09'),
(10, 1, 'jose_ramos', 'Jose', 'Ramos', 2, '1996-05-05', '2024-01-10');

INSERT INTO faculty (faculty_id, username, first_name, last_name, dean_id, date_of_birth, date_added) VALUES
(1, 'jdoe', 'Johann', 'Müller', 1, '1980-01-15', '2024-09-01'),
(2, 'asmith', 'Anja', 'Schmidt', 2, '1985-03-22', '2024-09-01'),
(3, 'bwhite', 'Bastian', 'Weber', 1, '1990-07-30', '2024-09-01'),
(4, 'cjohnson', 'Clara', 'Fischer', 3, '1982-11-05', '2024-09-01'),
(5, 'dlee', 'David', 'Schneider', 2, '1978-05-12', '2024-09-01'),
(6, 'emartinez', 'Eva', 'Hoffmann', 4, '1995-09-18', '2024-09-01'),
(7, 'fgarcia', 'Felix', 'Klein', 3, '1988-12-25', '2024-09-01'),
(8, 'gthompson', 'Greta', 'Zimmermann', 1, '1992-02-14', '2024-09-01'),
(9, 'hroberts', 'Heinrich', 'Schwarz', 2, '1983-06-30', '2024-09-01'),
(10, 'ijones', 'Isabella', 'Braun', 4, '1991-04-20', '2024-09-01');


INSERT INTO deans (dean_id, username, first_name, last_name, date_of_birth, registrar_id, dept_id, date_added) VALUES
(1, 'dean1', 'Friedrich', 'Schmidt', '1750-01-01', 1, 1, '2024-09-01'),
(2, 'dean2', 'Wilhelmina', 'Klein', '1760-02-02', 2, 2, '2024-09-01'),
(3, 'dean3', 'Georg', 'Weber', '1770-03-03', 3, 3, '2024-09-01'),
(4, 'dean4', 'Margarete', 'Fischer', '1780-04-04', 4, 4, '2024-09-01'),
(5, 'dean5', 'Johann', 'Müller', '1790-05-05', 5, 5, '2024-09-01');


INSERT INTO grades (grade_id, class_id, faculty_id, student_id, school_year_id, grading_period_id, grade) VALUES
(1, 15, 1, 1, 1, 1, 85.00),
(2, 3, 2, 1, 1, 1, 90.50),
(3, 22, 3, 2, 1, 1, 78.00),
(4, 7, 4, 2, 1, 1, 88.75),
(5, 29, 5, 3, 1, 1, 92.00),
(6, 1, 1, 3, 1, 1, 76.50),
(7, 18, 2, 4, 1, 1, 84.00),
(8, 10, 3, 4, 1, 1, 89.25),
(9, 25, 4, 5, 1, 1, 91.00),
(10, 30, 5, 5, 1, 1, 87.50),
(11, 12, 1, 1, 1, 1, 82.00),
(12, 6, 2, 2, 1, 1, 88.00),
(13, 20, 3, 3, 1, 1, 79.50),
(14, 4, 4, 4, 1, 1, 90.00),
(15, 28, 5, 5, 1, 1, 85.75),
(16, 2, 1, 1, 1, 1, 80.00),
(17, 11, 2, 2, 1, 1, 91.50),
(18, 5, 3, 3, 1, 1, 77.00),
(19, 19, 4, 4, 1, 1, 86.25),
(20, 9, 5, 5, 1, 1, 93.00),
(21, 14, 1, 1, 1, 1, 84.50),
(22, 27, 2, 2, 1, 1, 89.00),
(23, 8, 3, 3, 1, 1, 78.75),
(24, 16, 4, 4, 1, 1, 88.00),
(25, 23, 5, 5, 1, 1, 90.50),
(26, 13, 1, 1, 1, 1, 81.00),
(27, 24, 2, 2, 1, 1, 87.00),
(28, 17, 3, 3, 1, 1, 79.25),
(29, 26, 4, 4, 1, 1, 92.00),
(30, 30, 5, 5, 1, 1, 86.50),
(31, 15, 1, 1, 1, 1, 83.00),
(32, 3, 2, 2, 1, 1, 90.00),
(33, 21, 3, 3, 1, 1, 76.50),
(34, 2, 4, 4, 1, 1, 89.75),
(35, 12, 5, 5, 1, 1, 91.00),
(36, 1, 1, 1, 1, 1, 82.50),
(37, 11, 2, 2, 1, 1, 88.25),
(38, 6, 3, 3, 1, 1, 80.00),
(39, 4, 4, 4, 1, 1, 87.75),
(40, 5, 5, 5, 1, 1, 92.50),
(41, 11, 1, 1, 1, 1, 84.00),
(42, 12, 2, 2, 1, 1, 89.50),
(43, 13, 3, 3, 1, 1, 78.25),
(44, 14, 4, 4, 1, 1, 90.75),
(45, 15, 5, 5, 1, 1, 85.00),
(46, 5, 1, 1, 1, 1, 81.50),
(47, 4, 2, 2, 1, 1, 88.75),
(48, 3, 3, 3, 1, 1, 79.00),
(49, 2, 4, 4, 1, 1, 91.25),
(50, 1, 5, 5, 1, 1, 86.00);


INSERT INTO rooms (room_id, room_number, registrar_id, date_added) VALUES
(1, '101', 1, '2024-09-01'),
(2, '102', 1, '2024-09-01'),
(3, '103', 2, '2024-09-01'),
(4, '104', 2, '2024-09-01'),
(5, '105', 3, '2024-09-01'),
(6, '201', 3, '2024-09-01'),
(7, '202', 4, '2024-09-01'),
(8, '203', 4, '2024-09-01'),
(9, '204', 5, '2024-09-01'),
(10, '205', 5, '2024-09-01'),
(11, '301', 1, '2024-09-01'),
(12, '302', 2, '2024-09-01'),
(13, '303', 3, '2024-09-01'),
(14, '304', 4, '2024-09-01'),
(15, '305', 5, '2024-09-01');

INSERT INTO classes (class_id, available_subject_id, room_id, program_id, faculty_id, registrar_id, section_number, day, time_start, time_end, date_added) VALUES
(1, 5, 12, 1, 1, 1, 'A', 'Monday', '08:00:00', '09:30:00', '2024-09-01'),
(2, 12, 3, 1, 2, 1, 'B', 'Monday', '09:45:00', '11:15:00', '2024-09-01'),
(3, 21, 8, 1, 3, 1, 'C', 'Tuesday', '10:00:00', '11:30:00', '2024-09-01'),
(4, 3, 15, 1, 4, 1, 'D', 'Tuesday', '11:45:00', '13:15:00', '2024-09-01'),
(5, 18, 5, 1, 5, 1, 'E', 'Wednesday', '08:00:00', '09:30:00', '2024-09-01'),
(6, 27, 10, 1, 1, 1, 'F', 'Wednesday', '09:45:00', '11:15:00', '2024-09-01'),
(7, 9, 1, 1, 2, 1, 'G', 'Thursday', '10:00:00', '11:30:00', '2024-09-01'),
(8, 15, 4, 1, 3, 1, 'H', 'Thursday', '11:45:00', '13:15:00', '2024-09-01'),
(9, 1, 7, 1, 4, 1, 'I', 'Friday', '08:00:00', '09:30:00', '2024-09-01'),
(10, 30, 11, 1, 5, 1, 'J', 'Friday', '09:45:00', '11:15:00', '2024-09-01'),
(11, 24, 2, 1, 1, 1, 'K', 'Monday', '10:00:00', '11:30:00', '2024-09-01'),
(12, 11, 6, 1, 2, 1, 'L', 'Monday', '11:45:00', '13:15:00', '2024-09-01'),
(13, 6, 9, 1, 3, 1, 'M', 'Tuesday', '08:00:00', '09:30:00', '2024-09-01'),
(14, 19, 14, 1, 4, 1, 'N', 'Tuesday', '09:45:00', '11:15:00', '2024-09-01'),
(15, 8, 13, 1, 5, 1, 'O', 'Wednesday', '10:00:00', '11:30:00', '2024-09-01'),
(16, 14, 4, 1, 1, 1, 'P', 'Wednesday', '11:45:00', '13:15:00', '2024-09-01'),
(17, 22, 2, 1, 2, 1, 'Q', 'Thursday', '08:00:00', '09:30:00', '2024-09-01'),
(18, 4, 15, 1, 3, 1, 'R', 'Thursday', '09:45:00', '11:15:00', '2024-09-01'),
(19, 29, 3, 1, 4, 1, 'S', 'Friday', '10:00:00', '11:30:00', '2024-09-01'),
(20, 2, 12, 1, 5, 1, 'T', 'Friday', '11:45:00', '13:15:00', '2024-09-01'),
(21, 17, 10, 2, 1, 1, 'U', 'Monday', '08:00:00', '09:30:00', '2024-09-01'),
(22, 25, 1, 2, 2, 1, 'V', 'Monday', '09:45:00', '11:15:00', '2024-09-01'),
(23, 10, 6, 2, 3, 1, 'W', 'Tuesday', '10:00:00', '11:30:00', '2024-09-01'),
(24, 28, 14, 2, 4, 1, 'X', 'Tuesday', '11:45:00', '13:15:00', '2024-09-01'),
(25, 13, 5, 2, 5, 1, 'Y', 'Wednesday', '08:00:00', '09:30:00', '2024-09-01'),
(26, 20, 11, 2, 1, 1, 'Z', 'Wednesday', '09:45:00', '11:15:00', '2024-09-01'),
(27, 26, 4, 2, 2, 1, 'AA', 'Thursday', '10:00:00', '11:30:00', '2024-09-01'),
(28, 23, 8, 2, 3, 1, 'AB', 'Thursday', '11:45:00', '13:15:00', '2024-09-01'),
(29, 7, 2, 2, 4, 1, 'AC', 'Friday', '08:00:00', '09:30:00', '2024-09-01'),
(30, 16, 9, 2, 5, 1, 'AD', 'Friday', '09:45:00', '11:15:00', '2024-09-01');



INSERT INTO enrolled_subjects (enrolled_subject_id, student_id, class_id, semester_id, registrar_id, is_paid, date_added) VALUES
(1, 1, 2, 1, 1, TRUE, '2024-09-01'),
(2, 1, 3, 1, 1, TRUE, '2024-09-01'),
(3, 2, 2, 1, 1, FALSE, '2024-09-01'),
(4, 2, 3, 1, 1, TRUE, '2024-09-01'),
(5, 3, 4, 1, 1, TRUE, '2024-09-01'),
(6, 3, 5, 1, 1, FALSE, '2024-09-01'),
(7, 4, 19, 1, 1, TRUE, '2024-09-01'),
(8, 4, 26, 1, 1, TRUE, '2024-09-01'),
(9, 5, 27, 1, 1, FALSE, '2024-09-01'),
(10, 5, 28, 1, 1, TRUE, '2024-09-01'),
(11, 1, 24, 1, 1, TRUE, '2024-09-01'),
(12, 2, 15, 1, 1, FALSE, '2024-09-01'),
(13, 3, 23, 1, 1, TRUE, '2024-09-01'),
(14, 4, 29, 1, 1, TRUE, '2024-09-01'),
(15, 5, 21, 1, 1, FALSE, '2024-09-01'),
(16, 1, 17, 1, 1, TRUE, '2024-09-01'),
(17, 2, 30, 1, 1, TRUE, '2024-09-01'),
(18, 3, 16, 1, 1, FALSE, '2024-09-01'),
(19, 4, 18, 1, 1, TRUE, '2024-09-01'),
(20, 5, 20, 1, 1, TRUE, '2024-09-01'),
(21, 1, 22, 1, 1, FALSE, '2024-09-01'),
(22, 2, 25, 1, 1, TRUE, '2024-09-01'),
(23, 3, 30, 1, 1, TRUE, '2024-09-01'),
(24, 4, 19, 1, 1, FALSE, '2024-09-01'),
(25, 5, 26, 1, 1, TRUE, '2024-09-01'),
(26, 1, 28, 1, 1, TRUE, '2024-09-01'),
(27, 2, 15, 1, 1, FALSE, '2024-09-01'),
(28, 3, 29, 1, 1, TRUE, '2024-09-01'),
(29, 4, 17, 1, 1, TRUE, '2024-09-01'),
(30, 5, 24, 1, 1, FALSE, '2024-09-01'),
(31, 1, 20, 1, 1, TRUE, '2024-09-01'),
(32, 2, 18, 1, 1, TRUE, '2024-09-01'),
(33, 3, 22, 1, 1, FALSE, '2024-09-01'),
(34, 4, 30, 1, 1, TRUE, '2024-09-01'),
(35, 5, 21, 1, 1, TRUE, '2024-09-01'),
(36, 1, 23, 1, 1, TRUE, '2024-09-01'),
(37, 2, 19, 1, 1, FALSE, '2024-09-01'),
(38, 3, 27, 1, 1, TRUE, '2024-09-01'),
(39, 4, 26, 1, 1, TRUE, '2024-09-01'),
(40, 5, 15, 1, 1, FALSE, '2024-09-01'),
(41, 1, 29, 1, 1, TRUE, '2024-09-01'),
(42, 2, 30, 1, 1, TRUE, '2024-09-01'),
(43, 3, 24, 1, 1, FALSE, '2024-09-01'),
(44, 4, 22, 1, 1, TRUE, '2024-09-01'),
(45, 5, 25, 1, 1, TRUE, '2024-09-01'),
(46, 1, 28, 1, 1, TRUE, '2024-09-01'),
(47, 2, 15, 1, 1, FALSE, '2024-09-01'),
(48, 3, 20, 1, 1, TRUE, '2024-09-01'),
(49, 4, 19, 1, 1, TRUE, '2024-09-01'),
(50, 5, 30, 1, 1, FALSE, '2024-09-01'),
(51, 1, 11, 2, 2, TRUE, '2024-09-01'),
(52, 2, 12, 2, 2, FALSE, '2024-09-01'),
(53, 3, 13, 2, 2, TRUE, '2024-09-01'),
(54, 4, 14, 2, 2, TRUE, '2024-09-01'),
(55, 5, 11, 2, 2, FALSE, '2024-09-01'),
(56, 1, 17, 2, 3, TRUE, '2024-09-01'),
(57, 2, 21, 2, 3, TRUE, '2024-09-01'),
(58, 3, 17, 2, 3, FALSE, '2024-09-01'),
(59, 4, 11, 2, 3, TRUE, '2024-09-01'),
(60, 5, 19, 2, 3, FALSE, '2024-09-01'),
(61, 1, 20, 2, 4, TRUE, '2024-09-01'),
(62, 2, 21, 2, 4, FALSE, '2024-09-01'),
(63, 3, 22, 2, 4, TRUE, '2024-09-01'),
(64, 4, 23, 2, 4, TRUE, '2024-09-01'),
(65, 5, 25, 2, 4, FALSE, '2024-09-01'),
(66, 1, 26, 2, 5, TRUE, '2024-09-01'),
(67, 2, 10, 2, 5, TRUE, '2024-09-01'),
(68, 3, 9, 2, 5, FALSE, '2024-09-01'),
(69, 4, 8, 2, 5, TRUE, '2024-09-01'),
(70, 5, 7, 2, 5, FALSE, '2024-09-01'),
(71, 1, 6, 1, 1, TRUE, '2024-09-01'),
(72, 2, 5, 1, 1, FALSE, '2024-09-01'),
(73, 3, 4, 1, 1, TRUE, '2024-09-01'),
(74, 4, 3, 1, 1, TRUE, '2024-09-01'),
(75, 5, 2, 1, 1, FALSE, '2024-09-01');


