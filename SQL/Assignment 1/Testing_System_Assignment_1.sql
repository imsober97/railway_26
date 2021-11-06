
USE Testing_System_Assignment_1;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
			DepartmentID INT,
            DepartmentName ENUM("HR","Sales","Marketing")
);
DROP TABLE IF EXISTS `Position`;
CREATE TABLE  `Position`(
			PositionID INT,
            PositionName ENUM("Dev","Tester","Scrum Master","PM")
            
);
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
           AccountID INT,
           Email VARCHAR(50),
           Username VARCHAR(50),
           Fullname VARCHAR(50),
           DepartmentID VARCHAR(50),
           PositionID TINYINT,
           CreateDate DATE
);
DROP TABLE `Group`;
CREATE TABLE `Group`(
			GroupID INT,
			GroupName VARCHAR(50),
            CreateID INT,
            CreateDate DATE
);

DROP TABLE GroupAccount;
CREATE TABLE GroupAccount(
			GroupID INT,
            AccountID INT,
            Joindate DATE
);
DROP TABLE TypeQuestion;
CREATE TABLE TypeQuestion(
			TypeID INT,
            TypeEssay VARCHAR(100),
            TypeMutipleChoice VARCHAR(100)
);
DROP TABLE CategoryQuestion;
CREATE TABLE CategoryQuestion(
			CategoryID INT,
            CategoryJava VARCHAR(100),
            CategoryNET VARCHAR(100)
);
DROP TABLE Question;
CREATE TABLE Question(
			QuestionID INT,
            Content VARCHAR(1000),
            CategoryID INT,
            TypeID INT,
            CreatorID INT,
            CreateDate DATE
);
DROP TABLE Answer;
CREATE TABLE Answer(
			AnswerID INT,
            Content VARCHAR(2000),
            QuestionID INT,
            isCorrect ENUM("yes","no")
);
DROP TABLE Exam;
CREATE TABLE Exam(
			ExamID INT,
            `Code` VARCHAR(15),
            Tittle VARCHAR(15),
            CategoryID INT,
            Duration DATETIME,
            CreatorID INt,
            CreateDate DATE
);

DROP TABLE ExamQuestion;
CREATE TABLE ExamQuestion(
			ExamID INT,
            QuestionID INT
);
		
     -- done       
            
            
            
            


            