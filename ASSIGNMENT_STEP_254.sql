/*============================================
	AUTHOR: KIRK HILTON 
	ASSIGNMENT: ZOO DATABASE AND STEP 254
============================================*/

/* ZOO DATABASE ASSIGNMENT 1: */

SELECT * FROM tbl_habitat;

/* ZOO DATABASE ASSIGNMENT 2: */

SELECT species_name
FROM tbl_species
WHERE species_order = 3

/* ZOO DATABASE ASSIGNMENT 3: */

SELECT nutrition_type
FROM tbl_nutrition
WHERE nutrition_cost <= 600;

/* ZOO DATABASE ASSIGNMENT 4: */

SELECT species_name
FROM tbl_species
	INNER JOIN tbl_nutrition ON nutrition_id BETWEEN 2202 AND 2206
WHERE tbl_species.species_nutrition = tbl_nutrition.nutrition_id;

/* ZOO DATABASE ASSIGNMENT 5: */

SELECT species_name 'Species Name:', nutrition_type 'Nutrition Type:'
FROM tbl_species, tbl_nutrition
WHERE tbl_species.species_nutrition = tbl_nutrition.nutrition_id;

/* ZOO DATABASE ASSIGNMENT 6: */

SELECT specialist_fname, specialist_lname, specialist_contact
FROM tbl_species, tbl_specialist
	INNER JOIN tbl_care ON care_specialist = specialist_id
WHERE care_id = 'care_6' AND care_id = species_care AND species_name = 'penguin';

/* ASSIGNMENT 7: STEP 254  */

CREATE DATABASE db_hospital;

USE db_hospital;


CREATE TABLE tbl_doctor (
	doctor_id INT PRIMARY KEY NOT NULL IDENTITY(500,1),
	doctor_name VARCHAR(50) NOT NULL,
	doctor_specialty VARCHAR(50) NOT NULL,
	floor_number INT NOT NULL
);


CREATE TABLE tbl_patient (
	patient_id INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	patient_name VARCHAR(50) NOT NULL,
	patient_DOB VARCHAR(50) NOT NULL,
	floor_number INT NOT NULL,
	room_number INT NOT NULL,
	patient_doctor INT NOT NULL CONSTRAINT fk_doctor_id FOREIGN KEY REFERENCES tbl_doctor(doctor_id)
);


INSERT INTO tbl_doctor
	(doctor_name, doctor_specialty, floor_number)
	VALUES
	('Smith, David', 'Oncology', 2),
	('Jones, George', 'Cardiology', 3),
	('Huston, Daniel', 'Radiology', 1),
	('Jeffs, Chris', 'Hematology', 2),
	('Abduhl, Kamir', 'Neurology', 3)
;
SELECT * FROM tbl_doctor;


INSERT INTO tbl_patient 
	(patient_name, patient_DOB, floor_number, room_number, patient_doctor)
	VALUES
	('Smith, Sue', '1/20/1975', 2, 203, 503),
	('Doe, Jane', '2/14/1995', 3, 314, 501),
	('Matthews, John', '5/22/1964', 3, 305, 504),
	('Gibbs, Greg', '10/19/1982', 2, 232, 500),
	('Sterns, Albert', '7/16/1952', 2, 212, 500)
;
SELECT * FROM tbl_patient;


SELECT tbl_patient.patient_name, tbl_doctor.doctor_id, tbl_patient.patient_DOB, tbl_patient.room_number, tbl_patient.floor_number
FROM tbl_patient
	INNER JOIN tbl_doctor ON doctor_id = patient_doctor
WHERE tbl_doctor.doctor_name = 'Smith, David'
;