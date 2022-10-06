CREATE SCHEMA IF NOT EXISTS station;


CREATE TABLE station.Cities (
    "region"    varchar NOT NULL,
    "city_name" varchar NOT NULL,
    PRIMARY KEY ("region", "city_name")
) WITH (
  OIDS=FALSE
);


CREATE TABLE station.Stations (
    "name"  TEXT NOT NULL,
    "#tracks"    integer NOT NULL,
    "city_name"   varchar NOT NULL,
    "city_region" varchar NOT NULL,
    CONSTRAINT "Station_pk" PRIMARY KEY ("name"),
    FOREIGN KEY ("city_region", "city_name") REFERENCES station.Cities
);


CREATE TABLE station.Trains (
  "trainNR" SERIAL NOT NULL,
  "length" integer NOT NULL,
  "start_station_id" varchar NOT NULL,
  "end_station_id" varchar NOT NULL,
  CONSTRAINT "Trains_pk" PRIMARY KEY ("trainNR")
);


CREATE TABLE station.Connected (
  "trainNR" integer NOT NULL,
  "from_station_id" varchar NOT NULL,
  "to_station_id" varchar NOT NULL,
  "departure" timestamp NOT NULL,
  "arrival" timestamp NOT NULL
);


ALTER TABLE station.Trains ADD CONSTRAINT "Trains_fk0" FOREIGN KEY ("start_station_id") REFERENCES station.Stations("name");

ALTER TABLE station.Trains ADD CONSTRAINT "Trains_fk1"  FOREIGN KEY ("end_station_id") REFERENCES station.Stations("name");

ALTER TABLE station.Connected ADD CONSTRAINT "Connected_fk0"  FOREIGN KEY ("trainNR") REFERENCES station.Trains("trainNR");

ALTER TABLE station.Connected ADD CONSTRAINT "Connected_fk0"  FOREIGN KEY ("from_station_id") REFERENCES station.Stations("name");

ALTER TABLE station.Connected ADD CONSTRAINT "Connected_fk0"  FOREIGN KEY ("to_station_id") REFERENCES transport.Stations("name");
