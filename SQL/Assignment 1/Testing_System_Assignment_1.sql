CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department(
			DepartmentID INT,
            DepartmentSales VARCHAR(40),
            DepartmentHR VARCHAR(50)
);
CREATE TABLE  `Position`(
			PositionID TINYINT,
            PositionDev VARCHAR(50),
            PositionPM VARCHAR(50),
            PositionTester VARCHAR(50)
);
CREATE TABLE `Account`(
           AccountID INT,
           Email VARCHAR(50),
           Username VARCHAR(50),
           Fullname VARCHAR(50),
           DepartmentID VARCHAR(50),
           PositionID TINYINT,
           CreateDate DATE
);
CREATE TABLE `Group`(
			GroupID INT,
			GroupName VARCHAR(50),
            CreateID INT,
            CreateDate DATE
);
CREATE TABLE GroupAccount(
			GroupID INT,
            AccountID INT,
            Joindate DATE
);
CREATE TABLE TypeQuestion(
			TypeID INT,
            TypeEssay VARCHAR(100),
            TypeMutipleChoice VARCHAR(100)
);
CREATE TABLE CategoryQuestion(
			CategoryID INT,
            CategoryJava VARCHAR(100),
            CategoryNET VARCHAR(100)
);
CREATE TABLE Question(
			QuestionID INT,
            Content VARCHAR(1000),
            CategoryID INT,
            TypeID INT,
            CreatorID INT,
            CreateDate DATE
);
CREATE TABLE Answer(
			AnswerID INT,
            Content VARCHAR(2000),
            QuestionID INT,
            isCorrect VARCHAR(20)
);
CREATE TABLE Exam(
			ExamID INT,
            `Code` VARCHAR(15),
            Tittle VARCHAR(15),
            CategoryID INT,
            Duration DATETIME,
            CreatorID INt,
            CreateDate DATE
);

CREATE TABLE ExamQuestion(
			ExamID INT,
            QuestionID INT
);
		
     -- done       
            
            
            
            


            