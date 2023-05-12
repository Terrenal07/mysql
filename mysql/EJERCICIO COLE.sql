SELECT * FROM cole.alumnos;
SELECT * FROM cole.asignaturas;
SELECT * FROM cole.matriculas;
DROP DATABASE IF exists cole;
CREATE DATABASE cole;
CREATE TABLE cole.asignaturas (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);
INSERT INTO cole.asignaturas (nombre, precio)
VALUES ('Matematicas', 60),
       ('lengua', 40.5),
       ('ingles', 45.3),
       ('geografia', 10.5),
       ('artes', 5.2);
CREATE TABLE cole.alumnos (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);
INSERT INTO cole.alumnos (nombre)
VALUES ('maria'), ('pedro'), ('juan'), ('antonia');
CREATE TABLE cole.matriculas (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_asignatura INT NOT NULL,
    id_alumno INT NOT NULL,
    FOREIGN KEY (id_asignatura) REFERENCES cole.asignaturas(id),
    FOREIGN KEY (id_alumno) REFERENCES cole.alumnos(id),
    CONSTRAINT fk_id_asignatura FOREIGN KEY (id_asignatura) REFERENCES cole.asignaturas(id) ON DELETE RESTRICT,
    CONSTRAINT fk_id_alumno FOREIGN KEY (id_alumno) REFERENCES cole.alumnos(id) ON DELETE RESTRICT
);
INSERT INTO cole.matriculas (fecha, id_asignatura, id_alumno)
VALUES ('2023-05-11', 4, 1),('2023-05-11', 3, 2),('2023-05-11', 3, 3),('2023-05-11', 2, 4),('2023-05-11', 1, 4);
/*lista de alumnos y sus matriculas*/
SELECT a.id, a.nombre AS nombre_alumno, m.fecha, asignaturas.nombre AS nombre_asignatura
FROM cole.alumnos AS a
JOIN cole.matriculas AS m ON a.id = m.id_alumno
JOIN cole.asignaturas ON m.id_asignatura = asignaturas.id;
/*lista de asignaturas sin alumnos*/
SELECT a.id, a.nombre, a.precio
FROM cole.asignaturas AS a
LEFT JOIN cole.matriculas AS m ON a.id = m.id_asignatura
WHERE m.id_asignatura IS NULL;
/*facturas del mes para un alumno*/
SELECT a.nombre AS nombre_alumno, asignaturas.nombre AS nombre_asignatura, SUM(asignaturas.precio) AS precio_total
FROM cole.alumnos AS a
JOIN cole.matriculas AS m ON a.id = m.id_alumno
JOIN cole.asignaturas ON m.id_asignatura = asignaturas.id
WHERE a.nombre = 'antonia'
  AND YEAR(m.fecha) = YEAR(CURRENT_DATE())
  AND MONTH(m.fecha) = MONTH(CURRENT_DATE())
GROUP BY a.nombre, asignaturas.nombre;