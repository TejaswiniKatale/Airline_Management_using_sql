CREATE TABLE AIRLINE
(AIRLINEID VARCHAR(3) NOT NULL,
ALNAME VARCHAR2(50),
THREE_DIG_CODE VARCHAR(3),
PRIMARY KEY(AIRLINEID));

-- Inserting values for Table: AIRLINE --

INSERT INTO AIRLINE VALUES('EK','Emirates','176');
INSERT INTO AIRLINE VALUES('EY','Etihad Airways','607');
INSERT INTO AIRLINE VALUES('AA','American Airlines','001');
INSERT INTO AIRLINE VALUES('AI','Air India Limited','098');
INSERT INTO AIRLINE VALUES('LH','Lufthansa', '220');
INSERT INTO AIRLINE VALUES('BA','British Airways','125');
INSERT INTO AIRLINE VALUES('QR','Qatar Airways','157');
INSERT INTO AIRLINE VALUES('GA','Gulf Air','589');

CREATE TABLE FLIGHT
(FLIGHT_CODE VARCHAR(10) NOT NULL,
SOURCE VARCHAR(3),
DESTINATION VARCHAR(3),
ARRIVAL VARCHAR2(10),
DEPARTURE VARCHAR2(10),
STATUS VARCHAR(10),
DURATION VARCHAR2(30),
FLIGHTTYPE VARCHAR(10),
LAYOVER_TIME VARCHAR2(30),
NO_OF_STOPS INT,
AIRLINEID VARCHAR(3),
PRIMARY KEY(FLIGHT_CODE),
FOREIGN KEY(AIRLINEID) REFERENCES AIRLINE(AIRLINEID) ON DELETE CASCADE);

-- Inserting values for Table: FLIGHT --

INSERT INTO FLIGHT VALUES('QR2305','BOM','DFW','13:00','13:55','Delayed','21hr','Non-stop',0,0,'QR');
INSERT INTO FLIGHT VALUES('EY1234','AUH','BAH','19:20','20:05','On-time','1hrs','Direct',5,2,'EY');
INSERT INTO FLIGHT VALUES('LH9876','JFK','BOM','05:50','06:35','On-time','18hrs','Non-stop',0,0,'LH');
INSERT INTO FLIGHT VALUES('BA1689','FRA','DEL','10:20','10:55','On-time','14hrs','Non-stop',0,0,'BA');
INSERT INTO FLIGHT VALUES('QR1902','IXC','IAH','22:00','22:50','Delayed','28hrs','Non-stop',5,1,'QR');
INSERT INTO FLIGHT VALUES('BA3056','BOM','DXB','02:15','02:55','On-time','3hrs','Connecting',3,1,'BA');
INSERT INTO FLIGHT VALUES('EK3456','BOM','SFO','18:50','19:40','On-time','30hrs','Non-stop',0,0,'EK');
INSERT INTO FLIGHT VALUES('GA2334','AUH','DEL','23:00','13:45','On-time','4hrs','Direct',0,0,'GA');
INSERT INTO FLIGHT VALUES('GA2227','BAH','AUH','02:30','02:00','On-time','1.5hrs','Direct',0,0,'GA');

CREATE TABLE CITY
(CNAME VARCHAR2(15) NOT NULL,
STATE VARCHAR2(15), 
COUNTRY VARCHAR(30),
PRIMARY KEY(CNAME));

INSERT INTO CITY VALUES ('Abu Dhabi','Abu Dhabi','UAE');
INSERT INTO CITY VALUES('Manama','Bahrain','Bahrain');
INSERT INTO CITY VALUES('Mumbai','Maharashtra','India');
INSERT INTO CITY VALUES('Dubai', 'Dubai', 'UAE');
INSERT INTO CITY VALUES('Frankfurt','Hesse','Germany');
INSERT INTO CITY VALUES('Houston','Texas','United States');
INSERT INTO CITY VALUES ('Pune','Maharashtra','India');

CREATE TABLE AIRPORT
(APNAME VARCHAR2(100) NOT NULL,
STATE VARCHAR2(15), 
COUNTRY VARCHAR(30),
CNAME VARCHAR2(15),
PRIMARY KEY(APNAME),
FOREIGN KEY(CNAME) REFERENCES CITY(CNAME));

INSERT INTO AIRPORT VALUES('Abu Dhabi International Airport','Abu Dhabi','UAE','Abu Dhabi');
INSERT INTO AIRPORT VALUES('Bahrain International Airport','Bahrain','Bahrain','Manama');
INSERT INTO AIRPORT VALUES('Chhatrapati Shivaji International Airport','Maharashtra','India','Mumbai');
INSERT INTO AIRPORT VALUES('Dubai International Airport','Dubai','UAE','Dubai');
INSERT INTO AIRPORT VALUES('Frankfurt Airport','Hesse','Germany','Frankfurt');
INSERT INTO AIRPORT VALUES('George Bush Intercontinental Airport','Texas','United States','Houston');

CREATE TABLE PASSENGER
(PID INT NOT NULL,
PASSPORTNO VARCHAR(10) NOT NULL,
FNAME VARCHAR2(20),
LNAME VARCHAR2(20),
ADDRESS VARCHAR2(100),
PHONE INT,
AGE INT,
SEX VARCHAR(1),
PRIMARY KEY(PID, PASSPORTNO));

INSERT INTO PASSENGER VALUES(1,'A1234568','JUWAIRIA','SAYYED','HAMDAN STREET, APT 1101, ABU DHABI, UAE',8080367290,26,'F');
INSERT INTO PASSENGER VALUES(2,'B9876541','HAMZA','KARANI','GUDAYBIYAH, APT 202, MANAMA, BAHRAIN',8080367280,26,'M');
INSERT INTO PASSENGER VALUES(3,'C2345698','TEJASWINI','KATALE','3456 VIKAS APTS, APT 102,DOMBIVLI, INDIA',8082267280,30,'F');
INSERT INTO PASSENGER VALUES(4,'D1002004','SAMUEL','SCHRUTE','7720 MCCALLUM BLVD, APT 1082, DALLAS, TX',9080367266,23,'F');
INSERT INTO PASSENGER VALUES(5,'X9324666','ADITYARAJ','PATIL','9082 ESTAES OF RICHARDSON, RICHARDSON, TX',9004360125,28,'M');
INSERT INTO PASSENGER VALUES(6,'B8765430','KATHANI','SHARMA','1110 FIR HILLS, APT 903, AKRON, OH',7666190505,30,'F');
INSERT INTO PASSENGER VALUES(7,'J9801235','ANTHONY','BRIDGERTON','345 CHATHAM COURTS, APT 678, MUMBAI, INDIA',9080369290,29,'M');
INSERT INTO PASSENGER VALUES(8,'A1122334','RUSSO','LLEYTON','539 CHANDELIER STREET, APT 349 HOUSTON, TX',9004335126,25,'M');
INSERT INTO PASSENGER VALUES(9, 'Q1243567','KARAN','MOTANI','4444 FRANKFORD VILLA, APT 77, GUILDERLAND, NY',9727626643,22,'M');
INSERT INTO PASSENGER VALUES(10, 'S1243269','ELOISE','SHARPE','7720 MCCALLUM BLVD, APT 2087, DALLAS, TX',9004568903,21,'F');
INSERT INTO PASSENGER VALUES(11, 'E3277889','JIM','HALPERT','64 THE GARDENS, APT 59, DUBAI, UAE',9724569986,34,'M');
INSERT INTO PASSENGER VALUES(12, 'K3212322','PAM','BEASELY','63 DISCOVERY GARDENS, APT 34, DUBAI, UAE',9024569226,33,'F');
INSERT INTO PASSENGER VALUES(13, 'P3452390','RABIA','KHALID','86 MARKET PLACE, RIFA, BAHRAIN',9734567800,18,'F');
INSERT INTO PASSENGER VALUES(14, 'W7543336','RITA','ORA','6666 ROCK HILL, APT 2902, TAMPA, FL',4624569986,55,'F');
INSERT INTO PASSENGER VALUES(15, 'R8990566','SHEFALI','RAO','3355 PALENCIA, APT 2065, MUMBAI, INDIA',4724512343,10,'F');

CREATE TABLE PASSENGER_FLIGHT_DETAILS
(PID INT NOT NULL,
FLIGHT_CODE VARCHAR(10),
PRIMARY KEY(PID),
FOREIGN KEY(FLIGHT_CODE) REFERENCES FLIGHT(FLIGHT_CODE) ON DELETE CASCADE);

INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(1,'EY1234');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(2,'GA2227');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(3,'GA2334');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(4,'QR1902');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(5,'EY1234');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(6,'BA3056');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(7,'QR2305');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(8,'LH9876');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(9,'QR1902');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(10,'EK3456');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(11,'BA1689');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(12,'QR1902');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(13,'EK3456');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(14,'GA2334');
INSERT INTO PASSENGER_FLIGHT_DETAILS VALUES(15,'LH9876');

CREATE TABLE TICKET
(TICKET_NUMBER INT NOT NULL,
FLIGHT_CODE VARCHAR(10) NOT NULL,
SOURCE VARCHAR(3),
DESTINATION VARCHAR(3),
DATE_OF_BOOKING DATE,
DATE_OF_CANCELLATION DATE,
DATE_OF_TRAVEL DATE,
SEATNO VARCHAR(5),
CLASS VARCHAR2(15),
PRICE INT,
PID INT,
PASSPORTNO VARCHAR(10),
FOREIGN KEY(FLIGHT_CODE) REFERENCES FLIGHT(FLIGHT_CODE),
FOREIGN KEY(PID, PASSPORTNO) REFERENCES PASSENGER(PID, PASSPORTNO) ON DELETE CASCADE);

INSERT INTO TICKET VALUES(0011234111122,'QR2305','BOM','DFW','11-MAY-16','','15-DEC-16','32A','ECONOMY',876, 7,'J9801235');
INSERT INTO TICKET VALUES(0984567222299,'LH9876','JFK','BOM','11-JUN-16','10-DEC-16','20-DEC-16','45D', 'ECONOMY',453, 15,'R8990566');
INSERT INTO TICKET VALUES(1768901333273,'GA2334','AUH','DEL','21-AUG-16','','25-DEC-16','1A','BUSINESS',2400, 3,'C2345698');
INSERT INTO TICKET VALUES(2206543545545,'BA3056','BOM','DXB','11-NOV-16','','12-FEB-17','43B','ECONOMY', 253, 6,'B8765430');
INSERT INTO TICKET VALUES(7064321779737,'EY1234','AUH','BAH','15-NOV-16','','25-DEC-16','27B','FIRST-CLASS', 3100, 1,'A1234568');
INSERT INTO TICKET VALUES(1579283997799,'EK3456','BOM','SFO','22-JAN-16','','15-DEC-16','38A','ECONOMY', 325, 10,'S1243269');
INSERT INTO TICKET VALUES(1255701876107,'BA1689','FRA','DEL','19-OCT-16','','31-DEC-16','57F','ECONOMY', 430, 11,'E3277889');
INSERT INTO TICKET VALUES(1251334499699,'QR1902','IXC','IAH','20-NOV-16','','12-JAN-17','45D','ECONOMY', 500, 12,'K3212322');
INSERT INTO TICKET VALUES(5891155114477,'GA2334','AUH','DEL','26-JUN-16','','23-DEC-16','55C','ECONOMY', 640, 14,'W7543336');
INSERT INTO TICKET VALUES(5893069766787,'GA2227','BAH','AUH','11-AUG-16','','22-DEC-16','33F','ECONOMY', 520, 2,'B9876541');

CREATE TABLE CANCELLATION
(DATE_OF_CANCELLATION DATE NOT NULL,
SURCHARGE INT,
PRIMARY KEY(DATE_OF_CANCELLATION));

INSERT INTO CANCELLATION VALUES('10-DEC-16',75000);
INSERT INTO CANCELLATION VALUES('25-MAY-16',25000);

---------------------------------------------------------------
SELECT * FROM AIRPORT;
SELECT * FROM CITY;
SELECT * FROM AIRLINE;
SELECT * FROM FLIGHT;
SELECT * FROM PASSENGER;
SELECT * FROM PASSENGER_FLIGHT_DETAILS;
SELECT * FROM TICKET;
SELECT * FROM CANCELLATION;

---------------------------------------------------------------

--To display all red eye flights and their count
SELECT * from FLIGHT where DEPARTURE between '00:00' and '04:00' and ARRIVAL BETWEEN '02:00' AND '07:00';

--To display the city receiving the maximum number of flights.
select DESTINATION
from FLIGHT 
group by DESTINATION 
having count(*)=(select max(c) from (select count(*) c 
                       from FLIGHT 
                       group by DESTINATION)a
               );
--To display flights with no of bookings
select FLIGHT_CODE,count(*) NO_OF_BOOKINGS from FLIGHT group by FLIGHT_CODE;

--To display the passenger (name only) who booked ticket on the same day of flight 
select p.FNAME||p.LNAME,t.FLIGHT_CODE from passenger p,ticket t
where t.DATE_OF_TRAVEL=t.DATE_OF_BOOKING and t.PID=p.PID;
 
--To display flights w duration of 10 hours or more
select f.FLIGHT_CODE, t.DATE_OF_TRAVEL, f.SOURCE, f.DESTINATION, f.DURATION from 
FLIGHT f right join TICKET t on f.FLIGHT_CODE= t.FLIGHT_CODE where f.DURATION like '_____' ;

--To display all mid eastern flights
select a.ALNAME,count(f.FLIGHT_CODE) as MIDDLE_EAST_AIRS
from FLIGHT f left join AIRLINE a on
a.AIRLINEID=f.AIRLINEID 
where a.AIRLINEID in ('EY','EK','QR','GA') group by a.ALNAME;

select FNAME, LNAME ,AGE from PASSENGER order by AGE;

--To display the number of flights flying from each location
select SOURCE, count(FLIGHT_CODE) as NUMBER_OF_FLIGHTS
from FLIGHT group by SOURCE;

--To display the average cost of the tickets in each flight on all scheduled dates
select f.FLIGHT_CODE, round((avg(t.PRICE)),2) as average_price  FROM
FLIGHT f ,TICKET t WHERE f.FLIGHT_CODE= t.FLIGHT_CODE group by f.FLIGHT_CODE;

--To label flights acc to timing
select f.FLIGHT_CODE, f.SOURCE, f.DESTINATION, f.DEPARTURE, f.ARRIVAL, 
case 
    when f.DEPARTURE between '05:00' and '12:00' then 'Morning'
    when f.DEPARTURE between '12:00' and '18:00' then 'Afternoon'
    when f.DEPARTURE between '18:00' and '22:00' then 'Evening' 
    else 'Night' 
end
from FLIGHT f;

--To label passengers based on their age
SELECT p.PID,p.FNAME,p.LNAME,p.PHONE,p.AGE,
case
    WHEN (AGE<18) THEN 
        'Underaged passenger on-board, assistance required for '
    WHEN (AGE>55) THEN
        'Senior citizen on-baord, assitance required for '
    ELSE 'Okay to board'
END
FROM PASSENGER p;

--To store procedure for flight details by status
CREATE OR REPLACE PROCEDURE FLIGHTSBYSTATUS 
(
  IN_STATUS IN VARCHAR2
) AS 
 
CURSOR fSTATUS is
select  distinct f.FLIGHT_CODE ,al.ALNAME ,f.ARRIVAL,f.DEPARTURE,f.SOURCE,f.DESTINATION,f.STATUS,f.FLIGHTTYPE from Airline al ,Airport ap,flight f
where al.AIRLINEID=f.AIRLINEID
and  f.STATUS =IN_STATUS;
 
FlightStatus fSTATUS%rowtype;
  
BEGIN
  Open fSTATUS ;
   LOOP
    fetch fSTATUS into FlightStatus;
     EXIT WHEN fSTATUS%NOTFOUND;
   dbms_output.put_line (FlightStatus.FLIGHT_CODE || '  ' || FlightStatus.ALNAME || '  ' || FlightStatus.ARRIVAL || '  ' || FlightStatus.departure|| '  ' ||FlightStatus.Source || '  ' || FlightStatus.DESTINATION || '  ' || FlightStatus.STATUS || '  ' || FlightStatus.FLIGHTTYPE);
   
    END LOOP;
     close fSTATUS;
END FLIGHTSBYSTATUS;
/

SET SERVEROUT ON 
exec FLIGHTSBYSTATUS('Delayed');
-- or--
SET SERVEROUT ON 
exec FLIGHTSBYSTATUS('On-time');


--Trigger for cancelled flights
CREATE OR REPLACE TRIGGER CANCELLED 
AFTER INSERT ON FLIGHT 
FOR EACH ROW 
DECLARE

BEGIN
    if updating('STATUS')
    then
       insert into CANCELLED_FLIGHTS (FLIGHT_CODE, SOURCE, DESTINATION , AIRLINEID ,report_time) values(:new.flight_code,:new.source,:new.destination,:new.airlineid,sysdate);
end if;
 
END;
/

 CREATE TABLE "CANCELLED_FLIGHTS" 
   (           "FLIGHT_CODE" VARCHAR2(20 BYTE), 
                "DESTINATION" VARCHAR2(20 BYTE), 
                "SOURCE" VARCHAR2(20 BYTE), 
                "AIRLINEID" VARCHAR2(20 BYTE), 
                "REPORT_TIME" DATE
   );
 

INSERT INTO FLIGHT VALUES('EY1234','SFO','FRA','12:10','23:30','Cancelled','11hr','Non-stop',0,0,'EY');

