create database aula17;
create table category(
	category_id serial,
	nome varchar(50),
	last_update timestamp
);

create table film_category(
	film_id int,
	category_id int,
	last_update timestamp
);

create table filme(
	film_id serial,
	title varchar(20),
	description varchar(30),
	release_year date,
	language_id int,
	rental_duration timestamp,
	rental_rate numeric(5, 2),
	"length" time,
	replacemenet_cost float,
	rating numeric(2, 1),
	last_update timestamp,
	special_features varchar(250),
	fulltext varchar(100)
);

CREATE TABLE film(
	LANGUAGE_id serial,
	name varchar(50),
	last_update timestamp
);

CREATE TABLE film_actor(
	actor_id int,
	film_id int,
	last_update timestamp
);

CREATE TABLE inventory(
	inventory_id serial,
	film_id int,
	store_id int,
	last_update timestamp
);

CREATE TABLE rental(
	rental_id serial,
	rental_date timestamp,
	inventory_id int,
	customer_id int,
	return_date timestamp,
	staff_id int,
	last_update timestamp
);

CREATE TABLE payment(
	payment_id serial,
	customer_id int,
	staff_id int,
	rental_id int,
	amount numeric(4, 2),
	payment_date date
);

CREATE TABLE staff(
	staff_id serial,
	first_name varchar(50),
	last_name varchar(50),
	address_id int,
	email varchar(50),
	story_id int,
	active boolean,
	username varchar(50),
	password char(7),
	last_update timestamp
	picture bytea
0;

CREATE TABLE actor(
	actor_id serial,
	first_name varchar(50),
	last_name varchar(50),
	last_update timestamp
);

CREATE TABLE customer(
	customer_id serial,
	store_id int,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100),
	address_id int,
	create_date date,
	last_update timestamp,
	active boolean
);

CREATE TABLE address(
	address_id serial,
	address varchar(40),
	address2 varchar(40),
	district varchar(40),
	city_id int,
	postal_code char(8),
	phone char(14),
	last_update timestamp
);

CREATE TABLE city(
	city_id serial,
	city varchar(50),
	country_id int, 
	last_update timestamp
);

CREATE TABLE country(
	country_id serial,
	country varchar(100),
	last_update timestamp
);

CREATE TABLE store(
	store_id serial,
	manager_staff_id int,
	address_id int,
	last_update timestamp
); 

-- remover coluna
ALTER TABLE store DROP COLUMN last_update;

--adicionar coluna
ALTER TABLE store RENAME COLUMN last_update timestamp;

--ronomear coluna
ALTER TABLE store RENAME COLUMN last_update
	TO last_update;

--alterar o tipo de dado da coluna
ALTER TABLE store ALTER COLUMN last_update
	SET date TYPE timestamp;
	
--criação de chaves primárias 
ALTER TABLE category ADD PRIMARY KEY (categoria_id);
ALTER TABLE film ADD PRIMARY KEY (film_id);
ALTER TABLE language ADD PRIMARY KEY (language_id);
ALTER TABLE inventory ADD PRIMARY KEY (inventory_id);
ALTER TABLE country ADD PRIMARY KEY (country_id);
ALTER TABLE actor ADD PRIMARY KEY (actor_id);
ALTER TABLE city ADD PRIMARY KEY (city_id);
ALTER TABLE store ADD PRIMARY KEY (store_id);
ALTER TABLE payment ADD PRIMARY KEY (payment_id);
ALTER TABLE address ADD PRIMARY KEY (address_id);
ALTER TABLE customer ADD PRIMARY KEY (customer_id);
ALTER TABLE staff ADD PRIMARY KEY (staff_id);
ALTER TABLE rental ADD PRIMARY KEY (rentalr_id);

--criação de chaves estrangeiras
alter table filme_categoria
add constraint fk_categoria
foreign key (categoria_id)
references categoria (categoria_id);

alter table filme_categoria
add constraint fk_filme
foreign key (filme_id)
references filme (filme_id);

ALTER TABLE film
ADD CONSTRAINT fk_language
FOREIGN KEY (language_id)
REFERENCES language(language_id);

ALTER TABLE actor_film
ADD CONSTRAINT fk_actor
FOREIGN KEY (actor_id)
REFERENCES actor(actor_id);

ALTER TABLE actor_film
ADD CONSTRAINT fk_film
FOREIGN KEY (film_id)
REFERENCES film(film_id);

ALTER TABLE inventory --tabela q possui
ADD CONSTRAINT fk_film
FOREIGN KEY (film_id)
REFERENCES film(film_id);

ALTER TABLE rental
ADD CONSTRAINT fk_inventory
FOREIGN KEY (inventory_id)
REFERENCES inventory(inventory_id);

ALTER TABLE rental
ADD CONSTRAINT fk_staff
FOREIGN KEY (staff_id)
REFERENCES staff(staff_id);

ALTER TABLE payment
ADD CONSTRAINT fk_rental
FOREIGN KEY (rental_id)
REFERENCES rental(rental_id);

ALTER TABLE payment
ADD CONSTRAINT fk_staff
FOREIGN KEY (staff_id)
REFERENCES staff(staff_id);

ALTER TABLE staff
ADD CONSTRAINT fk_staff
FOREIGN KEY (staff_id)
REFERENCES staff(staff_id);