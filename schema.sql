CREATE DATABASE IF NOT EXISTS student_db_crud;
USE student_db_crud;

CREATE TABLE Students (
    student_id      INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    email           VARCHAR(255) NOT NULL UNIQUE,
    enrollment_date DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Courses (
    course_id        INT AUTO_INCREMENT PRIMARY KEY,
    course_name      VARCHAR(150) NOT NULL,
    credit_hours     DECIMAL(3,1) NOT NULL,
    instructor_name  VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Enrollments (
    enrollment_id     INT AUTO_INCREMENT PRIMARY KEY,
    student_id        INT NOT NULL,
    course_id         INT NOT NULL,
    enrollment_date   DATE NOT NULL,
    grade             DECIMAL(3,2) DEFAULT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    UNIQUE (student_id, course_id)
) ENGINE=InnoDB;