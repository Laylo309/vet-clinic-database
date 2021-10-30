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
 WHERE name = 'Gabumon' OR name= ' Pikachu';

 UPDATE animals
 SET owners_id = (SELECT owners_id WHERE name= 'Bob')
 WHERE name = 'Devimon' OR name = 'Plantmon';

 UPDATE animals
 SET owners_id = (SELECT owners_id WHERE name= 'Melody Pond')
 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

 UPDATE animals
 SET owners_id = (SELECT owners_id WHERE name= 'Dean Winchester')
 WHERE name = 'Angemon' OR name = 'Boarmon';
 
INSERT INTO vets(name, age, date_of_graduation) 
VALUES('William Tatcher', 45, '2020-04-23');

INSERT INTO vets(name, age, date_of_graduation) 
VALUES('Maisy Smith', 26, '2019-01-14');

INSERT INTO vets(name, age, date_of_graduation) 
VALUES('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets(name, age, date_of_graduation) 
VALUES('Jack Harkness', 38, '2008-06-08');
	   
INSERT INTO specializations(species_id, vets_id)
VALUES((SELECT vets_id FROM vets WHERE name ='William Tatcher'),
	   (SELECT species_id FROM species WHERE name = 'Pokemon'));

INSERT INTO specializations(species_id, vets_id)
VALUES((SELECT vets_id FROM vets WHERE name ='Stephanie Mendez'),
	   (SELECT species_id FROM species WHERE name = 'Pokemon' OR name = 'Digimon'));
	   
INSERT INTO specializations(species_id, vets_id)
VALUES((SELECT vets_id FROM vets WHERE name ='Jack Harkness'),
	   (SELECT species_id FROM species WHERE name = 'Digimon'));

-- DATA FOR VISITS

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Agumon'),
	  (SELECT vets_id FROM vets WHERE name = 'William Tatcher'),
	  '2020-05-24'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name ='Agumon'),
	  (SELECT vets_id FROM vets WHERE name = 'Stephanie Mendez'),
	  '2020-06-22'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Gabumon'),
	  (SELECT vets_id FROM vets WHERE name = 'Jack Harkness'),
	  '2021-02-02'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Pikachu'),
	  (SELECT vets_id FROM vets WHERE name = 'Maisy Smith'),
	  '2020-01-05'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Pikachu'),
	  (SELECT vets_id FROM vets WHERE name = 'Maisy Smith'),
	  '2020-03-08'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Pikachu'),
	  (SELECT vets_id FROM vets WHERE name = 'Maisy Smith'),
	  '2020-05-14'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Devimon'),
	  (SELECT vets_id FROM vets WHERE name = 'Stephanie Mendez'),
	  '2021-05-04'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Charmander'),
	  (SELECT vets_id FROM vets WHERE name = 'Jack Harkness'),
	  '2021-02-24'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Plantmon'),
	  (SELECT vets_id FROM vets WHERE name = 'Maisy Smith'),
	  '2019-12-21'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Plantmon'),
	  (SELECT vets_id FROM vets WHERE name = 'William Tatcher'),
	  '2020-08-10'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Plantmon'),
	  (SELECT vets_id FROM vets WHERE name = 'Maisy Smith'),
	  '2021-04-07'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Squirtle'),
	  (SELECT vets_id FROM vets WHERE name = 'Stephanie Mendez'),
	  '2019-09-29'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Angemon'),
	  (SELECT vets_id FROM vets WHERE name = 'Jack Harkness'),
	  '2020-10-03'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Angemon'),
	  (SELECT vets_id FROM vets WHERE name = 'Jack Harkness'),
	  '2020-11-04'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Boarmon'),
	  (SELECT vets_id FROM vets WHERE name = 'Maisy Smith'),
	  '2019-01-24'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Boarmon'),
	  (SELECT vets_id FROM vets WHERE name = 'Maisy Smith'),
	  '2019-05-15'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Boarmon'),
	  (SELECT vets_id FROM vets WHERE name = 'Maisy Smith'),
	  '2020-02-27'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Boarmon'),
	  (SELECT vets_id FROM vets WHERE name = 'Maisy Smith'),
	  '2020-08-03'
);

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Blossom'),
	  (SELECT vets_id FROM vets WHERE name = 'Stephanie Mendez'),
	  '2020-05-24'
);


INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES((SELECT animals_id FROM animals WHERE name = 'Blossom'),
	  (SELECT vets_id FROM vets WHERE name = 'William Tatcher'),
	  '2021-01-11'
);
