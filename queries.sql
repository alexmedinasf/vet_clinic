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

--What animals belong to Melody Pond? -- 

select a.name as animal_name
from animals a
join owners o on a.owner_id = o.id
where o.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon). --

select a.name as animal_name
from animals a
join species s on a.species_id = s.id
where s.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal. -- 

select a.name as animal_name, o.full_name as owners_name
from owners o
left join animals a on o.id = a.owner_id

-- How many animals are there per species? -- 

select s.name as species_name, count (a.species_id) as animal_count
from animals a
join species s on a.species_id = s.id
group by s.name

-- List all Digimon owned by Jennifer Orwell. -- 

select a.name as animals_name
from animals a
join species s on a.species_id = s.id
join owners o on a.owner_id = o.id
where s.name = 'Digimon' and o.full_name = 'Jennifer Orwell'

-- List all animals owned by Dean Winchester that haven't tried to escape. -- 

select a.name as animals_name
from animals a
join owners o on a.owner_id = o.id
where a.escape_attempts < 1 and o.full_name = 'Dean Winchester'

--Who owns the most animals --
select o.full_name as owners_name, count(a.id) as animal_count
from owners o
left join animals a on o.id = a.owner_id
group by o.id, o.full_name 
order by animal_count desc
limit 1;
