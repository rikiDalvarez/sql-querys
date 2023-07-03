-- getAllStudents
SELECT nombre, apelido1, apelido2 AS "full name" FROM persona ORDER BY apelido1, apelido2, nombre;

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


-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
-- Retorna un llistat amb els professors/es que no estan associats a un departament.
-- Retorna un llistat amb els departaments que no tenen professors/es associats.
-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
