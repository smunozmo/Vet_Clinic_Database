/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name FROM animals WHERE neutered=TRUE and escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg> 10.5;
SELECT * FROM animals WHERE neutered=TRUE;
SELECT * FROM animals WHERE name!='Gabumon';
SELECT * FROM animals WHERE weight_kg between 10.4 and 17.3;

/*Transaction unspecified species*/
BEGIN;
UPDATE animals SET species= 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/*Transaction update species to digimon and pokemon*/
BEGIN;
UPDATE animals SET species= 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species= 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

/*Transaction delete all records*/
BEGIN;
DELETE FROM animals;	
ROLLBACK;
SELECT * FROM animals;

/*Transaction delete, savepoint,update, and commit*/
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg= weight_kg*-1; 
ROLLBACK TO SP1;
UPDATE animals SET weight_kg= weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

/*Queries*/
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' and '2000-12-31' GROUP BY species;
