CREATE TABLE Users (
  userID INT PRIMARY KEY,
  connectionID INT,
  username VARCHAR(50),
  password_hash VARCHAR(100),
  creation_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Relationships (
  relationshipID INT PRIMARY KEY,
  userID INT,
  connectionID INT,
  FOREIGN KEY (userID) REFERENCES Users(userID),
  FOREIGN KEY (connectionID) REFERENCES Connections(connectionID),

  creation_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  edit_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  -- to make the edit timestamp dynamic create a trigger
);

CREATE TABLE Connections (
  connectionID INT PRIMARY KEY,
  userID INT OR NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  description VARCHAR(500),
  FOREIGN KEY (userID) REFERENCES Users(userID),

  creation_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  edit_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  -- to make the edit timestamp dynamic create a trigger
);

CREATE TABLE Events (
  eventID INT PRIMARY KEY,
  relationshipID INT,
  FOREIGN KEY (relationshipID) REFERENCES Relationships(relationshipID),

  title VARCHAR(30),
  description VARCHAR(30),
  date DATE,
  connection_score SMALLINT,

  creation_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  edit_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  -- to make the edit timestamp dynamic create a trigger
);

CREATE TABLE ForeignAccounts (
  userID INT,
  connectionID INT,
  PRIMARY KEY (userID, connectionID),
  FOREIGN KEY (userID) REFERENCES Users(userID),
  FOREIGN KEY (connectionID) REFERENCES Conenctions(connectionID),

  platformID INT,
  FOREIGN KEY (platformID) REFERENCES ForeignAccountPlatforms(platformID)
  hyperlink VARCHAR(100),
  username VARCHAR(50)
);

CREATE TABLE ForeignAccountPlatforms (
  platformID INT PRIMARY KEY,
  username VARCHAR(30),
  base_url VARCHAR(100),
  icon_url VARCHAR(100)
);
