CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY NOT NULL,
  owner VARCHAR(45) NOT NULL,
  species ENUM('M', 'F') NOT NULL,
  gender VARCHAR(15),
  birth DATE,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(20) NOT NULL,
  eventdate DATE NOT NULL,
  eventtype VARCHAR(15) NOT NULL,
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname),
  PRIMARY KEY (petname, eventdate)
);
