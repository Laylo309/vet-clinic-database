CREATE TABLE animals(
 animals_id int NOT NULL GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(30),
 date_of_birth date NOT NULL,
 escape_attempts integer,
 neutered boolean NOT NULL,
 weight_kg decimal NOT NULL,
 species VARCHAR(50),
 PRIMARY KEY(animals_id)
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

ALTER TABLE animals ADD owners_id int REFERENCES owners(owners_id);
ALTER TABLE animals ADD species_id int REFERENCES species(species_id);