CREATE SCHEMA IF NOT EXISTS hospital;


CREATE TABLE hospital.Stations (
  "stat_nr" SERIAL NOT NULL,
  "name" varchar NOT NULL,
  "address" varchar NOT NULL,
  "city" varchar NOT NULL,
  "phone_nr" varchar NOT NULL,
  "email" varchar NOT NULL,
  "director" varchar NOT NULL,
  "director_phone_nr" varchar NOT NULL,
  "director_email" varchar NOT NULL,
  "director_address" varchar NOT NULL,
  "director_city" varchar NOT NULL,
  "director_postal_code" varchar NOT NULL,
  "director_country" varchar NOT NULL,
  "director_birth_date" DATE NOT NULL,
  CONSTRAINT "Stations_pk" PRIMARY KEY ("stat_nr")
)  WITH (
  OIDS=FALSE
);

CREATE TABLE hospital.Rooms (
  "room_nr" SERIAL NOT NULL,
  "stat_nr" integer NOT NULL,
  "#beds" integer NOT NULL,
  CONSTRAINT "Rooms_pk" PRIMARY KEY ("stat_nr")
)  WITH (
  OIDS=FALSE
);

CREATE TABLE hospital.StationPersonells (
  "pers_nr" SERIAL NOT NULL,
  "#name" varchar NOT NULL,
  "stat_nr" integer NOT NULL,
   CONSTRAINT "StationPersonells_pk" PRIMARY KEY ("stat_nr")
) WITH (
  OIDS=FALSE
);

CREATE TABLE hospital.Caregivers (
  "pers_nr" integer NOT NULL,
  "qualification" varchar NOT NULL,
  CONSTRAINT "Caregivers_pk" PRIMARY KEY ("pers_nr")
) WITH (
  OIDS=FALSE
);

CREATE TABLE hospital.Doctors (
  "pers_nr" integer NOT NULL,
  "area" varchar NOT NULL,
  "rank" varchar NOT NULL,
   CONSTRAINT "Doctors_pk" PRIMARY KEY ("pers_nr")
) WITH (
  OIDS=FALSE
);

CREATE TABLE hospital.Patients (
  "patient_nr" SERIAL NOT NULL,
  "name" varchar NOT NULL,
  "disease" varchar NOT NULL,
  "room_nr" integer NOT NULL,
  "from" timestamp NOT NULL,
  "to" timestamp NOT NULL,
   CONSTRAINT "Patients_pk" PRIMARY KEY ("patient_nr")
) WITH (
  OIDS=FALSE
);

CREATE TABLE hospital.Treats (
  "pers_nr" integer NOT NULL,
  "patient_nr" integer NOT NULL
) WITH (
  OIDS=FALSE
);

ALTER TABLE hospital.Rooms  ADD CONSTRAINT "Rooms_fk0" FOREIGN KEY ("stat_nr") REFERENCES hospital.Stations ("stat_nr");

ALTER TABLE hospital.StationPersonells  ADD CONSTRAINT "StationPersonells_fk1" FOREIGN KEY ("stat_nr") REFERENCES hospital.Stations ("stat_nr");

ALTER TABLE hospital.StationPersonells  ADD CONSTRAINT "StationPersonells_fk2" FOREIGN KEY ("pers_nr") REFERENCES hospital.Caregivers ("pers_nr");

ALTER TABLE hospital.StationPersonells  ADD CONSTRAINT "StationPersonells_fk3" FOREIGN KEY ("pers_nr") REFERENCES hospital.Doctors ("pers_nr");

ALTER TABLE hospital.Treats  ADD CONSTRAINT "Treats_fk1" FOREIGN KEY ("pers_nr") REFERENCES hospital.Doctors ("pers_nr");

ALTER TABLE hospital.Treats  ADD CONSTRAINT "Treats_fk2" FOREIGN KEY ("patient_nr") REFERENCES hospital.Patients ("patient_nr");

ALTER TABLE hospital.Patients  ADD CONSTRAINT "Treats_fk3" FOREIGN KEY ("room_nr") REFERENCES hospital.Rooms ("room_nr");

-- Language: sql
-- Path: docker/db/scripts/hospital-hw3-3.sql
INSERT INTO hospital.Stations (name, address, city, phone_nr, email, director, director_phone_nr, director_email, director_address, director_city, director_postal_code, director_country, director_birth_date) VALUES ('Station 1', 'Address 1', 'City 1', 'Phone 1', 'Email 1', 'Director 1', 'Director Phone 1', 'Director Email 1', 'Director Address 1', 'Director City 1', 'Director Postal Code 1', 'Director Country 1', 'Director Birth Date 1');

INSERT INTO hospital.Stations (name, address, city, phone_nr, email, director, director_phone_nr, director_email, director_address, director_city, director_postal_code, director_country, director_birth_date) VALUES ('Station 2', 'Address 2', 'City 2', 'Phone 2', 'Email 2', 'Director 2', 'Director Phone 2', 'Director Email 2', 'Director Address 2', 'Director City 2', 'Director Postal Code 2', 'Director Country 2', 'Director Birth Date 2');

INSERT INTO hospital.Stations (name, address, city, phone_nr, email, director, director_phone_nr, director_email, director_address, director_city, director_postal_code, director_country, director_birth_date) VALUES ('Station 3', 'Address 3', 'City 3', 'Phone 3', 'Email 3', 'Director 3', 'Director Phone 3', 'Director Email 3', 'Director Address 3', 'Director City 3', 'Director Postal Code 3', 'Director Country 3', 'Director Birth Date 3');

INSERT INTO hospital.Rooms (stat_nr, #beds) VALUES (1, 10);

INSERT INTO hospital.Rooms (stat_nr, #beds) VALUES (2, 10);

INSERT INTO hospital.Rooms (stat_nr, #beds) VALUES (3, 10);

INSERT INTO hospital.Caregivers (pers_nr, qualification) VALUES (1, 'Qualification 1');

INSERT INTO hospital.Caregivers (pers_nr, qualification) VALUES (2, 'Qualification 2');

INSERT INTO hospital.Caregivers (pers_nr, qualification) VALUES (3