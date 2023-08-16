INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Agumon', '2020-02-03', 0, '1', '10.23');

    INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Gabumon', '2018-11-15', 2, '1', '8');

    INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Pikachu', '2021-01-07', 1, '0', '15.04');

    INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Devimon', '2017-05-12', 5, '1', '11');
    
	INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Charmander', '2020-02-08', '0', '0', '-11');

	INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Plantmon', '2021-11-15', '2', '1', '-5.7');

	INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Squirtle', '1993-04-02', '3', '0', '-12.13');

	INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Angemon', '2005-06-12', '1', '1', '-45');

	INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Boarmon', '2005-06-07', '7', '1', '20.4');

	INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Blossom', '1998-10-13', '3', '1', '17');

	INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Ditto', '2022-05-14', '4', '1', '22');

-- Insert the following data into the owners table: -- 

insert into owners (full_name, age)
values ('Sam Smith', 34),
	   ('Jennifer Orwell', 19),
	   ('Bob', 45),
	   ('Melody Pond', 77),
	   ('Dean Winchester', 14),
	   ('Jodie Whittaker', 38);
	  

-- Insert the following data into the species table -- 

insert into species (name)
values ('Pokemon'),
	  ('Digimon');

-- Modify your inserted animals so it includes the species_id value -- 

update animals
set species_id = (select id from species where name = 'Digimon')
where name like '%mon';

update animals
set species_id = (select id from species where name = 'Pokemon')
where name not like '%mon';

-- Modify your inserted animals to include owner information (owner_id) --

update animals
set owner_id = (select id from owners where full_name = 'Sam Smith')
where name = 'Agumon';

update animals
set owner_id = (select id from owners where full_name = 'Jennifer Orwell')
where name in  ('Gabumon','Pikachu');

update animals
set owner_id = (select id from owners where full_name = 'Bob')
where name in  ('Devimon','Plantmon');

update animals
set owner_id = (select id from owners where full_name = 'Melody Pond')
where name in  ('Charmander','Squirtle', 'Blossom');

update animals
set owner_id = (select id from owners where full_name = 'Dean Winchester')
where name in  ('Angemon','Boarmon');

--
