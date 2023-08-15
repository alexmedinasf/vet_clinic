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

begin;

update animals
set species = 'digimon'
where name like '%mon';

update animals
set species = 'pokemon'
where species is null;

select species from animals;

commit;

select species from animals;

-- deleting animals and rollback

begin;

delete from animals;

select * from animals; 

rollback;

select * from animals;

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
where weight_kg < 0;

commit;

-- How many animals are there? --

select count(id) from animals;

-- How many animals have never tried to escape? --

select count(escape_attempts) from animals
where escape_attempts = '0';

--What is the average weight of animals?

select avg(weight_kg) from animals;

--Who escapes the most, neutered or not neutered animals? --

SELECT neutered, SUM(escape_attempts) AS total_escape_attempts FROM animals
GROUP BY neutered;

--What is the minimum and maximum weight of each type of animal? -- 

select species, min(weight_kg) as min_w, max (weight_kg) as max_w from animals
group by species;

--What is the average number of escape attempts per animal type of those born between 1990 and 2000? --

select species, avg(escape_attempts) as avg_escp from animals
where date_of_birth between '1990-01-01' and '2000-12-31'
group by species;


-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.--

begin;

UPDATE animals
SET species = 'unspecified';

select * from animals;

rollback; 

select * from animals;

-- Create a table named owners --

create table owners (
	id serial primary key,
	full_name varchar(255),
	age integer
);

-- Create a table named species -- 

create table species(
	id serial primary key,
	name varchar(255)
);

--