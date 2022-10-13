SELECT BuyerName
FROM Buyer
WHERE BuyerMin <= 150000;

SELECT BuyerMax
FROM Buyer
Where agentID = 1
ORDER BY BuyerMax DESC;

SELECT BuyerName
FROM Buyer
WHERE BuyerPhone LIKE '504_________';

SELECT Address
FROM House
Where Price IS NULL;

SELECT SquareFeet
FROM House
WHERE Price BETWEEN 100000 AND 200000;

SELECT BuyerName
FROM Buyer
WHERE BuyerPhone LIKE '312_________' AND AgentID != 1;

SELECT MIN(SquareFeet) as minsqft, MAX(SquareFeet) as maxsqft
FROM House

SELECT AVG(BuyerMax)
FROM Buyer
WHERE AgentID = 1;






