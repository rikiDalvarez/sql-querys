-- getAllStudents
SELECT nombre, apellido1, apellido2 AS "full name" FROM persona ORDER BY apellido1, apellido2, nombre;

--getAlumnosSinTel
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL ORDER BY apellido1, apellido2, nombre;

--getAlumnBorn1999
SELECT apellido1, apellido2, nombre, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999 ORDER BY apellido1, apellido2, nombre;

--getProfWIthoutNumb
SELECT nombre FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif REGEXP 'k$';

--getNameCuatri1cur3
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

--getTeachers&Dept
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;

--getYearOf26902806M
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin, p.nif FROM asignatura a JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar JOIN persona p ON p.id = asma.id_alumno WHERE p.nif = '26902806M';

--getTeach
SELECT d.nombre FROM asignatura a JOIN grado g ON g.id = a.id_grado JOIN profesor p USING (id_profesor) JOIN departamento d ON p.id_departamento = d.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)' AND a.id_profesor IS NOT NULL GROUP BY d.nombre;

--getAlumnMatri1819
SELECT p.apellido1, p.apellido2, p.nombre FROM alumno_se_matricula_asignatura asma JOIN persona p ON asma.id_alumno = p.id JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE anyo_inicio = 2018 AND anyo_fin = 2019 GROUP BY p.apellido1, p.apellido2, p.nombre ORDER BY p.apellido1, p.apellido2, p.nombre;

--getAllTeacherAndDept
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' ORDER BY p.apellido1, p.apellido2, p.nombre;

--getTeacherNonRegistDept
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' AND d.nombre IS NULL ORDER BY p.apellido1, p.apellido2, p.nombre;

--getDeptNonDeptRegister
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NULL;

--getTeacherN
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL ORDER BY apellido1, apellido2, nombre;

--getAsignWithoutTeacher
SELECT nombre FROM asignatura WHERE id_profesor IS NULL;

--getdeptWithoutAsign
SELECT d.nombre, a.nombre AS asignaturas FROM profesor pr LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN departamento d ON id_departamento = d.id WHERE a.nombre IS NULL GROUP BY d.nombre, a.nombre;

--getTotalAlumn
SELECT COUNT(tipo) AS total_alumnos FROM persona WHERE tipo = 'alumno';

--getAlumnBorn1999
SELECT COUNT(fecha_nacimiento) AS alumnos_year_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

--getTotalTeacherEachDEPT
SELECT d.nombre AS departamento, COUNT(p.id) AS total_profesores FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON d.id = pr.id_departamento GROUP BY d.nombre;

--getTotalDept
SELECT d.nombre AS departamento, COUNT(p.id) AS total_profesores FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN persona p ON pr.id_profesor = p.id GROUP BY d.nombre;

--getGrausyAsig
SELECT g.nombre AS grados, COUNT(a.nombre) AS total_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY total_asignaturas DESC;

--getGraus+40Asig
SELECT g.nombre AS grados, COUNT(a.nombre) AS total_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.nombre) > 40 ORDER BY total_asignaturas DESC;

--getGraus&TotalCred
SELECT g.nombre AS grados, a.tipo AS tipo_asignatura, COUNT(a.creditos) AS total_creditos FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;

--getNumberALumnEachGrau
SELECT ce.anyo_inicio, COUNT(asma.id_alumno) AS total_alumnos_matriculados FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar GROUP BY ce.anyo_inicio;

--getListaAsignProf
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) as total_asignaturas FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor GROUP BY p.id, p.nombre, p.apellido1, p.apellido2;

--getDataYoungestAlumn
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento LIMIT 1;

--getProfDeptAsc
SELECT p.id, p.nombre, p.apellido1, p.apellido2, pr.id_departamento, a.nombre AS asignaturas FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor JOIN profesor pr ON p.id = pr.id_profesor WHERE a.nombre IS NULL;

