CREATE DATABASE nascar;

use nascar;


CREATE TABLE series (
    seriesID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    seriesName CHAR(25) NOT NULL,
    seriesStartDate DATE NOT NULL,
    CONSTRAINT series_fk_races FOREIGN KEY (racesID)
        REFERENCES races (racesID)
);

CREATE TABLE races (
    racesID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    racesName CHAR(25) NOT NULL,
    racesDate DATE NOT NULL,
    racesStartTime TIME NOT NULL,
    racesEndTime TIME NOT NULL,
    racesLocation CHAR(25) NULL,
    racesLength TIME NULL,
    racesCourse CHAR(25) NULL,
    CONSTRAINT races_fk_tracks FOREIGN KEY (tracksID)
        REFERENCES tracks (tracksID),
    CONSTRAINT races_fk_series FOREIGN KEY (seriesID)
        REFERENCES series (seriesID)
);

CREATE TABLE tracks (
    tracksID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tracksName CHAR(25) NOT NULL,
    tracksLocation CHAR(25) NOT NULL,
    tracksAddress CHAR(25) NULL,
    CONSTRAINT tracks_fk_races FOREIGN KEY (racesID)
        REFERENCES races (racesID)
);

CREATE TABLE winnings (
    winningsID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    winningsAmount DECIMAL(8 , 2 ) NOT NULL,
    CONSTRAINT winnings_fk_tracks FOREIGN KEY (tracksID)
        REFERENCES tracks (tracksID)
);

CREATE TABLE teams (
    teamsID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    teamsName CHAR(25) NOT NULL,
    teamManager CHAR(25) NOT NULL,
    CONSTRAINT teams_fk_drivers FOREIGN KEY (driversID)
        REFERENCES drivers (driversID)
);

CREATE TABLE drivers (
    driversID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    driversFirstName CHAR(25) NOT NULL,
    driversLastName CHAR(25) NOT NULL,
    driversDOB DATE NOT NULL,
    driversAge INT NULL,
    driversNationality CHAR(25) NOT NULL,
    driversNumber INT NOT NULL,
    driversHometown CHAR(25) NULL,
    driversNickname CHAR(25) NULL,
    driversTeam CHAR(25) NULL,
    CONSTRAINT drivers_fk_teams FOREIGN KEY (teamsID)
        REFERENCES teams (teamsID)
);

CREATE TABLE cars (
    carsID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    carsYear INT NOT NULL,
    carsMake CHAR(25) NOT NULL,
    carsModel CHAR(25) NOT NULL,
    carsSubmodel CHAR(25) NULL,
    carsColor CHAR(25) NULL,
    carsEngine CHAR(25) NOT NULL,
    carsBody CHAR(25) NOT NULL,
    carsTransmission CHAR(25) NOT NULL,
    carsTires CHAR(25) NOT NULL,
    CONSTRAINT cars_fk_results FOREIGN KEY (resultsID)
        REFERENCES results (resultsID)
);

CREATE TABLE results (
    resultsID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CONSTRAINT results_fk_drivers FOREIGN KEY (driversID)
        REFERENCES drivers (driversID),
    CONSTRAINT results_fk_winnnings FOREIGN KEY (winningsID)
        REFERENCES winnings (winningsID),
    CONSTRAINT results_fk_cars FOREIGN KEY (carsID)
        REFERENCES cars (carsID)
);

