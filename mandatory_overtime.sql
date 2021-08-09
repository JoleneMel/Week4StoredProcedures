-- stored procedure with else if 
-- mandatory overtime 

USE employees;
DELIMITER $$
-- DESC employees;
DROP PROCEDURE IF EXISTS mandatory_overtime$$
CREATE PROCEDURE mandatory_overtime(
in scheudle_code varchar(20), 
out hours_needed varchar(20)
)


BEGIN 
    IF scheudle_code = 'On Target' 
    THEN
    SET hours_needed = 'No overtime needed';
    ELSEIF scheudle_code = 'Behind Target'
    THEN 
    SET  hours_needed = '2 hour of overtime for company needed';
    ELSEIF scheudle_code = 'Missed Target'
    THEN
    SET hours_needed = '4 hour of overtime for company needed';
    END IF; 
        END $$
DELIMITER ;
CALL mandatory_overtime ('On Target', @hours_needed);
select @hours_needed;