USE student_db_crud;

INSERT INTO Students (name, email, enrollment_date) VALUES
('Ayesha Khan',      'ayesha.khan@example.com',      '2023-09-01'),
('Bilal Ahmed',      'bilal.ahmed@example.com',      '2023-09-01'),
('Sara Malik',       'sara.malik@example.com',       '2024-01-15'),
('Hamza Iqbal',      'hamza.iqbal@example.com',      '2024-01-15'),
('Zainab Raza',      'zainab.raza@example.com',      '2024-09-01');

INSERT INTO Courses (course_name, credit_hours, instructor_name) VALUES
('Database Systems',        3.0, 'Dr. Nasir Farooq'),
('Data Structures',         4.0, 'Dr. Ayaan Sheikh'),
('Web Development',         3.0, 'Ms. Hira Aslam'),
('Operating Systems',       3.5, 'Dr. Nasir Farooq'),
('Software Engineering',    3.0, 'Ms. Hira Aslam');

INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2023-09-05', 3.70),
(1, 2, '2023-09-05', 3.30),
(2, 1, '2023-09-06', 2.70),
(2, 3, '2024-01-20', NULL),
(3, 2, '2024-01-18', 4.00),
(3, 4, '2024-01-18', NULL),
(4, 5, '2024-01-20', 3.00);