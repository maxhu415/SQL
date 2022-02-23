@"C:\Users\Maxhu\Documents\School work\Fall 2021\Database Models 4125\Phase 3\Hu_schema.sql"
@"C:\Users\Maxhu\Documents\School work\Fall 2021\Database Models 4125\Phase 3\Hu_Inserts.sql"

SELECT * FROM Agent1;
SELECT * FROM House;


-- Write a trigger that will fire when you insert a row into house
CREATE OR REPLACE TRIGGER AddingHousesRepresented 
AFTER INSERT ON House
FOR EACH ROW

DECLARE
    HousesRepresented Agent1.HousesRepresented%TYPE;

BEGIN
    SELECT HousesRepresented INTO HousesRepresented FROM Agent1 WHERE AgID = :new.AgentID;
    IF (HousesRepresented >= 3) THEN
    RAISE_APPLICATION_ERROR(-20001, 'Agent is fully booked');
    ELSIF (HousesRepresented < 3) THEN
    DBMS_OUTPUT.PUT_LINE('Agent booking is available');
    UPDATE Agent1
    SET HousesRepresented = HousesRepresented + 1
    WHERE AgID = :new.AgentID;
    END IF;
    
END;
/
DELETE FROM House;
INSERT INTO House VALUES (606, 'Pennsylvania', '512 Philidelphia Ave', 1503, 1, 0.12, 624353, '321-23-7321');

-- Write a trigger that will fire when you delete a row from house
CREATE OR REPLACE TRIGGER DeletingHousesRepresented
AFTER DELETE ON House
FOR EACH ROW
DECLARE
    HousesRepresented Agent1.HousesRepresented%TYPE;

BEGIN
    SELECT HousesRepresented INTO HousesRepresented FROM Agent1 WHERE AgID = :old.AgentID;
    DBMS_OUTPUT.PUT_LINE('Removing house');
    UPDATE Agent1
    SET HousesRepresented = HousesRepresented - 1
    WHERE AgID = :old.AgentID;
    
END;
/
SELECT * FROM Agent1;
SELECT * FROM House;
DELETE FROM House WHERE AgentID = 4;
UPDATE Agent1
SET HousesRepresented = 0


-- Write a trigger that will fire when the Agent ID for a house record is changed  
CREATE OR REPLACE TRIGGER HousesRepresented3
AFTER UPDATE ON House
FOR EACH ROW

DECLARE
    HousesRepresented Agent1.HousesRepresented%TYPE;

BEGIN
    SELECT HousesRepresented INTO HousesRepresented FROM Agent1 WHERE AgID = :new.AgentID;
    IF (HousesRepresented >= 3) THEN
    RAISE_APPLICATION_ERROR(-20002, 'Agent is fully booked');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Agent changed');
    UPDATE Agent1
    SET HousesRepresented = HousesRepresented + 1
    WHERE AgID = :new.AgentID;
    
    UPDATE Agent1
    SET HousesRepresented = HousesRepresented - 1
    WHERE AgID = :old.AgentID;
    END IF;
    
END;
/

SELECT * FROM Agent1;
SELECT * FROM House;

UPDATE House
SET AgentID = 4
WHERE HouseID = 303;






