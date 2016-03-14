Create Table MovieTopics (
TopicID INT(10) NOT NULL,
MovieID INT(10) NOT NULL,
Language VARCHAR(20),
Subtitles CHAR(1) NOT NULL,
Country VARCHAR(20),
Primary Key (TopicID, MovieID),
Check (Subtitles = 'Y' or Subtitles = 'N')
);

Create Table Actor (
ActorID INT(10) NOT NULL,
Last_Name VARCHAR(20),
First_Name VARCHAR(20),
DateOfBirth DATE,
Primary key (ActorID)
);

Create Table Role(
RoleID INT(10) NOT NULL,
Name VARCHAR(20),
ActorID INT(10) NOT NULL,
Primary Key(RoleID),
Foreign Key (ActorID) References Actor,
Foreign Key (ActorID) References ActorPlays
);

Create Table ActorPlays(
MovieID INT(10) NOT NULL,
ActorID INT(10) NOT NULL,
Primary Key (MovieID, ActorID)
);
 
 