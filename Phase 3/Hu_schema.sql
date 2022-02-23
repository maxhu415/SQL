DROP TABLE AgentPhone;
DROP TABLE Buyer;
DROP TABLE House;
DROP TABLE Seller;
DROP TABLE Agent1;


--AGENT (ID, Name, Office)
CREATE TABLE Agent1 (
    AgID CHAR(1),
    AgentName VARCHAR(25),
    AgentOffice VARCHAR (35),
    CONSTRAINT AgentPK PRIMARY KEY (AgID)
);

--AGENT PHONE (AgentID, AgentNumber)
CREATE TABLE AgentPhone (
    AgentID CHAR(1),
    AgNumber VARCHAR(15),
    CONSTRAINT AgentPhonePK PRIMARY KEY (AgNumber),
    CONSTRAINT AgentFK FOREIGN KEY (AgentID)
        REFERENCES Agent1(AgID)
);

--BUYER (SSN, Name, Min, Max, PhoneNumber, AgentID)
CREATE TABLE Buyer (
    BuySSN VARCHAR(15),
    BuyerName VARCHAR (20),
    BuyerMin NUMBER,
    BuyerMax NUMBER,
    BuyerPhone VARCHAR(15),
    AgentID CHAR(1),
    CONSTRAINT BuyerPK PRIMARY KEY (BuySSN),
    CONSTRAINT Agent1FK FOREIGN KEY (AgentID)
        REFERENCES Agent1(AgID)
);

--SELLER (SSN, Name, Spouse, PhoneNumber)
CREATE TABLE Seller (
    SellSSN VARCHAR(15),
    SellerName VARCHAR (20),
    SellerSpouse VARCHAR (20),
    SellerPhone VARCHAR(15),
    CONSTRAINT SellerPK PRIMARY KEY (SellSSN)
);

--HOUSE (ID, StreetName, Address, SquareFeet, AgentID, Commission, Price, SellerSSN)
CREATE TABLE House (
    HouseID NUMBER(3),
    StateName VARCHAR (15),
    Address VARCHAR(20),
    SquareFeet NUMBER,
    AgentID CHAR(1),
    Commission NUMBER,
    Price NUMBER,
    SellerSSN VARCHAR(15),
    CONSTRAINT HousePK PRIMARY KEY (HouseID),
    CONSTRAINT SellerFK FOREIGN KEY (SellerSSN)
        REFERENCES Seller(SellSSN),
    CONSTRAINT Agent2FK FOREIGN KEY (AgentID)
        REFERENCES Agent1(AgID)
);



