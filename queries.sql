SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT * FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';

SELECT * FROM animals
WHERE neutered = true and escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name in ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals
WHERE weight_kg > '10.5';

SELECT * FROM animals
WHERE neutered = true;

SELECT * FROM animals
WHERE name != 'Gabumon';

SELECT * FROM animals
WHERE weight_kg between 10.4 and 17.3;

-- changing the species 

update animals
set species = 'digimon'
where name like '%mon';

update animals
set species = 'pokemon'
where species is null;

-- deleting animals and rollback

begin;

delete from animals;

rollback;

-- deleting animals with a specific date of birth + using savepoints-- 

begin;

delete from animals
where date_of_birth > '2022-01-01';

savepoint savepoins_1;

update animals
set weight_kg = weight_kg * -1;

rollback to savepoins_1;

-- updating animals weight -- 

update animals
set weight_kg = weight_kg * -1
where weight_kg < 1;

commit;

--
