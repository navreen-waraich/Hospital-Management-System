CODE:
CREATE TABLE Patient(
email varchar(50) PRIMARY KEY,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL,
address varchar(60) NOT NULL,
gender VARCHAR(20) NOT NULL
);

CREATE TABLE MedicalHistory(
id int PRIMARY KEY,
med_date DATE NOT NULL,
conditions VARCHAR(100) NOT NULL, 
surgeries VARCHAR(100) NOT NULL, 
medication VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor(
email varchar(50) PRIMARY KEY,
gender varchar(20) NOT NULL,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL
);

CREATE TABLE Appointment(
id int PRIMARY KEY,
app_date DATE NOT NULL,
starttime TIMESTAMP NOT NULL,
endtime TIMESTAMP NOT NULL,
status varchar(15) NOT NULL
);

CREATE TABLE PatientsAttendAppointments(
patient varchar(50) NOT NULL,
appt int NOT NULL,
concerns varchar(40) NOT NULL,
symptoms varchar(40) NOT NULL,
FOREIGN KEY (patient) REFERENCES Patient (email) ON DELETE CASCADE,
FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
PRIMARY KEY (patient, appt)
);

CREATE TABLE Schedule(
id int NOT NULL,
starttime TIMESTAMP NOT NULL,
endtime  TIMESTAMP NOT NULL,
breaktime TIMESTAMP NOT NULL,
day varchar(20) NOT NULL,
PRIMARY KEY (id, starttime, endtime, breaktime, day)
);

CREATE TABLE PatientsFillHistory(
patient varchar(50) NOT NULL,
history int NOT NULL,
FOREIGN KEY (patient) REFERENCES Patient (email) ON DELETE CASCADE,
FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
PRIMARY KEY (history)
);

CREATE TABLE Diagnose(
appt int NOT NULL,
doctor varchar(50) NOT NULL,
diagnosis varchar(40) NOT NULL,
prescription varchar(50) NOT NULL,
FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
PRIMARY KEY (appt, doctor)
);

CREATE TABLE DoctorViewsHistory(
history int NOT NULL,
doctor varchar(50) NOT NULL,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
PRIMARY KEY (history, doctor)
);
INSERT INTO Patient VALUES ('ramesh@gmail.com','Pass123','Ramesh','Tamil Nadu', 'male');
INSERT INTO Patient VALUES('suresh@gmail.com','Pass123','Suresh','Karnataka', 'male');
INSERT INTO Patient VALUES('rakesh@gmail.com','Pass123','Rakesh','Gujarat', 'male');
INSERT INTO Patient VALUES('subhash@gmail.com','Pass123','Subhash','Delhi', 'male');
INSERT INTO Patient VALUES('pari@gmail.com','Pass123','Pari','Mumbai', 'female');
INSERT INTO Patient VALUES('aastha@gmail.com','Pass123','Aastha','Haryana', 'female');
INSERT INTO Patient VALUES('prashant@gmail.com','Pass123','Prashant','Himachal', 'male');
INSERT INTO Patient VALUES('ananya@gmail.com','Pass123','Ananya','Himachal', 'female');
INSERT INTO Patient VALUES('girish@gmail.com','Pass123','Girish','Punjab', 'male');
INSERT INTO Patient VALUES('nimrat@gmail.com','Pass123','Nimrat','Punjab', 'female');

INSERT INTO MedicalHistory VALUES(1,'21-jun-19','Pain in abdomen','Heart Surgery','Crocin');
INSERT INTO MedicalHistory VALUES(2,'21-apr-21','Frequent Indigestion','none','none');
INSERT INTO MedicalHistory VALUES(3,'21-jan-20','Body Pain','none','Iodex');
INSERT INTO MedicalHistory VALUES(4,'21-apr-12','Pain in upper abdomen','none','Meftal P');
INSERT INTO MedicalHistory VALUES(5,'21-jul-09','Backpain','none ','Ibuprofen');
INSERT INTO MedicalHistory VALUES(6,'21-jan-07','Vertigo','none','Cinnarizine');
INSERT INTO MedicalHistory VALUES(7,'21-jul-26','Headache','Brain surgery','Eptoin');
INSERT INTO MedicalHistory VALUES(8,'21-aug-19','Covid','none','HCQ');
INSERT INTO MedicalHistory VALUES(9,'21-jan-04','Swollen Lymphnodes','none','Azithromycin');
INSERT INTO MedicalHistory VALUES(10,'21-feb-14','ACL tear','Knee surgery','Tylenol');

INSERT INTO Doctor VALUES('parambir2@gmail.com', 'male', 'Pass123', 'Parambir Singh');
INSERT INTO Doctor VALUES('klair88@gmail.com', 'male', 'Pass123', 'Klair');
INSERT INTO Doctor VALUES('asabharwal@gmail.com', 'male', 'Pass123', 'Ashish Sabharwal');
INSERT INTO Doctor VALUES('sanjay9@gmail.com', 'male', 'Pass123', 'Sanjay Sachdeva');
INSERT INTO Doctor VALUES('sandeepbatra@gmail.com', 'male', 'Pass123', 'Sandeep Batra');

INSERT INTO Appointment VALUES(1, To_date('19-jan-15','DD-MM-YY'), '09:00', '10:00', 'Done');
INSERT INTO Appointment VALUES(2, To_date('19-jan-16','DD-MM-YY'), '10:00', '11:00', 'Done');
INSERT INTO Appointment VALUES(3, To_date('19-jan-18','DD-MM-YY'), '14:00', '15:00', 'Done');
INSERT INTO Appointment VALUES(4, To_date('19-jan-15','DD-MM-YY') , '08:00', '09:00', 'Done');
INSERT INTO Appointment VALUES(5, To_date('19-jan-16','DD-MM-YY'), '11:00', '12:00', 'Done');
INSERT INTO Appointment VALUES(6, To_date('19-jan-18','DD-MM-YY'), '15:00', '16:00', 'Done');
INSERT INTO Appointment VALUES(7, To_date('19-jan-15','DD-MM-YY'), '12:00', '13:00', 'Done');
INSERT INTO Appointment VALUES(8, To_date('19-jan-16','DD-MM-YY'), '17:00', '19:00', 'Done');
INSERT INTO Appointment VALUES(9, To_date('19-jan-18','DD-MM-YY'), '16:00', '17:00', 'Done');
INSERT INTO Appointment VALUES(10,To_date('19-jan-18','DD-MM-YY'), '19:00', '21:00', 'Done');

INSERT INTO PatientsAttendAppointments VALUES('ramesh@gmail.com',1, 'none', 'itchy throat');
INSERT INTO PatientsAttendAppointments VALUES('suresh@gmail.com',2, 'infection', 'fever');
INSERT INTO PatientsAttendAppointments VALUES('rakesh@gmail.com',3, 'nausea', 'fever');
INSERT INTO PatientsAttendAppointments VALUES('subhash@gmail.com',4, 'none', 'dizziness');
INSERT INTO PatientsAttendAppointments VALUES('pari@gmail.com',5, 'body weakness', 'tiredness');
INSERT INTO PatientsAttendAppointments VALUES('aastha@gmail.com',6, 'none', 'dizziness');
INSERT INTO PatientsAttendAppointments VALUES('prashant@gmail.com',7, 'none', 'headache');
INSERT INTO PatientsAttendAppointments VALUES('ananya@gmail.com',8, 'severe concern', 'high fever');
INSERT INTO PatientsAttendAppointments VALUES('girish@gmail.com',9, 'none', 'itchy throat');
INSERT INTO PatientsAttendAppointments VALUES('nimrat@gmail.com',10, 'knee pain', 'knee weakness');

INSERT INTO Schedule VALUES(001,'09:00','17:00','12:00','Tuesday');
INSERT INTO Schedule VALUES(001,'09:00','17:00','12:00','Friday');
INSERT INTO Schedule VALUES(002,'09:00','17:00','12:00','Saturday');
INSERT INTO Schedule VALUES(002,'09:00','17:00','12:00','Tuesday');
INSERT INTO Schedule VALUES(002,'09:00','17:00','12:00','Wednesday');
INSERT INTO Schedule VALUES(003,'09:00','17:00','12:00','Friday');
INSERT INTO Schedule VALUES(003,'09:00','17:00','12:00','Wednesday');
INSERT INTO Schedule VALUES(004,'09:00','17:00','12:00','Friday');
INSERT INTO Schedule VALUES(005,'09:00','17:00','12:00','Wednesday');
INSERT INTO Schedule VALUES(005,'09:00','17:00','12:00','Monday');
INSERT INTO Schedule VALUES(005,'09:00','17:00','12:00','Wednesday');
INSERT INTO Schedule VALUES(005,'09:00','17:00','12:00','Friday');

INSERT INTO PatientsFillHistory VALUES('ramesh@gmail.com', 1);
INSERT INTO PatientsFillHistory VALUES('suresh@gmail.com', 2);
INSERT INTO PatientsFillHistory VALUES('rakesh@gmail.com', 3);
INSERT INTO PatientsFillHistory VALUES('subhash@gmail.com',4);
INSERT INTO PatientsFillHistory VALUES('pari@gmail.com',5);
INSERT INTO PatientsFillHistory VALUES('aastha@gmail.com',6);
INSERT INTO PatientsFillHistory VALUES('prashant@gmail.com',7);
INSERT INTO PatientsFillHistory VALUES('ananya@gmail.com',8);
INSERT INTO PatientsFillHistory VALUES('girish@gmail.com',9);
INSERT INTO PatientsFillHistory VALUES('nimrat@gmail.com',10);

INSERT INTO Diagnose VALUES(1,'parambir2@gmail.com', 'Bloating', 'Ibuprofen as needed');
INSERT INTO Diagnose VALUES(2,'klair88@gmail.com', 'Muscle soreness', 'Stretch morning/night');
INSERT INTO Diagnose VALUES(3,'sanjay9@gmail.com', 'Vitamin Deficiency', 'Good Diet');
INSERT INTO Diagnose VALUES(4,'hathalye7@gmail.com', 'Bloating', 'Ibuprofen as needed');
INSERT INTO Diagnose VALUES(5,'asabharwal@gmail.com', 'Weakness', 'Stretch morning/night');
INSERT INTO Diagnose VALUES(6,'sanjay9@gmail.com', 'Dizziness', 'Good Diet');
INSERT INTO Diagnose VALUES(7,'sandeepbatra@gmail.com', 'Anxiety', 'Disprin');
INSERT INTO Diagnose VALUES(8,'klair88@gmail.com', 'High fever', 'Rest/Vaccine');
INSERT INTO Diagnose VALUES(9,'asabharwal@gmail.com', 'Vitamin Deficiency', 'Junk food prevention');
INSERT INTO Diagnose VALUES(10,'sandeepbatra@gmail.com', 'Vitamin Deficiency', 'Exercise/Cycling');

INSERT INTO DoctorViewsHistory VALUES(1,'parambir2@gmail.com');
INSERT INTO DoctorViewsHistory VALUES(2,'klair88@gmail.com');
INSERT INTO DoctorViewsHistory VALUES(3,'parambir2@gmail.com');
INSERT INTO DoctorViewsHistory VALUES(4,'klair88@gmail.com');
INSERT INTO DoctorViewsHistory VALUES(5,'sandeepbatra@gmail.com');
INSERT INTO DoctorViewsHistory VALUES(6,'parambir2@gmail.com');
INSERT INTO DoctorViewsHistory VALUES(7,'sandeepbatra@gmail.com');
INSERT INTO DoctorViewsHistory VALUES(8,'asabharwal@gmail.com');
INSERT INTO DoctorViewsHistory VALUES(9,'sanjay9@gmail.com');
INSERT INTO DoctorViewsHistory VALUES(10,'sanjay9@gmail.com');












select* from Doctor;
update Doctor set password=1234 where email='parambir2@gmail.com';
select name ,password from Doctor;

delete from Doctor where name='Parambir Singh';
select* from Doctor;

ALTER TABLE doctor ADD age number;

ALTER TABLE doctor DROP COLUMN gender;
select* from doctor;

ALTER TABLE doctor 
ADD CONSTRAINT MyUniqueConstraint UNIQUE(password, name);

ALTER TABLE doctor
DROP CONSTRAINT MyUniqueConstraint;

drop table doctor ;





















CREATE OR REPLACE FUNCTION trigger1()
  RETURNS trigger AS
$BODY$
BEGIN
 IF gender='not say' THEN
 INSERT INTO Patient VALUES(email,password,name,address,'none');
 END IF;
 RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;


