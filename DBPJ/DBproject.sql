

CREATE DATABASE CSI2132PJ;

CREATE SCHEMA MOVEDB;
SET SEARCH_PATH='movedb';

DROP TABLE USERS;
/*Users*****************************************************/
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

/*Profile************************************/
CREATE TABLE PROFILE(
     userid INT NOT NULL,
  CONSTRAINT profile_fkey FOREIGN KEY (userid)
    REFERENCES USERS (userid)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT profile_pkey PRIMARY KEY (userid,year_born),
    age_range char(20) CHECK(age_range IN('Youth','Adult','Elderly')),
    year_born char(4),
    gender    char(20) CHECK(gender IN('Male','Female','Unknown')),
    occupation char(40),
    device_used char(40));

SELECT * FROM PROFILE;
INSERT INTO profile
VALUES(1,'Adult','1994','Male','Software Engineer','Mac book pro');
INSERT INTO profile
VALUES(2,'Adult','1995','Male','Software Engineer','Mac book pro');

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

  /*Topics******************************/
CREATE TABLE TOPICS(
  topic_id serial PRIMARY key,
  description char(40) NOT NULL
);


/*MOVIES******************************/

CREATE TABLE MOVIE(
  movie_id serial PRIMARY key,
  name char(50) NOT NULL UNIQUE,
  date_released DATE NOT NULL,

);

/*WATCHED*****************************/
CREATE TABLE WATCHES(
  userid INT NOT NULL,
  movie_id INT NOT NULL,
  CONSTRAINT userid_fkey FOREIGN KEY(userid)
  REFERENCES USERS (userid) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT movie_id FOREIGN KEY(movie_id) ON UPDATE CASCADE
  REFERENCES MOVIE(movie_id),
  language char(30),
  subtitles boolean,
  country char(40)


);
