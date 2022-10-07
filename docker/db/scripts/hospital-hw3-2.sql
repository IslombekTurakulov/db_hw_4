CREATE SCHEMA IF NOT EXISTS hospital;

CREATE TABLE hospital.Stations (
  "stat_nr" SERIAL PRIMARY KEY,
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
  "director_birth_date" DATE NOT NULL
);

CREATE TABLE hospital.Rooms (
  "room_nr" SERIAL PRIMARY KEY,
  "stat_nr" integer NOT NULL,
  "#beds" integer NOT NULL
);

CREATE TABLE hospital.StationPersonells (
  "pers_nr" SERIAL PRIMARY KEY,
  "#name" varchar NOT NULL,
  "stat_nr" integer NOT NULL
);

CREATE TABLE hospital.Caregivers (
  "pers_nr" integer PRIMARY KEY,
  "qualification" varchar NOT NULL
);

CREATE TABLE hospital.Doctors (
  "pers_nr" integer PRIMARY KEY,
  "area" varchar NOT NULL,
  "rank" varchar NOT NULL
);

CREATE TABLE hospital.Patients (
  "patient_nr" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "disease" varchar NOT NULL,
  "room_nr" integer NOT NULL,
  "from" timestamp NOT NULL,
  "to" timestamp NOT NULL
);

CREATE TABLE hospital.Treats (
  "pers_nr" integer NOT NULL,
  "patient_nr" integer NOT NULL
);


ALTER TABLE hospital.Rooms  ADD FOREIGN KEY ("stat_nr") REFERENCES hospital.Stations ("stat_nr");

ALTER TABLE hospital.StationPersonells  ADD FOREIGN KEY ("stat_nr") REFERENCES hospital.Stations ("stat_nr");

ALTER TABLE hospital.StationPersonells  ADD FOREIGN KEY ("pers_nr") REFERENCES hospital.Caregivers ("pers_nr");

ALTER TABLE hospital.StationPersonells  ADD FOREIGN KEY ("pers_nr") REFERENCES hospital.Doctors ("pers_nr");

ALTER TABLE hospital.Treats  ADD FOREIGN KEY ("pers_nr") REFERENCES hospital.Doctors ("pers_nr");

ALTER TABLE hospital.Treats  ADD FOREIGN KEY ("patient_nr") REFERENCES hospital.Patients ("patient_nr");

ALTER TABLE hospital.Patients  ADD FOREIGN KEY ("room_nr") REFERENCES hospital.Rooms ("room_nr");
