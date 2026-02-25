-- 1) Представлення множин: відношення 

-- Створення таблиць
CREATE TABLE students (id INT, name VARCHAR(100));
CREATE TABLE courses (id INT, name VARCHAR(100));
CREATE TABLE teaches (course_id INT, teacher_name VARCHAR(100));
CREATE TABLE takes (student_id INT, course_id INT);

-- Заповнення таблиць даними
INSERT INTO students VALUES (1, 'alice'), (2, 'bob');
INSERT INTO courses VALUES (1, 'db'), (2, 'prolog');
INSERT INTO teaches VALUES (1, 'anna'), (2, 'oleksii');
INSERT INTO takes VALUES (1, 1), (1, 2), (2, 2);

-- Запит: хто з студентів відвідує які курси і хто їх викладає
SELECT students.name AS student_name, courses.name AS course_name, teaches.teacher_name
FROM students
JOIN takes ON students.id = takes.student_id
JOIN courses ON takes.course_id = courses.id
JOIN teaches ON courses.id = teaches.course_id;


-- 2) Декартів добуток: узагальнений випадок

-- Створення таблиць
CREATE TABLE r (value INT);
CREATE TABLE s (value CHAR);
CREATE TABLE t (value CHAR);

-- Вставка даних
INSERT INTO r VALUES (1), (2);
INSERT INTO s VALUES ('a'), ('b');
INSERT INTO t VALUES ('x'), ('y');

-- Декартів добуток (CROSS JOIN)
SELECT r.value AS X, s.value AS Y, t.value AS Z
FROM r
CROSS JOIN s
CROSS JOIN t;


-- 3) θ-обмеження

-- Створення таблиць
CREATE TABLE r1 (letter CHAR(1), number INT);
CREATE TABLE r2 (letter CHAR(1), number INT);

-- Вставка даних
INSERT INTO r1 VALUES ('a', 1), ('b', 2), ('c', 3);
INSERT INTO r2 VALUES ('a', 1), ('b', 2), ('d', 4);

-- Перетин (θ-обмеження)
SELECT r1.letter, r1.number
FROM r1
JOIN r2 ON r1.letter = r2.letter AND r1.number = r2.number;


-- 4) Перетин як межовий випадок θ-обмеження

-- Створення таблиць
CREATE TABLE r1 (letter CHAR(1), number INT);
CREATE TABLE r2 (letter CHAR(1), number INT);

-- Вставка даних
INSERT INTO r1 VALUES ('a', 1), ('b', 2), ('c', 3);
INSERT INTO r2 VALUES ('a', 1), ('b', 2), ('d', 4);

-- Перетин
SELECT letter, number
FROM r1
INTERSECT
SELECT letter, number
FROM r2;


-- 5) Природне θ-з’єднання та його узагальнення

-- Створення таблиць
CREATE TABLE r1 (id INT, letter CHAR(1));
CREATE TABLE r2 (letter CHAR(1), code CHAR(1));

-- Вставка даних
INSERT INTO r1 VALUES (1, 'a'), (2, 'b'), (3, 'c');
INSERT INTO r2 VALUES ('a', 'x'), ('b', 'y'), ('c', 'z');

-- Природне з’єднання
SELECT r1.id, r1.letter, r2.code
FROM r1
JOIN r2 ON r1.letter = r2.letter;
