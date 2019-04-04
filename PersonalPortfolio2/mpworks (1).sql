
--
-- Table structure for table  employee 
--
drop database if exists mp
go

create database mp
go

use mp
go

CREATE TABLE  employee  (
   employeeID  int NOT NULL,
   first_name  varchar(255) NOT NULL,
   last_name  varchar(255) NOT NULL
) 


-- --------------------------------------------------------

--
-- Table structure for table  history 
--

CREATE TABLE  history  (
   visitor_id  int NOT NULL,
   employeeID  int NOT NULL,
   notes  varchar(255) NOT NULL
) 


--

CREATE TABLE  visitor  (
   visitor_id  int NOT NULL identity,
   visitor_name  varchar(50) NOT NULL,
   visitor_email  varchar(50) NOT NULL,
   visitor_msg  varchar(200) NOT NULL
)



