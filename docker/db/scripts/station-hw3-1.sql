CREATE SCHEMA IF NOT EXISTS station;

CREATE TABLE station.Cities (
    "region"    varchar NOT NULL,
    "city_name" varchar NOT NULL,
    PRIMARY KEY ("region", "city_name")
)

CREATE TABLE station.Stations (
    "name"  TEXT PRIMARY KEY,
    "#tracks"    integer NOT NULL,
    "city_name"   varchar NOT NULL,
    "city_region" varchar NOT NULL,
    FOREIGN KEY ("city_region", "city_name") REFERENCES station.Cities
);


CREATE TABLE station.Trains (
  "trainNR" SERIAL PRIMARY KEY,
  "length" integer NOT NULL,
  "start_station_id" varchar NOT NULL,
  "end_station_id" varchar NOT NULL
);


CREATE TABLE station.Connected (
  "trainNR" integer PRIMARY KEY,
  "from_station_id" varchar NOT NULL,
  "to_station_id" varchar NOT NULL,
  "departure" TIMESTAMP NOT NULL,
  "arrival" TIMESTAMP NOT NULL
);


ALTER TABLE station.Trains ADD CONSTRAINT "Trains_fk0" FOREIGN KEY ("start_station_id") REFERENCES station.Stations("name");

ALTER TABLE station.Trains ADD CONSTRAINT "Trains_fk1"  FOREIGN KEY ("end_station_id") REFERENCES station.Stations("name");

ALTER TABLE station.Connected ADD CONSTRAINT "Connected_fk0"  FOREIGN KEY ("trainNR") REFERENCES station.Trains("trainNR");

ALTER TABLE station.Connected ADD CONSTRAINT "Connected_fk0"  FOREIGN KEY ("from_station_id") REFERENCES station.Stations("name");

ALTER TABLE station.Connected ADD CONSTRAINT "Connected_fk0"  FOREIGN KEY ("to_station_id") REFERENCES station.Stations("name");
