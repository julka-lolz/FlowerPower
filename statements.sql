DROP DATABASE if exists FlowerPower;

CREATE DATABASE FlowerPower;

USE FlowerPower;

CREATE TABLE Klant(
	Klantcode int not null auto_increment,
	Voorletters varchar(255) not null,
	Tussenvoegsel varchar(255) not null,
	Achternaam varchar(255) not null,
	Adres varchar(255) not null,
	Postcode varchar(255) not null,
	Woonplaats varchar(255) not null,
	Geboortedatum date not null,
	Gebruikersnaam varchar(255) not null,
	Wachtwoord varchar(255) not null,
	PRIMARY KEY(Klantcode)
);

CREATE TABLE Medewerker(
	Medewerkerscode int not null auto_increment,
	Voorletters varchar(255) not null,
	Voorvoegsels varchar(255) not null,
	Achternaam varchar(255) not null,	
	Gebruikersnaam varchar(255) not null,
	Wachtwoord varchar(255) not null,
	PRIMARY KEY(Medewerkerscode)
);

CREATE TABLE Winkel(
	Winkelcode int not null auto_increment,
	Winkelnaam varchar(255) not null,
	Winkeladres varchar(255) not null,
	Winkelpostcode varchar(255) not null,	
	Vestigingsplaats varchar(255) not null,
	Telefoonnummer int not null,
	PRIMARY KEY(Winkelcode)
);

CREATE TABLE Artikel(
	Artikelcode int not null auto_increment,
	Artikel varchar(255) not null,
	Prijs decimal(10,2) not null,
	PRIMARY KEY(Artikelcode)
);

CREATE TABLE Bestelling(
	Artikelcode int not null,
	Winkelcode int not null,
	Aantal int not null,
	Klantcode int not null,
	Medewerkerscode int not null,
	Afgehaald varchar(255) not null,
	FOREIGN KEY(Artikelcode) REFERENCES	Artikel(Artikelcode),
	FOREIGN KEY(Winkelcode) REFERENCES Winkel(Winkelcode),
	FOREIGN KEY(Klantcode) REFERENCES Klant(Klantcode),
	FOREIGN KEY(Medewerkerscode) REFERENCES	Medewerker(Medewerkerscode)
);

CREATE TABLE Factuur(
	Factuurnummer int not null auto_increment,
	Factuurdatum date not null,
	Klantcode int not null,
	PRIMARY KEY(Factuurnummer),
	FOREIGN KEY(Klantcode) REFERENCES Klant(Klantcode)
);

CREATE TABLE Factuurregel(
	Factuurnummer int not null,
	Artikelcode int not null,
	Aantal int not null,
	Prijs decimal(10,2) not null,	
	FOREIGN KEY(Factuurnummer) REFERENCES Factuur(Factuurnummer),
	FOREIGN KEY(Artikelcode) REFERENCES Artikel(Artikelcode)
);