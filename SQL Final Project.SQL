create database  Customer_Support_Ticketing_System;
USE Customer_Support_Ticketing_System;
show tables;

create table customers(
Customer_ID varchar(10) primary key,
First_Name varchar(45),
Last_Name varchar(45),
Email varchar(100),
Phone varchar(45),
Location varchar(45),
Created_Date datetime
);

create table department(
Department_ID int primary key,
Department_Name varchar(45)
);

create table support_agent(
Agent_ID varchar(10) primary key,
First_Name varchar(45),
Last_Name varchar(45),
Email varchar(100),
Phone varchar(45),
Department_ID int,
foreign key (Department_ID) references Department (Department_ID)
);

create table ticket(
Ticket_ID varchar(10) primary key,
Customer_ID  varchar(10),
Issue varchar(100),
Ticket_Status varchar(45),
severity_Level varchar(45),
Created_Date datetime,
Resolved_Date datetime,
Assigned_Agent_ID varchar(10),
foreign key (Customer_ID) references Customers(Customer_ID),
foreign key (Assigned_Agent_ID) references Support_Agent(Agent_ID)
);

create table communication_log(
Log_ID int primary key,
Ticket_ID  varchar(10),
Message varchar(100),
Sender_ID  varchar(10),
Status varchar(45),
Date datetime,
foreign key (Ticket_ID) references ticket(Ticket_ID),
foreign key (Sender_ID) references support_agent(Agent_ID)
);

insert into customers(Customer_ID, First_Name, Last_Name, Email, Phone, Location, Created_Date) values
('C01', 'James', 'Smith', 'smithjames@icloud.com', '212-989-1234', 'California', '2025-01-08 14:32:25'),
('C02', 'Emily', 'Johnson', 'Emily123@outlook.com', '212-223-1344', 'Texas', '2025-01-23 09:10:35'),
('C03', 'Michale', 'Brown', 'michalemichale@gmail.com', '212-355-1255', 'Florida', '2025-03-11 17:45:05'),
('C04', 'Sarah', 'Davis', 'sarah00@gmail.com', '212-655-1785', 'New York', '2025-02-07 08:22:10'),
('C05', 'David', 'Martinez', 'david110@gmail.com', '212-965-1455', 'Georgia', '2025-02-19 11:55:50'),
('C06', 'John', 'Michale', 'john0909@gmail.com', '416-555-9085', 'New York', '2025-03-25 13:25:40'),
('C07', 'David', 'Williams', 'williamsdavid@gmail.com', '223-665-1005', 'New York', '2025-01-30 15:12:30'),
('C08', 'Sarah', 'Davis', 'davissarah@icloud.com', '212-778-9985', 'Texas', '2025-04-02 10:00:00'),
('C09', 'Emily', 'David', 'emily@gmail.com', '222-997-5545', 'California', '2025-02-17 16:30:20'),
('C10', 'Lily', 'Hall', 'lilyhall@gmail.com', '212-997-6745', 'Tennessee', '2025-03-01 14:05:55'),
('C11', 'Jack', 'Baker', 'jack555@gmail.com', '222-997-6613', 'Colorado', '2025-01-13 12:10:30'),
('C12', 'Olivia', 'Moore', 'oliviaolivia@gmail.com', '222-886-8875', 'Tennessee', '2025-02-25 09:40:45'),
('C13', 'Benjamin', 'Harris', 'benjamin11@ooutlook.com', '416-997-5545', 'California', '2025-03-14 11:15:15'),
('C14', 'Johnson', 'Mark', 'johnjohn@icloud.com', '212-933-6795', 'Tennessee', '2025-01-28 18:27:30'),
('C15', 'Wish', 'Rathod', 'rathodwish@ooutlook.com', '212-090-8945', 'New York', '2025-02-02 21:45:10');

insert into department(Department_ID,Department_Name) values
(1001,'Technical support'),
(1002,'customer support'),
(1003,'Account specialist'),
(1004,'Returns & refunds');
 

insert into support_agent(Agent_ID,First_Name,Last_Name,Email,Phone,Department_ID) values
('A01','Abisheik','Bachan','abi@outlook.com',09898761288,1001),
('A02','Gowtham','Ram','ramgowtham@outlook.com',09994765651,1001),
('A03','Joseph','Edward','mohan00@outlook.com',09898765783,1002),
('A04','Ganesh','babu','babuganesh@outlook.com',09898671345,1002),
('A05','Tamil','selvan','tamil99@outlook.com',09812374567,1003),
('A06','Abdul','Sharuq','vimal@outlook.com',07709465738,1003),
('A07','Prakash','raj','rajprakash@gmail.com',09978785634,1003),
('A08','Murali','prakash','murali1010@outlook.com',09988209976,1003),
('A09','Santha','moorthy','moorthy@outlook.com',08803458910,1003),
('A10','Mohamad','Kadhar','santosh@outlook.com',08005007679,1004);

insert into ticket(Ticket_ID, Customer_ID, Issue, Ticket_Status, severity_Level, Created_Date, Resolved_Date, Assigned_Agent_ID) values
('T001', 'C01', 'Unable to login to account', 'Open', 'High', '2025-01-08 15:00:00', NULL, 'A01'),
('T002', 'C02', 'Account billing issues', 'Resolved', 'Medium', '2025-01-23 10:00:00', '2025-01-24 09:00:00', 'A03'),
('T003', 'C03', 'Lost password', 'Open', 'Low', '2025-03-11 18:00:00', NULL, 'A02'),
('T004', 'C04', 'Refund request', 'Open', 'High', '2025-02-07 09:30:00', NULL, 'A10'),
('T005', 'C05', 'Technical support needed', 'In Progress', 'High', '2025-02-19 12:00:00', NULL, 'A01'),
('T006', 'C06', 'Shipping issue with order', 'Resolved', 'Medium', '2025-03-25 14:00:00', '2025-03-26 12:00:00', 'A08'),
('T007', 'C07', 'Unable to process refund', 'In Progress', 'High', '2025-01-30 16:30:00', NULL, 'A10'),
('T008', 'C08', 'Account suspended', 'Open', 'High', '2025-04-02 10:30:00', NULL, 'A04'),
('T009', 'C09', 'Password reset not working', 'Open', 'Low', '2025-02-17 17:00:00', NULL, 'A02'),
('T010', 'C10', 'Order delivery delay', 'Resolved', 'Medium', '2025-03-01 15:30:00', '2025-03-02 14:45:00', 'A05'),
('T011', 'C11', 'Account verification issues', 'In Progress', 'High', '2025-01-13 13:15:00', NULL, 'A07'),
('T012', 'C12', 'Subscription renewal problem', 'Resolved', 'Medium', '2025-02-25 10:30:00', '2025-02-26 09:00:00', 'A06'),
('T013', 'C13', 'Unable to update account info', 'Resolved', 'Low', '2025-03-14 12:30:00', '2025-03-15 13:00:00', 'A08'),
('T014', 'C14', 'Account closure request', 'In Progress', 'High', '2025-01-28 18:00:00', NULL, 'A09'),
('T015', 'C15', 'Technical support request', 'Open', 'High', '2025-02-02 22:00:00', NULL, 'A01');

insert into communication_log(Log_ID, Ticket_ID, Message, Sender_ID, Status, Date)
 values
(1, 'T001', 'Customer reported login issue, unable to access account.', 'A01', 'Open', '2025-01-08 15:05:00'),
(2, 'T002', 'Resolved billing issue by correcting account charges.', 'A03', 'Resolved', '2025-01-24 09:05:00'),
(3, 'T003', 'Requested customer to reset their password using the reset link.', 'A02', 'Open', '2025-03-11 18:10:00'),
(4, 'T004', 'Refund request received, will be processed within 7 business days.', 'A10', 'Open', '2025-02-07 09:40:00'),
(5, 'T005', 'Customer is waiting for technical support response. Pending troubleshooting.', 'A01', 'In Progress', '2025-02-19 12:15:00'),
(6, 'T006', 'Shipping issue resolved, order delivered successfully.', 'A08', 'Resolved', '2025-03-26 12:15:00'),
(7, 'T007', 'Refund issue under review, waiting for approval from finance team.', 'A10', 'In Progress', '2025-01-30 17:00:00'),
(8, 'T008', 'Account suspended due to suspicious activity, awaiting verification.', 'A04', 'Open', '2025-04-02 10:45:00'),
(9, 'T009', 'Requested customer to try resetting their password again.', 'A02', 'Open', '2025-02-17 17:15:00'),
(10, 'T010', 'Delivery delay confirmed, customer informed about the revised delivery date.', 'A05', 'Resolved', '2025-03-02 14:50:00'),
(11, 'T011', 'Verified customer identity, account verification issues resolved.', 'A07', 'In Progress', '2025-01-13 13:30:00'),
(12, 'T012', 'Subscription renewal issue resolved, account reactivated.', 'A06', 'Resolved', '2025-02-26 09:15:00'),
(13, 'T013', 'Customer was informed about account update, issue resolved.', 'A08', 'Resolved', '2025-03-15 13:05:00'),
(14, 'T014', 'Account closure request under review, customer waiting for confirmation.', 'A09', 'In Progress', '2025-01-28 18:10:00'),
(15, 'T015', 'Customer requested technical support, troubleshooting in progress.', 'A01', 'Open', '2025-02-02 22:15:00');


-- Stored Procedures

-- 1. Insert a new customer
DELIMITER //
CREATE PROCEDURE InsertCustomer(
    IN cust_id VARCHAR(10),
    IN first_name VARCHAR(45),
    IN last_name VARCHAR(45),
    IN email VARCHAR(100),
    IN phone VARCHAR(45),
    IN location VARCHAR(45),
    IN created_date DATETIME
)
BEGIN
    INSERT INTO customers (Customer_ID, First_Name, Last_Name, Email, Phone, Location, Created_Date)
    VALUES (cust_id, first_name, last_name, email, phone, location, created_date);
END //
DELIMITER ;

CALL InsertCustomer('C16', 'John', 'Doe', 'john.doe@gmail.com', '123-456-7890', 'New York', NOW());

-- 2. Insert a new support agent
DELIMITER //
CREATE PROCEDURE InsertSupportAgent(
    IN agent_id VARCHAR(10),
    IN first_name VARCHAR(45),
    IN last_name VARCHAR(45),
    IN email VARCHAR(100),
    IN phone VARCHAR(45),
    IN dept_id INT
)
BEGIN
    INSERT INTO support_agent (Agent_ID, First_Name, Last_Name, Email, Phone, Department_ID)
    VALUES (agent_id, first_name, last_name, email, phone, dept_id);
END //
DELIMITER ;

CALL InsertSupportAgent ('A11','Gokul','Raj','gok@gmail.com',09996787887,1004);

-- 3. Get customer details by ID
DELIMITER //
CREATE PROCEDURE GetCustomerByID(IN cust_id VARCHAR(10))
BEGIN
    SELECT * FROM customers WHERE Customer_ID = cust_id;
END //
DELIMITER ;

-- 4. Get tickets by customer ID
DELIMITER //
CREATE PROCEDURE GetTicketsByCustomerID(IN cust_id VARCHAR(10))
BEGIN
    SELECT * FROM ticket WHERE Customer_ID = cust_id;
END //
DELIMITER ;

CALL GetTicketsByCustomerID('C01');

-- 5. Get support agent details by department ID
DELIMITER //
CREATE PROCEDURE GetAgentsByDepartmentID(IN dept_id INT)
BEGIN
    SELECT * FROM support_agent WHERE Department_ID = dept_id;
END //
DELIMITER ;

CALL GetAgentsByDepartmentID(1004);


-- 6. Get communication logs for a ticket
DELIMITER //
CREATE PROCEDURE GetCommunicationLogsForTicket(IN ticket_id1 VARCHAR(10))
BEGIN
    SELECT * FROM communication_log WHERE Ticket_ID = ticket_id1;
END //
DELIMITER ;

CALL GetCommunicationLogsForTicket('T005');

-- 7. Get Tickets by severity level
DELIMITER //
CREATE PROCEDURE GetTicketsBySeverity(IN sev_level VARCHAR(45))
BEGIN
    SELECT * FROM ticket WHERE severity_Level = sev_level;
END //
DELIMITER ;

CALL GetTicketsBySeverity('high');

-- 8. Get the number of tickets assigned to an agent
DELIMITER //
CREATE PROCEDURE GetTicketCountByAgent(IN agent_id VARCHAR(10))
BEGIN
    SELECT COUNT(*) AS TicketCount FROM ticket WHERE Assigned_Agent_ID = agent_id;
END //
DELIMITER ;

CALL GetTicketCountByAgent('A07');

-- 9. get all open tickets.
DELIMITER //
CREATE PROCEDURE GetOpenTickets()
BEGIN
    select * from ticket where Ticket_Status = 'Open';
END //
DELIMITER ;

CALL GetOpenTickets();

-- 10. Get all closed tickets.
DELIMITER //
CREATE PROCEDURE Get_Resolved_Tickets()
BEGIN
    select * from ticket where Ticket_Status = 'Resolved';
END //
DELIMITER ;

CALL Get_resolved_Tickets();

-- 11. get agent name, and department name by agent ID.
DELIMITER //
CREATE PROCEDURE Get_Agent_Details_By_AgentID(IN agent_id VARCHAR(10))
BEGIN
    select sa.First_Name, sa.Last_Name, d.Department_Name
    from support_agent sa
    join department d on sa.Department_ID = d.Department_ID
    where sa.Agent_ID = agent_id;
END //
DELIMITER ;

CALL Get_Agent_Details_By_AgentID();


