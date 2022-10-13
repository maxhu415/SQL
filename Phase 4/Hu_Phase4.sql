/*Question 1 Retrieve the street address for houses with an agent in the New Orleans office.*/
SELECT Address
FROM House, Agent1
WHERE AgentID = AgID
AND AgentOffice LIKE '%New Orleans%';

/*Question 2 Retrieve the street address for house which have a seller name that is the same as the listing agent’s name.*/
SELECT Address
FROM House, Seller, Agent1
WHERE SellerSSN = SellSSN
AND AgentID = AgID
AND SellerName = AgentName;

/*Question 3 . Find names of all agents who represent a buyer with a minimum price range greater than $80K and a maximum price range less than $225K.*/
SELECT AgentName
FROM Agent1 INNER JOIN Buyer
ON AgentID = AgID
AND BuyerMin >= 80000
AND BuyerMax <= 225000;

/*Question 4 For each agent, list their name, office, and the total number of buyers they represent.*/
SELECT AgentName, AgentOffice, COUNT(*)
FROM Agent1 INNER JOIN Buyer
ON Buyer.AgentID = AgID
GROUP BY AgentName, AgentOffice;

/*Question 5 Retrieve the street address for all houses that have an agent who is representing at least one buyer. */
SELECT Address
FROM House INNER JOIN Buyer
ON House.AgentID = Buyer.AgentID
GROUP BY Address
HAVING COUNT(Buyer.AgentID) >= 1;

/*Question 6 Retrieve the street address for all houses that have an agent who is not representing any buyers.*/
SELECT Address
FROM House LEFT OUTER JOIN Buyer
ON Buyer.AgentID = House.AgentID
WHERE Buyer.AgentID IS NULL;

/*Question 7 For each agent, retrieve the agent’s name and the average commission of all houses they are listing. */
SELECT AVG(Commission), AgentName
FROM Agent1 INNER JOIN House
ON AgentID = AgID
GROUP BY AgentName;

/*Question 8 Retrieve the average price for all houses in the state of Louisiana. */
SELECT AVG(Price)
FROM House INNER JOIN Agent1
ON AgentID = AgID
AND StateName LIKE 'Louisiana';


/*Question 9 List the names of all agents and the number of phone numbers they have.*/
SELECT AgentName, COUNT(AgNumber)
FROM Agent1 INNER JOIN AgentPhone
ON AgID = AgentID
GROUP BY AgentName, AgNumber;

/*Question 10 Find the names of all agents who represent exactly two buyers. */
SELECT AgentName
FROM Agent1 INNER JOIN Buyer
ON AgID = AgentID 
GROUP BY AgentName
HAVING COUNT(AgentID) = 2; 

/*Question 11 For each agent whose average commission is greater than $10K, retrieve the agent’s name and the number houses they represent.*/
SELECT AgentName, COUNT(Address)
FROM Agent1 RIGHT OUTER JOIN House
ON AgentID = AgID
HAVING AVG(Price * Commission) >= 10000
GROUP BY AgentName;

/*Question 12 Retrieve the names of all buyers who are represented by the agent who is listing the lowest priced house.*/
SELECT BuyerName
FROM Buyer INNER JOIN House
ON Buyer.AgentID = House.AgentID
AND Price = (SELECT MIN(Price) FROM House)
GROUP BY BuyerName;

/*Question 13 Retrieve the agent’s name and the buyer’s name for all agents who are listing a house within the buyer’s price range (i.e., house price is between minimum and maximum price range).*/
SELECT AgentName, BuyerName
FROM Agent1, Buyer, House
WHERE House.AgentID = AgID
AND Price BETWEEN BuyerMin AND BuyerMax
GROUP BY AgentName, BuyerName;

/*Question 14 Find sellers whose SSN number has a pattern 321 repeated twice (sequentially). For example, the query should return sellers with the SSN’s ‘321-32-145’ and ‘983-21-3219’, but not ‘321-99-3218’.*/
SELECT SellSSN
FROM Seller
WHERE REGEXP_LIKE(SellSSN, '3-?2-?1-?3-?2-?1-?');

/*Question 15 Find agents whose office consists of exactly 2 words. For example, the query should return records for “Metairie Office” and “Downtown Office”, but not “University of New Orleans Office”.*/
SELECT AgentName, AgentOffice
FROM Agent1
WHERE REGEXP_LIKE (AgentOffice, '^[A-z]+ [A-z]+$');

/*Question 16 Find all houses that include a street number in the street address. For example, the query should return records for “2000 Lakeshore Drive” and “1500 Sugar Bowl Drive” but not “Canal Street”.*/
SELECT Address
FROM House
WHERE REGEXP_LIKE (Address, '[0-9]{3}');




 
