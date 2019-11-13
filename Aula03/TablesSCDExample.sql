CREATE TABLE  SUPPLIER_NEW (
     id_supplier  INTEGER,
     technical_key SERIAL PRIMARY KEY,
	 companyName  VARCHAR(40),
	 contactName  VARCHAR(30),
	 contactTitle  VARCHAR(30),
     supplierAddress VARCHAR(60),
     cityName VARCHAR(15),
     regionName VARCHAR(30),
     postalCode VARCHAR(30),
     countryName VARCHAR(30),
     phone VARCHAR(60),
     fax VARCHAR(30),
     homePage VARCHAR(100),
     version INTEGER,
     date_from DATE,
     date_to DATE
);

