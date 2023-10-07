DROP DATABASE project;

CREATE DATABASE project;

USE project;

CREATE TABLE admin ( password BLOB NOT NULL )ENGINE = InnoDB;

INSERT INTO admin VALUES ( SHA1('admin'));

CREATE TABLE enroll_for (degree varchar(5) NOT NULL, course varchar(30) NOT NULL) ENGINE = InnoDB;


CREATE TABLE patient ( roll_no integer PRIMARY KEY, name varchar(50) NOT NULL, password BLOB NOT NULL, email_id varchar(255) NOT NULL, degree varchar(5) NOT NULL, course varchar(30) NOT NULL, year integer NOT NULL, is_approved BOOLEAN DEFAULT false,  CONSTRAINT CHK_year CHECK (year BETWEEN 1 AND 3)) ENGINE = InnoDB;


CREATE TABLE doctor ( name varchar(20) NOT NULL, username varchar(50) NOT NULL, password BLOB NOT NULL, email_id varchar(255) NOT NULL, degree varchar(5) NOT NULL, course varchar(30) NOT NULL, year integer NOT NULL, subject varchar(50) primary key, is_approved BOOLEAN DEFAULT false, CONSTRAINT CHK_doctor_year CHECK (year BETWEEN 1 AND 3)) ENGINE = InnoDB;
