create database db_lmsp;
use db_lmsp;


CREATE TABLE tbl_Library_Branch
(
    BranchId INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- primary key column
    Branch_Name [NVARCHAR](50) NOT NULL,
    [Address] [NVARCHAR](50) NOT NULL
    -- specify more columns here
);

CREATE TABLE tbl_Borrower
(
    CardNo INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- primary key column
    [Name] [NVARCHAR](50) NOT NULL,
    [Address] [NVARCHAR](50) NOT NULL,
    Phone [NVARCHAR](50) NOT NULL
    -- specify more columns here
);

CREATE TABLE tbl_Publisher
(
    PublisherName [NVARCHAR](50) NOT NULL PRIMARY KEY, -- primary key column
    [Address] [NVARCHAR](50) NOT NULL,
    Phone [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
--cant drop this table tbl_Books
CREATE TABLE tbl_Books
(
    BookId INT PRIMARY KEY IDENTITY (1,1), -- primary key column
    Title [NVARCHAR](50) NOT NULL,
    PublisherName [NVARCHAR](50) FOREIGN KEY REFERENCES tbl_Publisher(PublisherName)
    -- specify more columns here
);

CREATE TABLE tbl_Book_Authors
(
    BookID INT FOREIGN KEY REFERENCES tbl_Books(BookID),
	AuthorName [NVARCHAR](50) NOT NULL -- primary key column
    
    -- specify more columns here
);
--drop table tbl_Book_Copies;
CREATE TABLE tbl_Book_Copies
(
    BookID INT FOREIGN KEY REFERENCES tbl_Books(BookID),
    BranchID INT FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID), 
    Number_of_Copies INT NOT NULL 
    -- specify more columns here
);

CREATE TABLE tbl_Book_Loans
(
    BookID INT NOT NULL FOREIGN KEY REFERENCES tbl_Books(BookID),
    BranchID INT NOT NULL FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID),
    DateOut [NVARCHAR](50),
    DateDue [NVARCHAR](50)
    -- specify more columns here
);

SELECT * FROM tbl_Borrower;
SELECT * FROM tbl_Publisher;
SELECT * FROM tbl_Book_Authors;
SELECT * FROM tbl_Books;
SELECT * FROM tbl_Book_Loans;
SELECT * FROM tbl_Book_Copies;
SELECT * FROM tbl_Library_Branch;

INSERT INTO tbl_Library_Branch (Branch_Name, [Address])
    VALUES ('Sharpstown', '123 Broadway st'),
           ('Old town Library', '345 34th ave se'),
           ('Bridgeport Library', '741  Asylum Avenue'),
           ('Cynthiana', '15  Carson Street'),
           ('Bloomingdale', '4684  Sugarfoot Lane'),
           ('Philadelphia', '357  Linda Street')
;

INSERT INTO tbl_Borrower ([Name], [Address], Phone)
    VALUES
        ('John Smith', '7564 makken st', '202-555-0192'),
        ('Betty White', '3342 Onion dr', '404-555-0181'),
        ('Tom Petty', '668 orion ct place', '404-555-0182'),
        ('Kathy R Wiebe', '35  Hamill Avenue', '619-794-2299'),
        ('Brenda E Cartagena', '1060  Platinum Drive', '724-803-3730'),
        ('Kimberly M Aviles', '2500  Peck Street', '603-915-9158'),
        ('Margaret M Vu', '1530  Ward Road', '914-217-8062'),
        ('Richard G Tews', '3325  Kembery Drive', '331-216-5161')
;

INSERT INTO tbl_Publisher (PublisherName, [Address], Phone)
    VALUES
        ('Brainy Publications', '2353 Walnut Drive', '701-430-9967'),
        ('Ink n Paper Press', '779 Hilltop Haven Drive', '973-792-4225'),
        ('Wordsmith Literature', '1147 Larry Street', '414-792-3670'),
        ('Big Idea Publishers', '1504 Rosebud Avenue', '870-400-1527'),
        ('Profound Printings', '1273 Williams Avenue', '661-291-0633'),
        ('Pensive Lines', '1274 Parker Drive', '216-559-7463'),
        ('Whisked Away Publishing', '3286 Bird Street', '505-595-6454'),
        ('Sunny Day Press', '3600 Maxwell Farm Road', '530-953-7585'),
        ('Eloquent Tales', '3826 Big Elm', '816-202-9394'),
        ('Bookworm Publishing House', '1087 Selah Way', '802-551-4273')
;


INSERT INTO tbl_Books (Title, PublisherName)
    VALUES
        ('The Lost tribe', 'Brainy Publications'),
        ('Spider the Phoenix', 'Ink n Paper Press'),
        ('A Pickpockets Lady', 'Wordsmith Literature'),
        ('Different Babies', 'Wordsmith Literature'),
        ('Fringe of Exposure', 'Big Idea Publishers'),
        ('Floating Wings', 'Profound Printings'),
        ('The Boy in the Window', 'Pensive Lines'),
        ('A Song in the Mirror', 'Pensive Lines'),
        ('A Whisker of Dawn', 'Whisked Away Publishing'),
        ('Scourge of the Heretic', 'Sunny Day Press'),
        ('A Learning Conflict', 'Eloquent Tales'),
        ('Monster of the Bride', 'Bookworm Publishing House'),
        ('A Vision in Flight', 'Profound Printings'),
        ('Rx for Vendetta', 'Bookworm Publishing House'),
        ('The Hospital in London', 'Whisked Away Publishing'),
        ('The Danger of Shame', 'Profound Printings'),
        ('The Cottage of Correction', 'Profound Printings'),
        ('Seduction and Judgment', 'Brainy Publications'),
        ('Dire Alliances', 'Brainy Publications'),
        ('The Map of the Vampire', 'Brainy Publications')
;

INSERT INTO tbl_Book_Authors (BookID, AuthorName)
    VALUES
        (1, 'Jeffery Beach'),
        (2, 'Guy Adam'),
        (3, 'Fardeen Salt'),
        (4, 'Rumaysa Mcbride'),
        (4, 'Rumaysa Mcbride'),
        (4, 'Rumaysa Mcbride'),
        (5, 'Wilbur Mccann'),
        (5, 'Wilbur Mccann'),
        (6, 'Simran Kirkpatrick'),
        (6, 'Simran Kirkpatrick')
;

INSERT INTO tbl_Book_Copies  (BookID, BranchID, Number_of_Copies)
    VALUES
       (1, 1, 3),
	   (2, 1, 2),
	   (3, 1, 5),
	   (4, 2, 10),
	   (5, 2, 2),
	   (6, 2, 7),
	   (7, 3, 6),
	   (8, 3, 7),
	   (9, 3, 2),
	   (10, 4, 15),
	   (11, 4, 12),
	   (12, 4, 9),
	   (13, 5, 3),
	   (14, 5, 4),
	   (15, 5, 8),
	   (16, 6, 8),
	   (17, 6, 8),
	   (18, 6, 10),
	   (19, 6, 4),
	   (20, 6, 5)
;

INSERT INTO tbl_Book_Loans (BookID, BranchID, DateOut, DateDue)
	VALUES	
		(1, 1, '2020-12-20', '2021-01-20'),
		(1, 1, '2021-01-10', '2021-02-10'),
		(5, 3, '2021-01-10', '2021-02-10'),
		(18, 3, '2021-01-22', '2021-02-22'),
		(18, 4, '2021-01-26', '2021-02-26'),
		(14, 6, '2021-02-15', '2021-03-15'),
		(3, 6, '2021-02-23', '2021-03-23'),
		(7, 5, '2021-02-26', '2021-03-26'),
		(9, 1, '2021-02-26', '2021-03-26'),
		(13, 1, '2021-01-29', '2021-02-28')
;
