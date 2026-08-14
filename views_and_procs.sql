USE student_db_crud;

CREATE VIEW StudentGPA AS
SELECT
    s.student_id,
    s.name,
    AVG(e.grade) AS average_grade
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name;

DELIMITER //

CREATE PROCEDURE EnrollStudent(
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_enrollment_date DATE
)
BEGIN
    DECLARE student_exists INT DEFAULT 0;
    DECLARE course_exists INT DEFAULT 0;

    SELECT COUNT(*) INTO student_exists
    FROM Students
    WHERE student_id = p_student_id;

    SELECT COUNT(*) INTO course_exists
    FROM Courses
    WHERE course_id = p_course_id;

    IF student_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Enrollment failed: student_id does not exist.';
    ELSEIF course_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Enrollment failed: course_id does not exist.';
    ELSE
        INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade)
        VALUES (p_student_id, p_course_id, p_enrollment_date, NULL);
    END IF;
END //

DELIMITER ;