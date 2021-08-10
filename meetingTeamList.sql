use employees;
DELIMITER $$
DROP PROCEDURE IF EXISTS meetingTeamList$$
CREATE PROCEDURE meetingTeamList (
	INOUT teamList varchar(4000)
)
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE teamMember varchar(100) DEFAULT "";
   --  DECLARE randomEmployee int default (RAND()*(49999-10000+1))+10000;
   -- to do later get a random employee not the same employee,
	DECLARE teamDept varchar(100) DEFAULT "";
	DECLARE deptName varchar(100) DEFAULT "";
    DECLARE newDeptNo varchar(100) DEFAULT CONCAT("d00", CAST(FLOOR(RAND()*(9-1+1))+1 AS CHAR));
	-- declare cursor
	DEClARE curMeeting
		CURSOR FOR
SELECT d.dept_name, d.dept_no, concat(first_name, " ", last_name) FROM employees e
INNER JOIN dept_emp de USING (emp_no)
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name =
	(SELECT n.dept_name FROM departments n
	 WHERE n.dept_no = newDeptNo LIMIT 1)
     LIMIT 1;
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER
	FOR NOT FOUND SET finished = 1;
	OPEN curMeeting;
	getTeam: LOOP
		FETCH curMeeting INTO deptName, teamDept, teamMember;
		IF (finished = 1) THEN
			LEAVE getTeam;
		END IF;
		-- build meeting list
		SET teamList = CONCAT(teamDept, " ", teamMember,";\n",teamList);
	END LOOP getTeam;
	CLOSE curMeeting;
END$$
DELIMITER ;

SET @teamList = ""; 
CALL meetingTeamList(@teamList); 
SELECT @teamList;