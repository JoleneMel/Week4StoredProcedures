-- The procedure will allow any department to look up the birthdays with the parameters dept_name and the 
-- bday month so they could have a nice list to display at the beginning of every month organized by 
-- date to keep up employee morale and celebrate our employees birthday, sepreating by department 

USE employees;
DELIMITER $$

DROP PROCEDURE IF EXISTS birthday_per_dept$$
CREATE PROCEDURE birthday_per_dept(
IN month_name varchar(9),
IN department varchar(20) 
)

BEGIN 
	SELECT dept_name AS "Department", birth_date AS "Birthday", concat(first_name, " ", last_name) AS "Employee" FROM employees e
    INNER JOIN dept_emp USING (emp_no)
    INNER JOIN departments d USING (dept_no)
    WHERE month_name = MONTHNAME(birth_date)
    AND dept_name = department
    ORDER BY birth_date;
END $$
DELIMITER ; 
CALL birthday_per_dept("August", "Marketing");
CALL birthday_per_dept("December", "Research");