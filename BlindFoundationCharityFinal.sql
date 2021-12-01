CREATE SCHEMA IF NOT EXISTS BlindFoundationDB;
use BlindFoundationDB;

CREATE TABLE Admin ( ID INT NOT NULL, name INT NOT NULL, password INT NOT NULL, PRIMARY KEY (ID) );

CREATE TABLE Reports ( report_ID INT NOT NULL, totalContributions INT NOT NULL, totalExpenditures INT NOT NULL, ID INT NOT NULL, PRIMARY KEY (report_ID), FOREIGN KEY (ID) REFERENCES Admin(ID) );

CREATE TABLE expenditure ( Total_price INT NOT NULL, Expense_ID INT NOT NULL, Expense_name INT NOT NULL, Type INT NOT NULL, Expense_Data INT NOT NULL, Event_Name INT NOT NULL, PRIMARY KEY (Expense_ID) );

CREATE TABLE Programs ( Program_ID INT NOT NULL, Description INT NOT NULL, Program_Name INT NOT NULL, PRIMARY KEY (Program_ID) );

CREATE TABLE Employees ( empid INT NOT NULL, name INT NOT NULL, password INT NOT NULL, job_site INT NOT NULL, responsibility INT NOT NULL, phone_number INT NOT NULL, Expense_ID INT NOT NULL, PRIMARY KEY (empid), FOREIGN KEY (Expense_ID) REFERENCES expenditure(Expense_ID) );

CREATE TABLE Contributions ( Project_id INT NOT NULL, donation_amount INT NOT NULL, donation_date INT NOT NULL, donation_ID INT NOT NULL, PRIMARY KEY (donation_ID) );

CREATE TABLE Contributors ( firstname INT NOT NULL, contributor_id INT NOT NULL, phone_number INT NOT NULL, adress_number INT NOT NULL, Street INT NOT NULL, City INT NOT NULL, Zipcode INT NOT NULL, email INT NOT NULL, Region INT NOT NULL, Race INT NOT NULL, PRIMARY KEY (contributor_id) );

CREATE TABLE Handle ( Program_ID INT NOT NULL, empid INT NOT NULL, PRIMARY KEY (Program_ID, empid), FOREIGN KEY (Program_ID) REFERENCES Programs(Program_ID), FOREIGN KEY (empid) REFERENCES Employees(empid) );

CREATE TABLE obtains ( empid INT NOT NULL, donation_ID INT NOT NULL, PRIMARY KEY (empid, donation_ID), FOREIGN KEY (empid) REFERENCES Employees(empid), FOREIGN KEY (donation_ID) REFERENCES Contributions(donation_ID) );

CREATE TABLE forward ( Program_ID INT NOT NULL, donation_ID INT NOT NULL, PRIMARY KEY (Program_ID, donation_ID), FOREIGN KEY (Program_ID) REFERENCES Programs(Program_ID), FOREIGN KEY (donation_ID) REFERENCES Contributions(donation_ID) );

CREATE TABLE obtained ( donation_ID INT NOT NULL, contributor_id INT NOT NULL, PRIMARY KEY (donation_ID, contributor_id), FOREIGN KEY (donation_ID) REFERENCES Contributions(donation_ID), FOREIGN KEY (contributor_id) REFERENCES Contributors(contributor_id) );

CREATE TABLE Fundraiser_Events ( Fundraiser_ID INT NOT NULL, description INT NOT NULL, Fundraiser_name INT NOT NULL, date INT NOT NULL, ID INT NOT NULL, Expense_ID INT NOT NULL, PRIMARY KEY (Fundraiser_ID), FOREIGN KEY (ID) REFERENCES Admin(ID), FOREIGN KEY (Expense_ID) REFERENCES expenditure(Expense_ID) );

CREATE TABLE Programs_FundraisingEvents ( Fundraiser_ID INT NOT NULL, Program_ID INT NOT NULL, PRIMARY KEY (Fundraiser_ID, Program_ID), FOREIGN KEY (Fundraiser_ID) REFERENCES Fundraiser_Events(Fundraiser_ID), FOREIGN KEY (Program_ID) REFERENCES Programs(Program_ID) );