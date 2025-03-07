/* Oracle DDL Generated by BIM 1.0 */

CREATE TABLE D_COMMUNITY_AREA
(
	ID_COMMUNITY_AREA INTEGER NOT NULL,
	AREA_NAME CHAR(40) NOT NULL
)
;

CREATE UNIQUE INDEX PK_D_COMUNNITYAREA ON D_COMMUNITY_AREA(ID_COMMUNITY_AREA)
;


ALTER TABLE D_COMMUNITY_AREA ADD CONSTRAINT PK_D_COMUNNITYAREA  PRIMARY KEY (ID_COMMUNITY_AREA)
USING INDEX
;

CREATE TABLE D_END_POINT
(
	ID_DROPOFF_POINT INTEGER NOT NULL,
	LATITUDE_END NUMERIC(14,11),
	LONGITUDE_END NUMERIC(14,11)
)
;

CREATE UNIQUE INDEX PK_D_END_POINT ON D_END_POINT(ID_DROPOFF_POINT)
;


ALTER TABLE D_END_POINT ADD CONSTRAINT PK_D_END_POINT  PRIMARY KEY (ID_DROPOFF_POINT)
USING INDEX
;

CREATE TABLE D_END_TIMESTAMP
(
	ID_END_TIMESTAMP INTEGER NOT NULL,
	END_TIMESTAMP TIMESTAMP NOT NULL
)
;

CREATE UNIQUE INDEX PK_D_END_TIMESTAMP ON D_END_TIMESTAMP(ID_END_TIMESTAMP)
;


ALTER TABLE D_END_TIMESTAMP ADD CONSTRAINT PK_D_END_TIMESTAMP  PRIMARY KEY (ID_END_TIMESTAMP)
USING INDEX
;

CREATE TABLE D_START_POINT
(
	LATITUDE_START NUMERIC(14,11),
	LONGITUDE_START NUMERIC(14,11),
	ID_PICKUP_POINT INTEGER NOT NULL
)
;

CREATE UNIQUE INDEX PK_D_START_POINT ON D_START_POINT(ID_PICKUP_POINT)
;


ALTER TABLE D_START_POINT ADD CONSTRAINT PK_D_START_POINT  PRIMARY KEY (ID_PICKUP_POINT)
USING INDEX
;

CREATE TABLE D_START_TIMESTAMP
(
	START_TIMESTAMP TIMESTAMP NOT NULL,
	ID_START_TIMESTAMP INTEGER NOT NULL
)
;

CREATE UNIQUE INDEX PK_D_START_TIMESTAMP ON D_START_TIMESTAMP(ID_START_TIMESTAMP)
;


ALTER TABLE D_START_TIMESTAMP ADD CONSTRAINT PK_D_START_TIMESTAMP  PRIMARY KEY (ID_START_TIMESTAMP)
USING INDEX
;

CREATE TABLE D_TAXI
(
	ID_TAXI INTEGER NOT NULL,
	COMPANY INTEGER
)
;

CREATE UNIQUE INDEX PK_D_TAXI ON D_TAXI(ID_TAXI)
;


ALTER TABLE D_TAXI ADD CONSTRAINT PK_D_TAXI  PRIMARY KEY (ID_TAXI)
USING INDEX
;

CREATE TABLE F_TRIP
(
	ID_TAXI INTEGER,
	ID_END_TIMESTAMP INTEGER,
	TRIP_DURATION INTEGER,
	TRIP_DISTANCE INTEGER,
	DROPOFF_AREA INTEGER,
	PICKUP_AREA INTEGER,
	ID_START_POINT INTEGER ,
	ID_END_POINT INTEGER ,
	ID_START_TIMESTAMP INTEGER 
)
;

/*CREATE UNIQUE INDEX PK_F_TRIP ON F_TRIP(ID_TAXI, ID_END_TIMESTAMP, ID_START_TIMESTAMP)
;*/


/*ALTER TABLE F_TRIP ADD CONSTRAINT PK_F_TRIP  PRIMARY KEY (ID_TAXI, ID_END_TIMESTAMP, ID_START_TIMESTAMP)
USING INDEX
;*/

ALTER TABLE F_TRIP ADD CONSTRAINT FK_TRIP_TAXI FOREIGN KEY (ID_TAXI)
REFERENCES D_TAXI (ID_TAXI)
;

ALTER TABLE F_TRIP ADD CONSTRAINT FK_TRIP_END_TIMESTAMP FOREIGN KEY (ID_END_TIMESTAMP)
REFERENCES D_END_TIMESTAMP (ID_END_TIMESTAMP)
;

ALTER TABLE F_TRIP ADD CONSTRAINT FK_TRIP_DROPOFFAREA FOREIGN KEY (DROPOFF_AREA)
REFERENCES D_COMMUNITY_AREA (ID_COMMUNITY_AREA)
;

ALTER TABLE F_TRIP ADD CONSTRAINT FK_TRIP_PICKUPFFAREA FOREIGN KEY (PICKUP_AREA)
REFERENCES D_COMMUNITY_AREA (ID_COMMUNITY_AREA)
;

ALTER TABLE F_TRIP ADD CONSTRAINT FK_TRIP_START_POINT FOREIGN KEY (ID_START_POINT)
REFERENCES D_START_POINT (ID_PICKUP_POINT)
;

ALTER TABLE F_TRIP ADD CONSTRAINT FK_TRIP_END_POINT FOREIGN KEY (ID_END_POINT)
REFERENCES D_END_POINT (ID_DROPOFF_POINT)
;

ALTER TABLE F_TRIP ADD CONSTRAINT FK_TRIP_START_TIMESTAMP FOREIGN KEY (ID_START_TIMESTAMP)
REFERENCES D_START_TIMESTAMP (ID_START_TIMESTAMP)
;

