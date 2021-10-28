CREATE TABLE animals(
 id int PRIMARY KEY NOT NULL,
 name VARCHAR(30),
 date_of_birth date NOT NULL,
 escape_attempts integer,
 neutered boolean NOT NULL,
 weight_kg decimal NOT NULL,
 species VARCHAR(50)
);
