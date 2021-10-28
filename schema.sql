CREATE TABLE animals(
 animals_id int NOT NULL GENERATED ALWAYS AS IDENTITY,
 owners_id int,
 species_id int,
 name VARCHAR(30),
 date_of_birth date NOT NULL,
 escape_attempts integer,
 neutered boolean NOT NULL,
 weight_kg decimal NOT NULL,
 PRIMARY KEY(animals_id),
 FOREIGN KEY(owners_id) REFERENCES owners(owners_id),
 FOREIGN KEY(species_id) REFERENCES species(species_id)
	
);

CREATE TABLE owners(
owners_id int NOT NULL,
name VARCHAR(30),
age integer,
PRIMARY KEY(owners_id)
);

CREATE TABLE species(
species_id int NOT NULL,
name VARCHAR(30),
PRIMARY KEY(species_id)
);