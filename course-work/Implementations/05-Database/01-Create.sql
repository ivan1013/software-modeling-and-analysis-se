CREATE DATABASE ProjectManagementDB;
GO

USE ProjectManagementDB;
GO

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50) NOT NULL
);

CREATE TABLE Teams (
    TeamID INT IDENTITY(1,1) PRIMARY KEY,
    TeamName NVARCHAR(100) NOT NULL,
    CreatedDate DATE DEFAULT GETDATE()
);

CREATE TABLE TeamMembers (
    UserID INT,
    TeamID INT,
    JoinedDate DATE DEFAULT GETDATE(),
    PRIMARY KEY (UserID, TeamID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    TeamID INT,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(2000),
    StartDate DATE NOT NULL,
    EndDate DATE,
    Budget DECIMAL(18, 2),
    Status NVARCHAR(50),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE Tasks (
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    AssignedToUserID INT,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(2000),
    Priority NVARCHAR(50),
    EstimatedHours INT,
    DueDate DATE,
    Status NVARCHAR(50),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (AssignedToUserID) REFERENCES Users(UserID)
);

CREATE TABLE Comments (
    CommentID INT IDENTITY(1,1) PRIMARY KEY,
    TaskID INT NOT NULL,
    AuthorUserID INT NOT NULL,
    Content NVARCHAR(2000),
    PostedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    FOREIGN KEY (AuthorUserID) REFERENCES Users(UserID)
);

CREATE TABLE Tags (
    TagID INT IDENTITY(1,1) PRIMARY KEY,
    TagName NVARCHAR(100) NOT NULL,
    ColorCode NVARCHAR(20)
);

CREATE TABLE TaskTags (
    TaskID INT,
    TagID INT,
    PRIMARY KEY (TaskID, TagID),
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    FOREIGN KEY (TagID) REFERENCES Tags(TagID)
);
GO
