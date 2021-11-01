SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name
FROM animals
WHERE neutered= true AND escape_attempts > 3;

SELECT date_of_birth
FROM animals
WHERE name = 'Agumon' OR   name = 'Pikachu';

SELECT name, escape_attempts
FROM animals
WHERE weight_kg> 10.5;

SELECT *
FROM animals
WHERE neutered=true;

SELECT *
FROM animals
WHERE name <> 'Gabumon';

SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4  AND 17.3;


BEGIN;
UPDATE animals
SET species='unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species from animals; 

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species from animals;
COMMIT;
SELECT species from animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_animal;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_animal;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg > 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


-- Write queries (using JOIN) 

SELECT * FROM animals
LEFT JOIN owners
ON animals.owners_id = owners.owners_id
WHERE owners.name = 'Melody Pond';

SELECT * FROM animals
LEFT JOIN species
ON animals.species_id = species.species_id
WHERE species.name = 'Pokemon';

SELECT 
owners.name AS owners_name,
animals.name AS animals_name
FROM owners
LEFT JOIN animals
ON owners.owners_id = animals.owners_id;

SELECT species.name, COUNT(*)
FROM animals
LEFT JOIN  species
ON animals.species_id = species.species_id
GROUP BY species.name;

SELECT * FROM animals
LEFT JOIN owners
ON animals.owners_id = owners.owners_id
LEFT JOIN species
ON animals.species_id = species.species_id
WHERE owners.name = 'Jennifer Orwell'
AND species.name = 'Digimon';

SELECT animals.* FROM animals
LEFT JOIN  owners
ON animals.owners_id = owners.owners_id
WHERE owners.name = 'Dean Winchester'
AND escape_attempts = 0;

SELECT owners.name, COUNT(owners.name)
FROM animals
JOIN owners
ON animals.species_id = owners.owners_id
GROUP BY owners.name;


SELECT animals.name, visits.visit_date
FROM visits
LEFT JOIN animals ON animals.animals_id = visits.animal_id
LEFT JOIN vets ON vets.vets_id = visits.vets_id
WHERE vets.name = 'William Tatcher';

SELECT animals.name
FROM visits
JOIN animals ON animals.animals_id = visits.animal_id
LEFT JOIN vets ON vets.vets_id = visits.vets_id
WHERE vets.name = 'SStephanie Mendez';

SELECT vets.*,species.name
FROM vets
JOIN specializations ON vets.vets_id = specializations.vets_id
JOIN species ON specializations.species_id = species.species_id;

SELECT visits.visit_date
FROM visits
JOIN animals ON animals.animals_id = visits.animal_id
JOIN vets ON vets.vets_id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez'
AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(animals.name)
FROM visits
LEFT JOIN animals ON animals.animals_id = visits.animal_id
GROUP BY animals.name;

SELECT animals.name, visits.visit_date
FROM visits
LEFT JOIN animals ON animals.animals_id = visits.animal_id
LEFT JOIN vets ON vets.vets_id = visits.vets_id
WHERE vets.name = 'Maisy Smith';

SELECT animals.*, vets.*, visits.visit_date
FROM visits
LEFT JOIN animals ON animals.animals_id = visits.animal_id
LEFT JOIN vets ON vets.vets_id = visits.vets_id;


SELECT count(*)
FROM visits
LEFT JOIN animals ON animals.animals_id = visits.animal_id
LEFT JOIN vets ON vets.vets_id = visits.vets_id
WHERE animals.species_id NOT IN (SELECT species_id FROM specializations WHERE vets_id = vets.vets_id);


SELECT species.name, count(*)
FROM visits
LEFT JOIN animals ON animals.animals_id = visits.animal_id
LEFT JOIN species ON animals.species_id = species.species_id
LEFT JOIN vets ON vets.vets_id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
