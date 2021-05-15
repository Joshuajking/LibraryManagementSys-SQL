--Assignment 1
SELECT * FROM tbl_habitat;

--Assignment 2
SELECT species_name
FROM tbl_species
WHERE species_order = 3;

--Assignment 3
SELECT nutrition_type
FROM tbl_nutrition
WHERE nutrition_cost <= 600;
SELECT * FROM tbl_nutrition;

--Assignment 4
SELECT species_name, species_nutrition
FROM tbl_species
LEFT JOIN tbl_nutrition
ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id
WHERE nutrition_id BETWEEN 2202 AND 2206;

--Assignment 5
SELECT species_name AS "Species Name", nutrition_type AS "Nutrition Type"
    FROM tbl_species "Species Name"
    INNER JOIN tbl_nutrition "Nutrition Type" 
    ON "Species Name".species_nutrition = "Nutrition Type".nutrition_id;

--Assignment 6
SELECT tbl_specialist.specialist_fname, tbl_specialist.specialist_lname, tbl_specialist.specialist_contact, tbl_specialist.specialist_id, tbl_species.species_care 
FROM tbl_specialist
INNER JOIN tbl_species
ON tbl_specialist.specialist_id = tbl_species.species_id
WHERE specialist_id = 6;

--Assignment 7
CREATE DATABASE db_OreTest1
USE db_OreTest1


CREATE TABLE tbl_Planet (
	Planet_ID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	Planet VARCHAR(50) NOT NULL
);

INSERT INTO tbl_Planet 
	(Planet)
	VALUES
		('Alioth'),
		('Ion'),
		('Symeon')
;
SELECT * FROM tbl_Planet;

CREATE TABLE tbl_OreName (
	ID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	T1 VARCHAR(50) NOT NULL,
	T2 VARCHAR(50) NOT NULL,
	T3 VARCHAR(50) NOT NULL,
	T4 VARCHAR(50) NOT NULL,
	Planet_ID INT FOREIGN KEY REFERENCES tbl_Planet (Planet_ID)
);
INSERT INTO tbl_OreName
	(T1, T2, T3, T4, Planet_ID)
		VALUES
		('Bauxite', 'Natron', 'Garnierite', 'Cryolite', 1),
		('Coal', 'Chrometite', 'Ancanthite', 'Cobaltite',2),
		('Quartz', 'Limestone', 'Petalite', 'Kolbeckite',3),
		('Hematite', 'Malachite', 'Pyrite', 'Gold', 1)
;
SELECT * FROM tbl_OreName;

CREATE TABLE tbl_OreDepth (
	Depth_ID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	T1_Depth INT,
	T2_Depth INT,
	T3_Depth INT,
	T4_Depth INT,
	Ore_ID INT FOREIGN KEY REFERENCES tbl_OreName (ID)
);
INSERT INTO tbl_OreDepth
	(T1_Depth, Ore_ID)
	VALUES
		('300', 1)
;
INSERT INTO tbl_OreDepth
	(T2_Depth, Ore_ID)
	VALUES
		('550', 2)
;
INSERT INTO tbl_OreDepth
	(T3_Depth, Ore_ID)
	VALUES
		('778', 3)
;
INSERT INTO tbl_OreDepth
	(T4_Depth, Ore_ID)
	VALUES
		('1100', 4)
;
SELECT * FROM tbl_OreDepth;
SELECT * FROM tbl_OreName;
SELECT * FROM tbl_Planet;

SELECT tbl_Planet.Planet, tbl_OreName.T1, tbl_OreDepth.T1_Depth FROM tbl_OreName
INNER JOIN tbl_Planet
ON tbl_OreName.Planet_ID = tbl_Planet.Planet_ID
INNER JOIN tbl_OreDepth
ON tbl_OreName.ID = tbl_OreDepth.Ore_ID;