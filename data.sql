INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Agumon',
	'2020-02-03',
	0,
	true,
	10.23
	
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Gabumon',
	'2018-11-15',
	2,
	true,
	8
	
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Pikachu',
	'2021-01-07',
	1,
	false,
	15.04
	
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Devimon',
	'2017-05-12',
	5,
	true,
	11
	
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Charmander',
	'2020-02-08',
	0,
	false,
	-11
	
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Plantmon',
	'2022-11-15',
	3,
	true,
	-5.7
	
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Squirtle',
	'1993-04-02',
	1,
	false,
	-12.13
	
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Angemon',
	'2005-06-12',
	1,
	true,
	-45
	
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Boarmon',
	'2005-06-07',
	7,
	true,
	20.4
	
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(
	'Blossom',
	'1998-10-13',
	3,
	true,
	17
	
);

-- OWNERS INFORMATION

INSERT INTO owners(owners_id, name, age) VALUES(
	1, 
	'Sam Smith', 
	34
);

INSERT INTO owners(owners_id, name, age) VALUES(
	2, 
	'Jennifer Orwell', 
	19
);

INSERT INTO owners(owners_id, name, age) VALUES(
	3, 
	'Bob', 
	45
);

INSERT INTO owners(owners_id, name, age) VALUES(
	4, 
	'Melody Pond', 
	77
);

INSERT INTO owners(owners_id, name, age) VALUES(
	5, 
	'Dean Winchester', 
	14
);

INSERT INTO owners(owners_id, name, age) VALUES(
	6, 
	'Jodie Whittaker', 
	38
);

-- SPECIES INFORMATION

INSERT INTO species(species_id, name) VALUES(
	1,
	'Pokemon'
);

INSERT INTO species(species_id, name) VALUES(
	2,
	'Digimon'
);

-- Modifying  inserted animals

UPDATE animals
SET species_id = (SELECT species_id WHERE name='Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT species_id WHERE name='Pokemon')
WHERE species_id IS NULL;

UPDATE animals
SET owners_id = (SELECT owners_id WHERE name= 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owners_id = (SELECT owners_id WHERE name= 'Jennifer Orwell')
WHERE name = 'Gabumon' AND name= ' Pikachu';

UPDATE animals
SET owners_id = (SELECT owners_id WHERE name= 'Bob')
WHERE name = 'Devimon' AND name = 'Plantmon';

UPDATE animals
SET owners_id = (SELECT owners_id WHERE name= 'Melody Pond')
WHERE name = 'Charmander' AND name = 'Squirtle' AND name = 'Blossom';

UPDATE animals
SET owners_id = (SELECT owners_id WHERE name= 'Dean Winchester')
WHERE name = 'Angemon' AND name = 'Boarmon';

