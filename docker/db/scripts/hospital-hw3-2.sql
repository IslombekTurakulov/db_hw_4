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