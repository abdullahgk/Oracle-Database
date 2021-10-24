CREATE USER odev identified by oracle;
--kullanýcý adý odev sýfresý oracle olan bir kullanýcý olusturalým
GRANT ALL PRIVILEGES TO odev;
--bu kullanýcýya tüm yetkleri verelim 
CREATE table ACCOUNT
( account_number varchar2(5) NOT NULL,
  branch_name varchar2(50) NOT NULL,
  balance number(10)
);
CREATE table BRANCH
( branch_name varchar2(10) NOT NULL,
  branch_city varchar2(50) NOT NULL,
  assets number(20)
);
CREATE table CUSTOMER
( customer_name varchar2(20) NOT NULL,
  customer_street varchar2(50) NOT NULL,
  customer_city varchar2(20) NOT NULL
);
CREATE table LOAN
( loan_number varchar2(5) NOT NULL,
  branch_name varchar2(50) NOT NULL,
  amount number(10)
);
CREATE table BORROWER
( customer_name varchar2(50) NOT NULL,
  loan_number varchar2(10)
);
CREATE table DEPOSITOR
( customer_name varchar2(50) NOT NULL,
  account_number varchar2(10)
);
--tablolarý ve veri tiplerini olusturduk 
--sýmdý tablolarýn içini dolduralým
--ama once tablolarýmýzdan birinin olusup olusmadýgýný kontrol edelým
SELECT * FROM LOAN;
--OLUSTUGUNU GORDUKTEN SONRA SIRASIYLA TABLOLARI DOLDURALIM
INSERT INTO ACCOUNT VALUES('A-101','Downtown','500');
INSERT INTO ACCOUNT VALUES('A-102','Perryridge','400');
INSERT INTO ACCOUNT VALUES('A-201','Brighton','900');
INSERT INTO ACCOUNT VALUES('A-215','Mianus','700');
INSERT INTO ACCOUNT VALUES('A-217','Brighton','750');
INSERT INTO ACCOUNT VALUES('A-222','Redwood','700');
INSERT INTO ACCOUNT VALUES('A-305','Round Hill','350');
--DEGERLERÝ KONTROL EDELÝM
SELECT * FROM ACCOUNT;
INSERT INTO BRANCH VALUES('Brighton','Brooklyn','7100000');
INSERT INTO BRANCH VALUES('Downtown','Brooklyn','9000000');
INSERT INTO BRANCH VALUES('Mianus','Horseneck','400000');
INSERT INTO BRANCH VALUES('North Town','Rye','3700000');
INSERT INTO BRANCH VALUES('Perryridge','Horseneck','1700000');
INSERT INTO BRANCH VALUES('Pownal','Bennington','300000');
INSERT INTO BRANCH VALUES('Redwood','Palo Alto','2100000');
INSERT INTO BRANCH VALUES('Round Hill','Horseneck','8000000');
--DEGERLERÝ KONTROL EDELÝM
SELECT * FROM BRANCH;
--tek tek her satýr ýcýn ýnsert ýnto kullanmak yerýne tek kodla yazalým
INSERT ALL INTO CUSTOMER VALUES ('Adams','Spring','Pittsfield')
INTO CUSTOMER VALUES('Brooks','Senator','Brooklyn')
INTO CUSTOMER VALUES ('Curry','North','Rye')
INTO CUSTOMER VALUES ('Glenn','Sand Hill','Woodside')
INTO CUSTOMER VALUES ('Hayes','Main','Harrison')
INTO CUSTOMER VALUES ('Johnson','Alma','Palo Alto')
INTO CUSTOMER VALUES ('Jones','Main','Harrison')
INTO CUSTOMER VALUES ('Lindsay','Park','Pittsfield')
INTO CUSTOMER VALUES ('Smith','North','Rye')
INTO CUSTOMER VALUES ('Turner','Putnam','Stamford')
INTO CUSTOMER VALUES ('Williams','Nassau','Princeton')
SELECT * FROM DUAL;
SELECT * FROM CUSTOMER;
--verileri kontrol ettikten sonra devam edelim
INSERT ALL INTO LOAN VALUES ('L-11','Round Hill','900')
INTO LOAN VALUES('L-14','Downtown','1500')
INTO LOAN VALUES ('L-15','Perryridge','1500')
INTO LOAN VALUES ('L-16','Perryridge','1300')
INTO LOAN VALUES ('L-17','Downtown','1000')
INTO LOAN VALUES ('L-23','Redwood','2000')
INTO LOAN VALUES ('L-93','Mianus','500')
SELECT * FROM DUAL;
--kontrol
SELECT * FROM LOAN;
--DEVAM
INSERT ALL INTO BORROWER VALUES ('Adams','L-16')
INTO BORROWER VALUES('Curry','L-93')
INTO BORROWER VALUES ('Hayes','L-15')
INTO BORROWER VALUES ('Jackson','L-14')
INTO BORROWER VALUES ('Jones','L-17')
INTO BORROWER VALUES ('Smith','L-11')
INTO BORROWER VALUES ('Smith','L-23')
INTO BORROWER VALUES ('Williams','L-17')
SELECT * FROM DUAL;
SELECT * FROM BORROWER;
INSERT ALL INTO DEPOSITOR VALUES ('Hayes','A-102')
INTO DEPOSITOR VALUES('Johnson','A-101')
INTO DEPOSITOR VALUES ('Johnson','A-201')
INTO DEPOSITOR VALUES ('Jones','A-217')
INTO DEPOSITOR VALUES ('Lindsay','A-222')
INTO DEPOSITOR VALUES ('Smith','A-215')
INTO DEPOSITOR VALUES ('Turner','A-305')
SELECT * FROM DUAL;
SELECT * FROM DEPOSITOR;

--TABLOLAR VE VERILERI OLUSTURDUKTAN SONRA ISTENEN SORGULARI YAZALIM
SELECT * FROM DEPOSITOR
 INNER JOIN ACCOUNT ON DEPOSITOR.account_number = ACCOUNT.account_number WHERE ACCOUNT.balance>500;

SELECT  BORROWER.customer_name ,ACCOUNT.balance ,ACCOUNT.branch_name account_branch,LOAN.amount loan_amount,LOAN.branch_name loan_branch,(balance-amount) toplam_varlik_durumu FROM LOAN LEFT JOIN BORROWER ON LOAN.loan_number=BORROWER.loan_number
LEFT JOIN ACCOUNT ON LOAN.branch_name=ACCOUNT.branch_name WHERE BALANCE>0;

SELECT branch_name,assets FROM BRANCH WHERE assets IN(SELECT MAX(assets) FROM BRANCH);
SELECT * FROM BRANCH;
