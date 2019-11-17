CREATE TABLE `car` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BRAND` varchar(45) NOT NULL,
  `MODEL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `driver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DRIVER_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DRIVER_NAME_UNIQUE` (`DRIVER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


CREATE TABLE `car_driver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAR_ID` int(11) NOT NULL,
  `DRIVER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `car_id_car_driver_car_id_idx` (`CAR_ID`),
  KEY `driver_id_car_driver_driver_id_idx` (`DRIVER_ID`),
  CONSTRAINT `car_id_car_driver_car_id` FOREIGN KEY (`CAR_ID`) REFERENCES `car` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `driver_id_car_driver_driver_id` FOREIGN KEY (`DRIVER_ID`) REFERENCES `driver` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


insert into car (brand, model) values ('Toyota', 'Camry');
insert into car (brand, model) values ('Honda', 'Civic');
insert into driver (driver_name) values ('John');
insert into driver (driver_name) values ('Anna');
insert into driver (driver_name) values ('Pavel');

select * from car;
select * from driver;

-- alias
update car as c set c.model = 'Camry' where c.id = 1;

-- clone line 		- ctrl + d
-- execute script	- ctrl + enter

insert into car_driver (car_id, driver_id) values (1, 2);

select * from car_driver;
-- camri	anna
-- camri	john
-- camri	anna


-- car -> car_driver <- driver

select c.MODEL, d.DRIVER_NAME from car c 
inner join car_driver cd on c.ID = cd.CAR_ID
inner join driver d on cd.DRIVER_ID = d.ID;


-- cd.DRIVER_ID = d.ID
-- d.ID = cd.DRIVER_ID 

-- CAR			DRIVER
-- toyota		anna
-- toyota		john
-- honda		
-- 				pavel

-- car_driver without NOT NULL constraint
-- Pavel арендовал машину Honda
-- 		 арендовал машину Honda
-- Pavel арендовал машину 




-- inner join
-- Toyota Pavel
select c.MODEL, d.DRIVER_NAME from car c 
inner join car_driver cd on c.ID = cd.CAR_ID
inner join driver d on cd.DRIVER_ID = d.ID;


-- left join
-- Toyota null
-- Toyota Pavel
select c.MODEL, d.DRIVER_NAME from car c 
left join car_driver cd on c.ID = cd.CAR_ID
left join driver d on cd.DRIVER_ID = d.ID;

-- right join 
-- null Pavel
-- Honda Pavel
select c.MODEL, d.DRIVER_NAME from car c 
right join car_driver cd on c.ID = cd.CAR_ID
right join driver d on cd.DRIVER_ID = d.ID;

-- outer join
-- Honda Pavel
-- null null
-- Honda null
-- null Pavel
select c.MODEL, d.DRIVER_NAME from car c 
left outer join car_driver cd on c.ID = cd.CAR_ID
left outer join driver d on cd.DRIVER_ID = d.ID
union
select c.MODEL, d.DRIVER_NAME from car c 
right outer join car_driver cd on c.ID = cd.CAR_ID
right outer join driver d on cd.DRIVER_ID = d.ID;




