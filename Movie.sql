Create Table MovieTopics (
	topic_id SERIAL NOT NULL,
	movie_id  serial NOT NULL,
	language char(30),
	subtitles boolean,
	Country VARCHAR(20),
	Primary Key (topic_id, movie_id),
	Foreign Key (topic_id) References TOPICS ON UPDATE CASCADE ON DELETE CASCADE,
	Foreign Key (movie_id) References MOVIE ON UPDATE CASCADE ON DELETE CASCADE
);

Create Table Actor (
	ActorID serial NOT NULL,
	Last_Name VARCHAR(20),
	First_Name VARCHAR(20),
	DateOfBirth DATE,
	Primary key (ActorID)
);

Create Table Role(
	RoleID SERIAL NOT NULL,
	Name VARCHAR(20),
	ActorID serial NOT NULL,
	Primary Key(RoleID),
	Foreign Key (ActorID) References Actor ON UPDATE CASCADE ON DELETE CASCADE
);

Create Table ActorPlays(
	movie_id  serial NOT NULL,
	ActorID serial NOT NULL,
	Primary Key (movie_id , ActorID),
	Foreign Key (ActorID) References Actor ON UPDATE CASCADE ON DELETE CASCADE,
	Foreign Key (movie_id) References MOVIE ON UPDATE CASCADE ON DELETE CASCADE
);
