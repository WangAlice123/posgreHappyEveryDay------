

CREATE DATABASE CSI2132PJ;

CREATE SCHEMA MOVEDB;
SET SEARCH_PATH='movedb';

DROP TABLE USERS;

CREATE TABLE USERS(
  UserID SERIAL PRIMARY KEY,
  password CHAR(20) NOT NULL,
  Last_Name CHAR(20) NOT NULL,
  First_Name CHAR(20) NOT NULL,
  Email CHAR(40) NOT NULL UNIQUE,
  City CHAR(40),
  Province CHAR(40),
  Country CHAR(40)
);

SELECT * FROM USERS;

INSERT INTO USERS("password","last_name","first_name","email","city","province","country")
VALUES('214','Liu','Ray','rogerliuray@gmail.com','nanjing','jiangsu','China');
INSERT INTO USERS("password","last_name","first_name","email","city","province","country")
VALUES('321','Liu','fei','fei@gmail.com','nanjing','jiangsu','China');


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

 CREATE TRIGGER check_password
  BEFORE INSERT OR UPDATE
  ON USERS
  FOR EACH ROW
  EXECUTE PROCEDURE check_password();
