/* FIRST STEP IS TO CREATE A DATABASE */

CREATE DATABASE db_zoo;

/* YOU ALWAYS WANT TO START BY STATING WHICH DATABASE YOU ARE GOING TO USE TO CREATE YOUR TABLES */

USE db_zoo;


/* THEN WE CREATE TABLES */

CREATE TABLE tbl_animalia (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animalia_type VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_class (
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_order (
	order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	order_type VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_care (
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	care_specialist VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_nutrition (
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
	nutrition_type VARCHAR(50) NOT NULL,
	nutrition_cost MONEY NOT NULL
);


CREATE TABLE tbl_habitat (
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
	habitat_type VARCHAR(50) NOT NULL,
	habitat_cost MONEY NOT NULL
);


CREATE TABLE tbl_specialist (
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_species (
	species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	species_name VARCHAR(50) NOT NULL,
	species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
);


/* THEN WE INSERT DATA INTO TABLES */

INSERT INTO tbl_animalia
	(animalia_type) 
	VALUES 
	('vertebrate'),
	('invertebrate')
;
SELECT * FROM tbl_animalia;


INSERT INTO tbl_class
	(class_type)
	VALUES
	('bird'),
	('reptilian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm')
;
SELECT * FROM tbl_class;


INSERT INTO tbl_order
	(order_type)
	VALUES
	('carnivore'),
	('herbivore'),
	('omnivore')
;
SELECT * FROM tbl_order;


INSERT INTO tbl_care
	(care_id, care_type, care_specialist)
	VALUES
	('care_0', 'replace the straw', 1),
	('care_1', 'repair or repalce broken toys', 4),
	('care_2', 'bottle feed vitamins', 1),
	('care_3', 'human contact_pet subject', 2),
	('care_4', 'clean up animal waste', 1),
	('care_5', 'move subject to exercise pen', 3),
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;
SELECT * FROM tbl_care;


INSERT INTO tbl_nutrition
	(nutrition_type, nutrition_cost)
	VALUES
	('raw fish', 1500),
	('living rodents', 600),
	('misture of fruit and rice', 800),
	('warm bottle of milk', 600),
	('syringe feed broth', 600),
	('lard and seed mix', 300),
	('aphids', 150),
	('vitamins and marrow', 3500)
;
SELECT * FROM tbl_nutrition;


INSERT INTO tbl_habitat
	(habitat_type, habitat_cost)
	VALUES
	('tundra', 40000),
	('grassy gnoll with trees', 12000),
	('10 ft pond and rocks', 30000),
	('icy aquarium with snowy facade', 50000),
	('short grass, shade, and moat', 50000),
	('netted forest atrium', 10000),
	('jungle vines and winding branches', 15000),
	('cliff with shaded cave', 15000)
;
SELECT * FROM tbl_habitat;


INSERT INTO tbl_specialist
	(specialist_fname, specialist_lname, specialist_contact)
	VALUES
	('margret', 'nyguen', '384-576-2899'),
	('mary', 'fischer', '384-784-4856'),
	('arnold', 'holden', '385-475-3944'),
	('kem', 'byesan', '384-485-4855'),
	('delmonte', 'fyedo', '768-288-3749')
;
SELECT * FROM tbl_specialist;


INSERT INTO tbl_species
	(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	VALUES
	('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
	('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
	('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
	('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
	('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
	('panda', 1, 102, 3, 5006, 2202, 'care_4'),
	('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
	('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
;
SELECT * FROM tbl_species;


/* NOW WE STORE PROCEDURE FOR THAT USE FUNCTIONS TO DISPLAY DATA IN A MORE MEANINGFUL WAY */

SELECT
	a1.species_name, a2.animalia_type,
	a3.class_type, a4.order_type, a5.habitat_type,
	a6.nutrition_type, a7.care_type
	FROM tbl_species a1
	INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'brown bear'
;


SELECT
	a1.species_name, a2.animalia_type,
	a3.class_type, a4.order_type, a5.habitat_type,
	a6.nutrition_type, a7.care_type
	FROM tbl_species a1
	INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'ghost bat'
;


SELECT
	a1.species_name, a2.habitat_type, a2.habitat_cost,
	a3.nutrition_type, a3.nutrition_cost
	FROM tbl_species a1
	INNER JOIN tbl_habitat a2 ON a2.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
	WHERE species_name = 'ghost bat'
;


/* THIS NEXT LITTLE STEP IS JUST AN EXAMPLE OF HOW TO CONDITIONALLY DELETE DATA FROM TABLES */

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tbl_species)
	DROP TABLE tbl_species, tbl_animalia, tbl_care, tbl_habitat, tbl_nutrition, tbl_order, tbl_specialist;


/* ASSIGNMENT: STEP 219 - JOINING NUTRITION AND SPECIES TABLES*/
/* STEP 1: DISPLAY THE TWO TABLES */
SELECT * FROM tbl_nutrition;
SELECT * FROM tbl_species;

/* STEP 2: USE THE ABOVE TWO "SELECT * FROM" STATEMENTS TO CREATE AN INNER JOIN OF THE TWO TABLES */
/* STEP 3: ADD THE CLAUSE */
SELECT * FROM tbl_nutrition
	INNER JOIN tbl_species ON /* CLAUSE-> */ tbl_species.species_nutrition = tbl_nutrition.nutrition_id
; 


/* A FEW EXAMPLES ON HOW TO CHANGE DATA */

UPDATE tbl_class SET class_type = 'bird' WHERE class_type = 'birds';

SELECT REPLACE(class_type, 'bird', 'birds') FROM tbl_class;

SELECT UPPER(class_type) FROM tbl_class WHERE class_type = 'bird';

SELECT LOWER(class_type) FROM tbl_class WHERE class_type = 'bird';

SELECT COUNT(class_type) FROM tbl_class WHERE class_type = 'bird';


CREATE TABLE tbl_persons (
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_persons
	(persons_fname, persons_lname, persons_contact)
	VALUES
	('bob', 'smith', '555-555-5555'),
	('mary', 'stevens', '555-555-5555'),
	('tex', 'burns', '555-555-5555'),
	('gerry', 'kerns', '555-555-5555'),
	('sally', 'fields', '555-555-5555')
;

UPDATE tbl_persons SET persons_fname = 'mars' WHERE persons_fname = 'bob';


SELECT * FROM tbl_persons;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_id BETWEEN 3 AND 5;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE 'ke%';

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE '_u%s';

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname DESC;

SELECT persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone:' FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname;

DELETE FROM tbl_persons WHERE persons_lname = 'smith';

DROP TABLE tbl_persons; /*This will delete the entire table!*/