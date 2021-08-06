-- Below is a "Business Type" reason to have such a procedure 
-- As we age and learn about multiple gender identies we want our employees to feel not only included but 
-- let them know that they are valid this procedure will add more options to the gender column then just 
-- then just 'f' and 'm'. The two that will be added are going to be GF for Gender Fluid, NB for 
-- non biarnay workers and finally for the workers that are still learning more about their gender identity 
-- UD as Undecided. As time continues there may be another gender identity an employee would feel more 
-- comfortable with another unmentioned gender identity which can be added through this procedure. 
-- Examples of future additions would be agender, genderqueer, or intersex.  

-- This procedure will add everyones personal pronouns, some people prefer to go by they/them, she/her, 
-- he/him. Not always by the name will you know their personal pronouns are, or if an anutomatic
-- email were to be distrubitied throughout our business we would want to use the correct pronoun used 
-- when addressing our employees this will add a column into our employee database and based on their 
-- gender identity they will be given pronouns accordingly, this can be updated based on future knowledge 
-- into personal pronouns as we learn more together. 

USE employees;
-- ALTER TABLE employees MODIFY gender enum('M', 'F','GF', 'NB');
-- ALTER TABLE employees 
-- ADD COLUMN personal_pronouns varchar(20) 
-- DESC employees;
DELIMITER $$

DROP PROCEDURE IF EXISTS employee_personal_pronouns$$
CREATE PROCEDURE employee_personal_pronouns(
)

BEGIN 
	SELECT concat(last_name, " ", first_name ) AS "Employee", gender AS "Gender Identity", personal_pronouns AS "Personal Pronouns" FROM employees e
    ORDER BY last_name, first_name;
	UPDATE employees set personal_pronouns = 'She/Her'
	WHERE gender = 'F';
    UPDATE employees set personal_pronouns = 'He/Him'
    WHERE gender = 'M';
    UPDATE employees set personal_pronouns = 'They/Them'
    WHERE gender = 'GF';
    UPDATE employees set personal_pronouns = 'They/Them'
    WHERE gender = 'NB';
    END $$
DELIMITER ;
CALL employee_personal_pronouns();