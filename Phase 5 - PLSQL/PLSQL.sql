@"C:\Users\Maxhu\Documents\School work\Fall 2021\Database Models 4125\Phase 3\Hu_schema.sql"
@"C:\Users\Maxhu\Documents\School work\Fall 2021\Database Models 4125\Phase 3\Hu_Inserts.sql"


DECLARE 
    
    AvgPriceForAllHomes NUMBER;
    MinPricePerSqFt NUMBER;
    MaxPricePerSqFt NUMBER;
    AvgPricePerSqFt NUMBER;
    HouseAddress House.Address%TYPE;
    CURSOR Homes IS (SELECT Address FROM House);
    CURSOR SqFtAvg IS (Select Price/SquareFeet FROM House);
    
BEGIN
    
    SELECT AVG(Price/SquareFeet), MIN(Price/SquareFeet), MAX(Price/SquareFeet) INTO AvgPriceForAllHomes, MinPricePerSqFt, MaxPricePerSqFt FROM House;
        DBMS_OUTPUT.PUT_LINE('Price per square feet aggregates are  ' || AvgPriceForAllHomes || ', ' || MinPricePerSqft || ', ' || MaxPricePerSqft);
    
    
    OPEN Homes;
    OPEN SqFtAvg;
    LOOP
    FETCH Homes INTO HouseAddress;
    FETCH SqFtAvg INTO AvgPricePerSqFt;
    EXIT WHEN Homes%NOTFOUND;
    
    IF (AvgPriceForAllHomes > AvgPricePerSqft) THEN
        DBMS_OUTPUT.PUT_LINE(HouseAddress || ', ' || AvgPricePerSqft|| ' Below Average');
    ELSIF (AvgPriceForAllHomes = AvgPricePerSqft) THEN
        DBMS_OUTPUT.PUT_LINE(HouseAddress || ', ' || AvgPricePerSqft|| ' Average');
    ELSIF (AvgPriceForAllHomes < AvgPricePerSqft) THEN
        DBMS_OUTPUT.PUT_LINE(HouseAddress || ', ' || AvgPricePerSqft|| ' Above Average');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Could not fetch information');
    
    END IF;
    
    
    END LOOP;
    CLOSE Homes;
    CLOSE SqFtAvg;
    
   
    -- Use for loop for displaying house
    --Declare a counter for rows
    --Insert the row count into counter
    
END;
/