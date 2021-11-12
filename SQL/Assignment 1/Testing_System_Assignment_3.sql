DROP DATABASE IF EXISTS testing_system_assignment3;
CREATE DATABASE testing_system_assignment3;
USE testing_system_assignment3;

CREATE TABLE department(
	departmentID		TINYINT PRIMARY KEY AUTO_INCREMENT,
    department_name		VARCHAR(50) NOT NULL UNIQUE KEY
);

CREATE TABLE `position`(
	positionID			TINYINT PRIMARY KEY AUTO_INCREMENT,
    position_name		VARCHAR(30) UNIQUE KEY
);

CREATE TABLE `account`(
	accountID			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email				VARCHAR(50) NOT NULL UNIQUE KEY,
    username			VARCHAR(50) NOT NULL UNIQUE KEY,
    fullname			VARCHAR(100) NOT NULL,
    departmentID		TINYINT NOT NULL,
    positionID			TINYINT,
    create_date			DATETIME,

    FOREIGN KEY (departmentID) REFERENCES department (departmentID),
    FOREIGN KEY (positionID)	REFERENCES `position` (positionID)
);

CREATE TABLE `group`(
	groupID				TINYINT UNSIGNED AUTO_INCREMENT,
    group_name			VARCHAR(50) NOT NULL,
    creatorID			SMALLINT UNSIGNED NOT NULL,
    create_date			DATETIME DEFAULT NOW(),
    PRIMARY KEY (groupID),
    FOREIGN KEY (creatorID) REFERENCES `account` (accountID)
    
);



CREATE TABLE groupaccount(
	groupID			    TINYINT UNSIGNED AUTO_INCREMENT,
    accountID			SMALLINT UNSIGNED NOT NULL,
    join_date			DATETIME DEFAULT NOW(),
    PRIMARY KEY (groupID, accountID),
    FOREIGN KEY (groupID) REFERENCES `group` (groupID),
    FOREIGN KEY (accountID) REFERENCES `account` (accountID)
);

CREATE TABLE typequestion (
	typeID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    type_name			ENUM ('essay','multiple-choice') NOT NULL 
);

CREATE TABLE categoryquestion (
	categoryID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name		VARCHAR(50) NOT NULL
);

CREATE TABLE question (
	questionID			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content				VARCHAR(300) UNIQUE NOT NULL,
    categoryID			TINYINT UNSIGNED  NOT NULL,
    typeID				TINYINT UNSIGNED  NOT NULL,
    creatorID			SMALLINT UNSIGNED NOT NULL,
    createdate			DATETIME DEFAULT NOW(),
    FOREIGN KEY (creatorID) REFERENCES `account` (accountID),
    FOREIGN KEY (categoryID) REFERENCES categoryquestion (categoryID),
    FOREIGN KEY (typeID) REFERENCES typequestion (typeID)
);

CREATE TABLE answer (
	answerID			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content				VARCHAR(100) UNIQUE NOT NULL,
    questionID			SMALLINT UNSIGNED NOT NULL,
    iscorrect			ENUM ('True','False','Unknown') NOT NULL,
    FOREIGN KEY (questionID) REFERENCES question (questionID)
);

CREATE TABLE exam (
	examID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code`				VARCHAR(20) UNIQUE NOT NULL,
    tittle				VARCHAR(50) UNIQUE NOT NULL,
    categoryID			TINYINT UNSIGNED NOT NULL,
    creatorID			SMALLINT UNSIGNED NOT NULL,
    duration			TINYINT UNSIGNED NOT NULL CHECK ( duration >= 15 AND duration <= 160 ),
    createdate			DATETIME,
    FOREIGN KEY (categoryID) REFERENCES categoryquestion (categoryID),
    FOREIGN KEY (creatorID) REFERENCES `account` (accountID)
);

CREATE TABLE examquestion (
	examID				TINYINT UNSIGNED AUTO_INCREMENT ,
    questionID			SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(examID,questionID),
    FOREIGN KEY (questionID) REFERENCES question (questionID),
    FOREIGN KEY (examID) REFERENCES exam (examID)
);

-- insert cac du lieu vao bang---
INSERT INTO department (department_name)
VALUES					('HR'),('Sale'),('Security'),('Driver'),('Celebrity');
                        

INSERT INTO `position` (position_name)
VALUES					('Dev'),('QA'),('Tester'),('PM'),('Scrum Mater'),('HL');

INSERT INTO `account` 
(email,username,fullname,departmentID,positionID)
VALUES				
('mypj87@gmail.com','pvt98','Pham Van Thanh',1,2),
('littebbza@gmail.com','vungoanmori','Ngo Le Kieu My',2,4),
('cantwetalk@gmail.com'	,'smalldiz2','Tran Nha Uyen',3,2),
('lpk8n@gmail.com',	'jpanese','Pham Toan Nang',5,2),
('callmebyname2@gmail.com','callmeuse','Tran Van Binh',3,5),
('thinh.ithp@gmail.com','NhanTHanh','Tran Thanh Nhan',1,4),
('lovingmyhub2@gmail.com','dfsi5','Dau Thuy An',3,4)
;

INSERT INTO `group` (group_name,creatorID,create_date)
VALUES				('raptor69',1,'2019-02-02'),
					('dragonball',4,'2021-07-03'),
					('mycr',5,'2021-09-01'),
                    ('vitor',5,'2019-12-21'),
                    ('liquiq',7,'2020-12-01'),
                    ('c9',2,'2021-05-12'),
                    ('DMX',4,'2020-12-01'),
                    ('VApe',3,'2021-01-04'),
                    ('awesome',1,'2020-02-07');


INSERT INTO groupaccount 
(groupID, accountID)
VALUES
(1,1),(1,2),(2,3),(2,5),(2,6),(3,5),(4,4),(4,5),(4,3)
;

INSERT INTO typequestion (type_name)
VALUE ('essay'),('multiple-choice');



INSERT INTO categoryquestion (category_name)
VALUES					('Java'),('NET'),('SQL'), ('JavaScript'), ('Python'),('AWS');
            

INSERT INTO question (content,categoryID,typeID,creatorID)
VALUES					('SQL la gi',2,1,1),
						('SQL Server la gi',1,2,2),
						('khac nhau giua truncate va delete?',3,1,4),
						('table va feild la gi?',4,1,5),
                        ('constraint la gi',7,1,3),
                        ('primary key la gi?',4,1,5)
                        ;
                    
                 

INSERT INTO answer (content,questionID,iscorrect)
VALUES				('la ngon ngu truy van co cau truc, la ngon ngu quan ly CSDL',4,'true'),
					('La he thong quan ly co so du lieu, cap nhat, phan tich, quan tri CSDL',2,'true'),
					('giong nhau',3,'false'),
                    ('table duoc to chuc don gian thanh hang va cot, feild la mot so cot trong bang',4,'true'),
                    ('constraint duoc su dung de gach duoi va xac dinh so luong cua mot loai du lieu cu the',1,'true'),
                    ('la mot cot hoac mot so cot xac dinh duy nhat moi hang trong bang',5,'true');
                    
                    

INSERT INTO exam (`code`,tittle,categoryID,creatorID, duration)
VALUES			('SQL1','SQL.task 1',3,5,120),
				('SQL2','SQL.task 2',6,3,100),
				('Python','Python.Zero1',2,5,90),
				('Java01','Java.Lv1',1,3,60),
				('Java02','Java.lv2',4,5,30)
               ;


INSERT INTO examquestion (examID, questionID)
VALUES	(1,1),
		(1,2),
        (2,3),
        (4,20),
        (5,19),
        (6,10);
                            
	-- answer the question--
-- Q2:
SELECT * FROM Department;

-- Q3:
SELECT  departmentID from department where department_name ='Sale';

-- Q4:
SELECT * FROM `account` WHERE LENGTH(fullname)=(SELECT MAX(LENGTH(fullname)) FROM `account`)
ORDER BY fullname
LIMIT 1;



-- Q5:
WITH cte_d3 AS (SELECT * FROM `account` WHERE departmentID=3)
SELECT * FROM cte_d3
WHERE LENGTH(fullname)=(SELECT MAX(LENGTH(fullname)) FROM cte_d3)
order by fullname;


-- Q6:
SELECT group_name FROM `group` WHERE create_date <'20231209';

-- Q7:
SELECT * FROM answer;
SELECT  a.questionID, COUNT(a.questionID)AS SL FROM answer a
GROUP BY a.questionID 
HAVING COUNT(a.questionID)>=4;


-- Q8:
USE testing_system_assignment3;
select `code` from exam
 where duration>=60 and createdate<'20191220';
 
 -- Q9:
 SELECT * FROM `group`
 ORDER BY create_date DESC 
 LIMIT 5;
  
  
  -- Q10
  SELECT departmentID, COUNT(accountID) 
  FROM `account` WHERE departmentID=3;
  
-- Q11: lay ra ten nhan vien bat dau bang 'D' ket thuc bang o
SELECT fullname FROM `account`
WHERE fullname LIKE "P%h";


-- Q12 
DELETE FROM exam 
WHERE createdate <'20191220';


-- Q13
 DELETE FROM question where content LIKE "cau hoi%";



-- Q14: 
UPDATE `account` SET fullname='Nguyen Ba Loc',
					email='loc.nguyenba@gmail.com'
WHERE accountID =5;


-- Q15: update account co id=5 thuoc group co id=3
UPDATE groupaccount SET accountID=5
WHERE groupID=3;




