

CREATE DATABASE CSI2132PJ;

CREATE SCHEMA MOVEDB;

CREATE TABLE USERS(
  UserID SERIAL PRIMARY KEY,
  password CHAR(20) NOT NULL,
  Last_Name CHAR(20) NOT NULL,
  First_Name CHAR(20) NOT NULL,
  Email CHAR(40) NOT NULL UNIQUE,
  City CHAR(40),
  Province CHAR(40),
  Country CHAR(40),


);

CREATE FUNCTION  check_password()
  RETURNS trigger AS
  $BODY$
  BEGIN
  IF
  NEW.password LIKE '%123%' THEN
     RAISE EXCEPTION 'Sorry the password you entered is too simple.';
  END IF;
  RETURN NEW;
  END
  $BODY$ LANGUAGE plpgsql;


  CREATE TRIGER check_password
  BEFORE INSERT OR UPDATE
  ON USER
  EXECUTE PROCEDURE check_password();
