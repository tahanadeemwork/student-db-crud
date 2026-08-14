USE student_db_crud;

INSERT INTO Students (name, email, enrollment_date)
VALUES ('Omar Sheikh', 'omar.sheikh@example.com', '2025-01-10');

INSERT INTO Courses (course_name, credit_hours, instructor_name)
VALUES ('Computer Networks', 3.0, 'Dr. Fatima Zaidi');

INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade)
VALUES (6, 6, '2025-01-15', NULL);

SELECT
    s.name AS student_name,
    c.course_name,
    c.credit_hours,
    e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE s.student_id = 1;

SELECT
    c.course_name,
    s.name AS student_name,
    s.email,
    e.grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
JOIN Students s ON e.student_id = s.student_id
WHERE c.course_id = 1;

SELECT
    s.student_id,
    s.name,
    AVG(e.grade) AS average_grade
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name;

UPDATE Students
SET email = 'ayesha.khan.new@example.com'
WHERE student_id = 1;

UPDATE Enrollments
SET grade = 3.90
WHERE enrollment_id = 4;

UPDATE Courses
SET instructor_name = 'Dr. Sana Yousaf'
WHERE course_id = 3;

DELETE FROM Enrollments
WHERE enrollment_id = 7;

DELETE FROM Students
WHERE student_id = 6;
