-- Table: public.animals

-- DROP TABLE IF EXISTS public.animals;

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg real,
    species text COLLATE pg_catalog."default",
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;

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

--Modify animals table--

alter table animals
drop column species;

alter table animals
add column species_id int references species(id);

select * from animals;

alter table animals
add column owner_id int references owners(id);