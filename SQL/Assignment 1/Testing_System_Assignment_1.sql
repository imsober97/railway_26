DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
			DepartmentID TINYINT AUTO_INCREMENT PRIMARY KEY,
            DepartmentName VARCHAR(50) UNIQUE KEY
            );
            INSERT INTO Department(DepartmentName) VALUES ("HR"),("Sales"),("Marketing"),("Service");

CREATE TABLE  `Position`(
			PositionID TINYINT AUTO_INCREMENT PRIMARY KEY,
            PositionName VARCHAR(50) NOT NULL
            
);
			INSERT INTO `Position`(PositionName) VALUES ("Truong Phong"),("Tap Vu"),("Pho Phong"),("Nhan Vien");
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
           AccountID TINYINT AUTO_INCREMENT PRIMARY KEY,
           Email VARCHAR(100) DEFAULT "" NOT NULL,
           Username VARCHAR(50) DEFAULT ""NOT NULL,
           Fullname VARCHAR(50),
           DepartmentID TINYINT,
           PositionID TINYINT,
           CreateDate DATETIME
);
			INSERT INTO `Account`(Email) VALUES ("mypj@gmail.com"),("dck@gmail.com"),("urnoob@gmail.com");
            INSERT INTO `Account`(Username) VALUES ("mike"),("taylor"),("russell");
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
			GroupID TINYINT AUTO_INCREMENT PRIMARY KEY,
			GroupName VARCHAR(50) NOT NULL,
            CreatorID TINYINT,
            CreateDate DATETIME DEFAULT NOW()
);
			INSERT INTO `Group`(GroupName, CreatorID) VALUES ("Project1",2),("Project3", 3);
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
			GroupID TINYINT,
            AccountID TINYINT,
            Joindate DATE
);
			INSERT INTO GroupAccount(Joindate) VALUES (20201202),(20210701);
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
			TypeID TINYINT AUTO_INCREMENT PRIMARY KEY,
            TypeName VARCHAR(50) NOT NULL
            
);
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
			CategoryID TINYINT,
            CategoryName VARCHAR(50) NOT NULL
);
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
			QuestionID TINYINT AUTO_INCREMENT PRIMARY KEY,
            Content VARCHAR(1000),
            CategoryID TINYINT,
            TypeID INT,
            CreatorID INT,
            CreateDate DATETIME
);
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
			AnswerID INT,
            Content VARCHAR(500),
            QuestionID TINYINT AUTO_INCREMENT PRIMARY KEY,
            isCorrect ENUM("true","false","unknow")
);
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
			ExamID INT,
            `Code` VARCHAR(15),
            Tittle VARCHAR(15),
            CategoryID INT,
            Duration DATETIME,
            CreatorID INt,
            CreateDate DATE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
			ExamID INT,
            QuestionID INT
);
		
     -- done       
            
            
            
            


            