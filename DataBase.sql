create database animalShelterDB;

create table animalShelterDB.Cities(
	cityID int primary key auto_increment not null,
    cityName varchar(20)
);

use animalShelterDB;

create table Shelter(
	shelterID int primary key auto_increment not null,
    shelterName varchar(30),
    rating_0_to_5 int, 
    cityID int,
    foreign key (cityID) references Cities(cityID)
);

create table Animals(
	animalID int primary key auto_increment not null,
	kindOfAnimal varchar(20),
    breed varchar(40),
    registrationDate date,
	cityID int,
    shelterID int,
    foreign key (cityID) references Cities(cityID),
    foreign key (shelterID) references Shelter(shelterID)
);


select shelterName, rating_0_to_5 from animalshelterdb.shelter where rating_0_to_5>=3;
select * from animalshelterdb.animals where shelterID = 2;
select * from animalshelterdb.animals where	breed like '%er';
select * from animalshelterdb.animals where	breed like 'c%';
select kindOfAnimal, breed, registrationDate from animalshelterdb.animals where	registrationDate like '%-07-%';

select kindOfAnimal, breed, registrationDate, cityName from animalshelterdb.animals left join animalshelterdb.cities on  animals.cityID = cities.cityID where registrationDate like '%-07-%';

select * from animalshelterdb.shelter order by rating_0_to_5 desc limit 3;
select count(animalID) as 'number of animals', cityID from animalshelterdb.animals group by cityID;

select count(animalID) from animalshelterdb.animals where shelterID = 2;
select min(registrationDate) from animalshelterdb.animals;
select max(registrationDate) from animalshelterdb.animals;
select avg(rating_0_to_5) as 'average score' from animalshelterdb.shelter;

insert into animalshelterdb.cities (cityID, cityName) values (4,'Dnipro');
delete from animalshelterdb.cities where cityID = 4;
update animalshelterdb.shelter set rating_0_to_5 = 3 where shelterID = 4;
drop table animalshelterdb.cities;
