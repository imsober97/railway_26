USE testing_system_assignment3;

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
order by fullname
LIMIT 1;


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




