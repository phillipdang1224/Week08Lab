DROP DATABASE if exists NotesDB;
CREATE DATABASE NotesDB;

USE NotesDB;

CREATE TABLE note (
    noteID int not null AUTO_INCREMENT,
    dateCreated DATETIME NOT NULL,
    contents NVARCHAR(10000) not null,
    CONSTRAINT PK_ID PRIMARY KEY (noteID));
COMMIT;
