
-- 1. AUTHOR TABLE
CREATE TABLE Author (
    Author_ID INT PRIMARY KEY AUTO_INCREMENT,
    Last_Name VARCHAR(50) NOT NULL,
    First_Name VARCHAR(50),
    Nationality VARCHAR(50)
);

-- 2. PUBLISHER TABLE
CREATE TABLE Publisher (
    Publisher_ID INT PRIMARY KEY AUTO_INCREMENT,
    Publisher_Name VARCHAR(50) NOT NULL,
    Country VARCHAR(50)
);

-- 3. CATEGORY TABLE
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(50) NOT NULL,
    Description TEXT
);

-- 4. BOOK TABLE (CORE TABLE)
CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author_ID INT NOT NULL,
    Publisher_ID INT NOT NULL,
    Category_ID INT NOT NULL,
    Publication_Year INT,
    Available_Quantity INT DEFAULT 0,
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

-- 5. MEMBER TABLE
CREATE TABLE Member (
    Member_ID INT PRIMARY KEY AUTO_INCREMENT,
    Last_Name VARCHAR(50) NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(50),
    Registration_Date DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Active'
);

-- 6. LOAN TABLE
CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    Loan_Date DATE NOT NULL,
    Due_Date DATE NOT NULL,
    Return_Date DATE,
    Status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

-- 7. RESERVATION TABLE
CREATE TABLE Reservation (
    Reservation_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    Reservation_Date DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

-- 8. PENALTY TABLE
CREATE TABLE Penalty (
    Penalty_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_ID INT NOT NULL,
    Loan_ID INT NOT NULL,
    Reason VARCHAR(100) NOT NULL,
    Amount DECIMAL(10,2),
    Penalty_Date DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Unpaid',
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID)
);

