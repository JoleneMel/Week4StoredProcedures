-- Pandemic bonus, Due to some sections either being over worked due to the pandemic or understaffed or 
-- both the bonus can be made by selecting the department, the current employeed workers and the 
-- % of a bonus per employee salary they would want to give as a bonus 
USE employees;
DELIMITER $$

DROP PROCEDURE IF EXISTS pandemic_bonus_per_dept$$
CREATE PROCEDURE pandemic_bonus_per_dept(
IN department varchar(20), 
IN x decimal(2,2)
)

BEGIN 
	SELECT dept_name AS "Department", concat(last_name, " ", first_name ) AS "Employee", format(salary,2) AS "Yearly Salary", format((salary * x),2) AS "Pandemic Bonus" FROM employees 
    INNER JOIN salaries s USING (emp_no) 
    INNER JOIN dept_emp USING (emp_no)
    INNER JOIN departments d USING (dept_no)
    WHERE s.to_date > now()
    AND dept_name = department
    ORDER BY last_name, first_name;
END $$
DELIMITER ;
CALL pandemic_bonus_per_dept("Marketing", .05);