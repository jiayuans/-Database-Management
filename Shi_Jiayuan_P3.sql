/*CS579 Project Part 3
Jiayuan Shi*/

CREATE TABLE PERSON
            (SSN                              CHAR (9)              NOT NULL,
             Name                          VARCHAR (15)             NOT NULL,      
             Phone                           CHAR (10),
             Address                        VARCHAR (30),
             Employer                        VARCHAR (15)           NOT NULL,      
             Insurer                      VARCHAR (15)              NOT NULL, 
            PRIMARY KEY (SSN),
            CONSTRAINT PERSON_FK1 FOREIGN KEY (Employer) REFERENCES EMPLOYER(Name)
            ON DELETE SET NULL,
            CONSTRAINT PERSON_FK2 FOREIGN KEY (Insurer) REFERENCES INSURER(Name)
            ON DELETE SET NULL);
CREATE TABLE PHYSICIAN
            (PID                      CHAR (9)                        NOT NULL,
             Name                   VARCHAR (15)             NOT NULL,      
             Phone                  CHAR (10),
             Address                 VARCHAR (30),
             Specialty             VARCHAR (15),         
            PRIMARY KEY (PID));
CREATE TABLE VISIT
            (V_date                            DATE                 NOT NULL,
             PCP_or_not                      CHAR(1),      
             Diagnosis                     VARCHAR(30),              
             PID                               CHAR(9)                  NOT NULL,
             SSN                          CHAR(9)                  NOT NULL,
            PRIMARY KEY (V_date),
            FOREIGN KEY (SSN) REFERENCES PERSON(SSN)
            ON DELETE SET NULL, 
            FOREIGN KEY (PID) REFERENCES PHYSICIAN(PID)
            ON DELETE SET NULL);
CREATE TABLE CLAIM
            (CID                             CHAR (9)                        NOT NULL,
             Amount                       DECIMAL (10, 2),
             File_Date                      DATE,
             Paid_Date                     DATE,
             V_date                          DATE                 NOT NULL,
             SSN                          CHAR (9)              NOT NULL,
             PID                               CHAR (9)                  NOT NULL,
             Insurer                      VARCHAR (15)             NOT NULL, 
            PRIMARY KEY (CID),
            FOREIGN KEY (PID) REFERENCES PHYSICIAN (PID) ON DELETE SET NULL,
            FOREIGN KEY (V_date) REFERENCES VISIT (V_date) ON DELETE SET NULL,
            FOREIGN KEY (SSN) REFERENCES PERSON (SSN) ON DELETE SET NULL,
            FOREIGN KEY (Insurer) REFERENCES INSURER (Name) ON DELETE SET NULL);
CREATE TABLE EMPLOYER
            (Name                           VARCHAR (15)           NOT NULL,      
             Phone                           CHAR (10),
             Address                        VARCHAR (30),
            PRIMARY KEY (Name));
CREATE TABLE INSURER
            (Name                           VARCHAR (15)             NOT NULL,      
             Phone                           CHAR (10),
             Address                        VARCHAR (30),
            PRIMARY KEY (Name));
CREATE TABLE HOSPITAL
            (Name                         VARCHAR (9)             NOT NULL,
             Phone                         CHAR (10),
             Address                       VARCHAR (30),
            PRIMARY KEY (Name));
CREATE TABLE EMP_INSURER
            (Emp_name                  VARCHAR (15)           NOT NULL,
             Ins_name                   VARCHAR (15)           NOT NULL,
            PRIMARY KEY (Emp_name, Ins_name),
            FOREIGN KEY (Emp_name) REFERENCES EMPLOYER (Name) ON DELETE SET NULL,
            FOREIGN KEY (Ins_name) REFERENCES INSURER (Name) ON DELETE SET NULL);
CREATE TABLE PHY_INSURER
            (PID                        CHAR (9)                      NOT NULL,
             Ins_name                   VARCHAR (15)           NOT NULL,
            PRIMARY KEY (PID, Ins_name),
            FOREIGN KEY (PID) REFERENCES PHYSICIAN (PID) ON DELETE SET NULL,
            FOREIGN KEY (Ins_name) REFERENCES INSURER (Name) ON DELETE SET NULL);
CREATE TABLE AFFILIATION
            (PID                        CHAR (9)                  NOT NULL,
             Hospital_name                 VARCHAR (15)           NOT NULL,
            PRIMARY KEY (PID, Hospital_name),
            FOREIGN KEY (PID) REFERENCES PHYSICIAN (PID) ON DELETE SET NULL,
            FOREIGN KEY (Hospital_name) REFERENCES HOSPITAL (Name) ON DELETE SET NULL);

INSERT INTO PERSON
VALUES ('123456789', 'John', '6532986534', '7 Fondren, Houston, TX', 'Franklin', 'Lexington');
INSERT INTO PERSON
VALUES ('223456789', 'Richard', '3454365563', '638 Voss, Houston, TX', 'Robert', 'Lexington');
INSERT INTO PERSON
VALUES ('323456789', 'Amy', '3465578980', '5631 Rice, Houston, TX', 'Alicia', 'Safety');
INSERT INTO PERSON
VALUES ('423456789', 'Lily', '2357687842', '980 Dallas, Houston, TX', 'Franklin', 'Lexington');
INSERT INTO PERSON
VALUES ('523456789', 'Lucy', '1384759248', '975 Fire Oak, Humble, TX', 'Jennifer', 'Safety');
INSERT INTO PERSON
VALUES ('623456789', 'Tom', '3457392082', '3321 Castle, Spring, TX', 'Robert', 'Central');
INSERT INTO PERSON
VALUES ('723456789', 'Tim', '1347392049', '450 Stone, Houston, TX', 'Franklin', 'Lexington');
INSERT INTO PERSON
VALUES ('823456789', 'Jack', '2345375839', '11 Royce, Humble, TX', 'Jennifer', 'Mutual');
INSERT INTO PERSON
VALUES ('923456789', 'Peter', '9998764254', '88 Broad, Houston, TX', 'Joyce', 'Mutual');
INSERT INTO PERSON
VALUES ('133456789', 'Julia', '9374766253', '6357 Windy Lane, Katy, TX', 'Cecilia', 'National');

INSERT INTO PHYSICIAN
VALUES ('094343243', 'Adam', '2342431212', '6333 Mercer, Houston, TX', 'Genetics');
INSERT INTO PHYSICIAN
VALUES ('094546356', 'Rachel', '1929830029', '3114 Tangley, Houston, TX', 'Neurology');
INSERT INTO PHYSICIAN
VALUES ('094452657', 'Rain', '9283746625', '4524 Oakdale, Bellaire, TX', 'Surgery');
INSERT INTO PHYSICIAN
VALUES ('094654343', 'Ida', '1828765430', '4807 Pin, Houston, TX', 'Neurology');
INSERT INTO PHYSICIAN
VALUES ('094099584', 'Tabby', '8765467789', '4234 Drake, Houston, TX', 'Psychiatry');
INSERT INTO PHYSICIAN
VALUES ('094432453', 'Val', '3232888222', '33 Robin, Houston, TX', 'Physical');
INSERT INTO PHYSICIAN
VALUES ('094434355', 'Bacon', '9809653421', '6416 Sewanee, Houston, TX', 'Physical');
INSERT INTO PHYSICIAN
VALUES ('094543452', 'Fai', '8765467898', '3779 Elmora, Houston, TX', 'Medicine');
INSERT INTO PHYSICIAN
VALUES ('094305690', 'Dado', '5242154367', '5249 Glenmont, Houston, TX', 'Pediatrics');
INSERT INTO PHYSICIAN
VALUES ('094034222', 'Kael', '9876798754', '5401 Rampart, Houston, TX', 'Pediatrics');

INSERT INTO VISIT
VALUES (to_date('2013-04-05','yyyy-mm-dd'), 'Y', 'Fever', '094543452', '123456789');
INSERT INTO VISIT
VALUES (to_date('2013-04-01','yyyy-mm-dd'), 'Y', 'Asthma', '094432453', '133456789');
INSERT INTO VISIT
VALUES (to_date('2013-03-25','yyyy-mm-dd'),'N','Fever','094543452','423456789');
INSERT INTO VISIT
VALUES (to_date('2013-08-11','yyyy-mm-dd'), 'Y', 'Physical examination', '094432453', '723456789');
INSERT INTO VISIT
VALUES (to_date('2013-04-15','yyyy-mm-dd'),'N', 'Anxiety disorder', '094099584', '823456789');
INSERT INTO VISIT
VALUES (to_date('2013-07-23','yyyy-mm-dd'), 'Y', 'Colectomy', '094452657', '923456789');
INSERT INTO VISIT
VALUES (to_date('2013-09-01','yyyy-mm-dd'), 'N', 'Coma', '094546356', '523456789');
INSERT INTO VISIT
VALUES (to_date('2013-03-14','yyyy-mm-dd'), 'Y', 'Strep throatStrep throat', '094034222', '323456789');
INSERT INTO VISIT
VALUES (to_date('2013-03-08','yyyy-mm-dd'), 'Y', 'Genetic testing', '094654343', '623456789');
INSERT INTO VISIT
VALUES (to_date('2013-02-15','yyyy-mm-dd'), 'Y', 'Dysarthria', '094343243', '623456789');
INSERT INTO VISIT
VALUES (to_date('2013-02-10','yyyy-mm-dd'), 'Y', 'Dysarthria', '094343243', '623456789');
INSERT INTO VISIT
VALUES (to_date('2013-09-26','yyyy-mm-dd'), 'Y', 'Dysarthria', '094343243', '223456789');

INSERT INTO CLAIM
VALUES ('928637129', '200', to_date('2013-05-05','yyyy-mm-dd'), to_date('2013-05-06','yyyy-mm-dd'), to_date('2013-04-05','yyyy-mm-dd'), '123456789', '094543452', 'Lexington');
INSERT INTO CLAIM
VALUES ('928374321', '100', to_date('2013-04-11','yyyy-mm-dd'), to_date('2013-04-20','yyyy-mm-dd'), to_date('2013-03-08','yyyy-mm-dd'), '623456789', '094654343', 'Central');
INSERT INTO CLAIM
VALUES ('928932487', '700', to_date('2013-03-20','yyyy-mm-dd'), to_date('2013-03-25','yyyy-mm-dd'), to_date('2013-03-14','yyyy-mm-dd'), '323456789', '094034222', 'Safety');
INSERT INTO CLAIM
VALUES ('329713147', '200', to_date('2013-02-12','yyyy-mm-dd'), to_date('2013-02-21','yyyy-mm-dd'), to_date('2013-02-10','yyyy-mm-dd'), '623456789', '094343243', 'Central');
INSERT INTO CLAIM
VALUES ('922313147', '100', to_date('2013-02-27','yyyy-mm-dd'), to_date('2013-03-04','yyyy-mm-dd'), to_date('2013-02-15','yyyy-mm-dd'), '623456789', '094343243', 'Central');
INSERT INTO CLAIM
VALUES ('928892347', '300', to_date('2013-10-5','yyyy-mm-dd'), NULL, to_date('2013-09-26','yyyy-mm-dd'), '223456789', '094343243', 'Lexington');
INSERT INTO CLAIM
VALUES ('928238292', '250', to_date('2013-04-17','yyyy-mm-dd'), to_date('2013-04-26','yyyy-mm-dd'), to_date('2013-04-15','yyyy-mm-dd'), '823456789', '094099584', 'Mutual');
INSERT INTO CLAIM
VALUES ('928324843', '50', to_date('2013-09-30','yyyy-mm-dd'), to_date('2013-10-02','yyyy-mm-dd'), to_date('2013-09-01','yyyy-mm-dd'), '523456789', '094546356', 'Safety');
INSERT INTO CLAIM
VALUES ('928232343', '90', to_date('2013-08-19','yyyy-mm-dd'), to_date('2013-08-29','yyyy-mm-dd'), to_date('2013-08-11','yyyy-mm-dd'), '723456789', '094432453', 'Lexington');
INSERT INTO CLAIM
VALUES ('928324324', '350', to_date('2013-04-25','yyyy-mm-dd'), to_date('2013-04-25','yyyy-mm-dd'), to_date('2013-03-25','yyyy-mm-dd'), '423456789', '094543452', 'Lexington');
INSERT INTO CLAIM
VALUES ('928234232', '600', to_date('2013-07-29','yyyy-mm-dd'), to_date('2013-08-24','yyyy-mm-dd'), to_date('2013-07-23','yyyy-mm-dd'), '923456789', '094452657', 'Mutual');
INSERT INTO CLAIM
VALUES ('928304903', '100', to_date('2013-04-30','yyyy-mm-dd'), NULL, to_date('2013-04-01','yyyy-mm-dd'), '133456789', '094432453', 'National');

INSERT INTO EMPLOYER
VALUES ('Franklin', '7268279081', '562 Rice, Houston, TX');
INSERT INTO EMPLOYER
VALUES ('Cecilia', '8827262517', '1 Castle, Spring, TX');
INSERT INTO EMPLOYER
VALUES ('Joyce', '9928764621', '4 Rice, Houston, TX');
INSERT INTO EMPLOYER
VALUES ('Jennifer', '9386255172', '92 Fire Oak, Humble, TX');
INSERT INTO EMPLOYER
VALUES ('Alicia', '9275316723', '38 Voss, Houston, TX');
INSERT INTO EMPLOYER
VALUES ('Robert', '8276351622', '20 Fondren, Houston, TX');

INSERT INTO INSURER
VALUES ('Lexington', '7263279081', '592 Rice, Houston, TX');
INSERT INTO INSURER
VALUES ('Central', '7262272081', '2 Texas, Houston, TX');
INSERT INTO INSURER
VALUES ('Safety', '7261272081', '92 Rusk, Houston, TX');
INSERT INTO INSURER
VALUES ('National', '7268229080', '42 Baker, Houston, TX');
INSERT INTO INSURER
VALUES ('Mutual', '1268219081', '17 Dallas, Houston, TX');

INSERT INTO HOSPITAL
VALUES ('Joseph', '1323279081', '522 Joseph, Houston, TX');
INSERT INTO HOSPITAL
VALUES ('Cornerstone', '2462272081', '432 Hermann, Houston, TX');
INSERT INTO HOSPITAL
VALUES ('Kindred', '7232472054', '11 Main, Houston, TX');
INSERT INTO HOSPITAL
VALUES ('Methodist', '5582293430', '9 Katy, Houston, TX');
INSERT INTO HOSPITAL
VALUES ('West', '1254319543', '42 Richmond, Houston, TX');
INSERT INTO HOSPITAL
VALUES ('Willowbrook', '2448219531', '765 State, Houston, TX');
INSERT INTO HOSPITAL
VALUES ('Park', '6668219325', '3242 Hermann, Houston, TX');
INSERT INTO HOSPITAL
VALUES ('Children', '3254219564', '22 Fannin, Houston, TX');

INSERT INTO EMP_INSURER
VALUES ('Franklin', 'Lexington');
INSERT INTO EMP_INSURER
VALUES ('Franklin', 'Safety');
INSERT INTO EMP_INSURER
VALUES ('Alicia', 'Central');
INSERT INTO EMP_INSURER
VALUES ('Jennifer', 'Central');
INSERT INTO EMP_INSURER
VALUES ('Robert', 'Lexington');
INSERT INTO EMP_INSURER
VALUES ('Joyce', 'Safety');
INSERT INTO EMP_INSURER
VALUES ('Robert', 'National');
INSERT INTO EMP_INSURER
VALUES ('Cecilia', 'Mutual');

INSERT INTO PHY_INSURER
VALUES ('094343243', 'Lexington');
INSERT INTO PHY_INSURER
VALUES ('094546356', 'Safety');
INSERT INTO PHY_INSURER
VALUES ('094343243', 'Central');
INSERT INTO PHY_INSURER
VALUES ('094099584', 'Central');
INSERT INTO PHY_INSURER
VALUES ('094034222', 'Lexington');
INSERT INTO PHY_INSURER
VALUES ('094305690', 'Safety');
INSERT INTO PHY_INSURER
VALUES ('094452657', 'National');
INSERT INTO PHY_INSURER
VALUES ('094452657', 'Mutual');
INSERT INTO PHY_INSURER
VALUES ('094099584', 'Lexington');
INSERT INTO PHY_INSURER
VALUES ('094543452', 'Safety');
INSERT INTO PHY_INSURER
VALUES ('094434355', 'National');
INSERT INTO PHY_INSURER
VALUES ('094432453', 'Mutual');
INSERT INTO PHY_INSURER
VALUES ('094654343', 'Central');
INSERT INTO PHY_INSURER
VALUES ('094432453', 'National');
INSERT INTO PHY_INSURER
VALUES ('094654343', 'Mutual');

INSERT INTO AFFILIATION
VALUES ('094434355','Joseph');
INSERT INTO AFFILIATION
VALUES ('094432453','Cornerstone');
INSERT INTO AFFILIATION
VALUES ('094305690','Cornerstone');
INSERT INTO AFFILIATION
VALUES ('094099584','Kindred');
INSERT INTO AFFILIATION
VALUES ('094543452','Methodist');
INSERT INTO AFFILIATION
VALUES ('094654343','West');
INSERT INTO AFFILIATION
VALUES ('094452657','Willowbrook');
INSERT INTO AFFILIATION
VALUES ('094546356','Park');
INSERT INTO AFFILIATION
VALUES ('094343243','Children');
INSERT INTO AFFILIATION
VALUES ('094034222','Children');
INSERT INTO AFFILIATION
VALUES ('094654343', 'Park');

/*a*/
SELECT PI.Ins_name 
FROM PHY_INSURER PI, PHYSICIAN P
WHERE P.Name='Rain' AND P.PID=PI.PID;

/*b*/
SELECT V.V_date, V.PCP_or_not, V.Diagnosis, PHY.Name
FROM VISIT V, PERSON P, PHYSICIAN PHY
WHERE V.SSN=P.SSN AND PHY.PID=V.PID AND P.Name='Tom' AND V_date 
BETWEEN to_date('2013-01-01','yyyy-mm-dd') AND to_date('2013-03-31','yyyy-mm-dd');

/*c*/
SELECT EI.Ins_name
FROM PERSON P, EMP_INSURER EI, EMPLOYER E
WHERE P.Employer=E.Name AND EI.Emp_name=E.Name AND P.Name='John';

/*d*/
SELECT *
FROM CLAIM
WHERE Paid_date IS NULL;
