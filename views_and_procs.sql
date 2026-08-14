USE student_db_crud;

CREATE VIEW StudentGPA AS
SELECT
    s.student_id,
    s.name,
    AVG(e.grade) AS average_grade
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name;