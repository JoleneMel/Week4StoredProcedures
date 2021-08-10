USE employees;
DELIMITER $$
-- DESC employees;
DROP PROCEDURE IF EXISTS mixedDepartmentMeeting$$
CREATE PROCEDURE mixedDepartmentMeeting(
in x int,
INOUT teamList VARCHAR(4000)
)


BEGIN 
DECLARE no INT;
  SET no = 0;
  label: LOOP
    SET no = no +1; 
    CALL meetingTeamList(teamList); 
	-- SELECT teamList;
    IF no = x THEN
     LEAVE label;
    END IF;
 END LOOP label;
	 
END $$
DELIMITER ;

SET @totalMeetingList = "";
CALL mixedDepartmentMeeting(9, @totalMeetingList);
select @totalMeetingList;