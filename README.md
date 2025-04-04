 Customer Support Ticket Management System
Overview:

This project implements a database schema and a set of stored procedures for a customer support ticket management system. The system tracks customers, support agents, departments, tickets, and communication logs. It allows for efficient management of customer issues, assignment of tickets to agents, and tracking of communication related to each ticket.

Database Schema:

The database final_project consists of five tables:

customers: Stores customer information.

Customer_ID (VARCHAR(10), PRIMARY KEY): Unique identifier for each customer.
First_Name (VARCHAR(45)): Customer's first name.
Last_Name (VARCHAR(45)): Customer's last name.
Email (VARCHAR(100)): Customer's email address.
Phone (VARCHAR(45)): Customer's phone number.
Location (VARCHAR(45)): Customer's location.
Created_Date (DATETIME): Date and time when the customer record was created.
department: Stores department information.

Department_ID (INT, PRIMARY KEY): Unique identifier for each department.
Department_Name (VARCHAR(45)): Name of the department.
support_agent: Stores support agent information.

Agent_ID (VARCHAR(10), PRIMARY KEY): Unique identifier for each support agent.
First_Name (VARCHAR(45)): Support agent's first name.
Last_Name (VARCHAR(45)): Support agent's last name.
Email (VARCHAR(100)): Support agent's email address.
Phone (VARCHAR(45)): Support agent's phone number.
Department_ID (INT, FOREIGN KEY referencing department): Department to which the support agent belongs.
ticket: Stores ticket information.

Ticket_ID (VARCHAR(10), PRIMARY KEY): Unique identifier for each ticket.
Customer_ID (VARCHAR(10), FOREIGN KEY referencing customers): Customer who created the ticket.
Issue (VARCHAR(100)): Description of the issue.
Ticket_Status (VARCHAR(45)): Current status of the ticket (e.g., Open, In Progress, Closed).
severity_Level (VARCHAR(45)): Severity level of the issue (e.g., High, Medium, Low).
Created_Date (DATETIME): Date and time when the ticket was created.
Resolved_Date (DATETIME): Date and time when the ticket was resolved (NULL if not resolved).
Assigned_Agent_ID (VARCHAR(10), FOREIGN KEY referencing support_agent): Support agent assigned to the ticket.
communication_log: Stores communication logs for each ticket.

Log_ID (INT, PRIMARY KEY): Unique identifier for each communication log entry.
Ticket_ID (VARCHAR(10), FOREIGN KEY referencing ticket): Ticket associated with the communication.
Message (VARCHAR(100)): Content of the communication.
Sender_ID (VARCHAR(10), FOREIGN KEY referencing support_agent): Sender of the communication (support agent).
Status (VARCHAR(45)): Status of the communication (e.g., Sent, Received).
Date (DATETIME): Date and time of the communication.
Stored Procedures:

The project includes 15 stored procedures to perform various operations on the database:

InsertCustomer: Inserts a new customer record.
InsertDepartment: Inserts a new department record.
InsertSupportAgent: Inserts a new support agent record.
InsertTicket: Inserts a new ticket record.
InsertCommunicationLog: Inserts a new communication log entry.
GetCustomerByID: Retrieves customer details by Customer_ID.
GetTicketsByCustomerID: Retrieves tickets associated with a specific Customer_ID.
GetAgentsByDepartmentID: Retrieves support agents belonging to a specific Department_ID.
UpdateTicketStatus: Updates the status of a ticket.
GetCommunicationLogsForTicket: Retrieves communication logs for a specific Ticket_ID.
GetTicketsBySeverity: Retrieves tickets based on a severity level.
GetTicketCountByAgent: Retrieves the number of tickets assigned to an agent.
GetOpenTickets: Retrieves all open tickets.
GetClosedTickets: Retrieves all closed tickets.
GetAgentDetailsByAgentID: Retrieves agent and department details given an agent ID.
Purpose:

This system aims to streamline customer support operations by providing a structured way to:

Manage customer information.
Track and resolve customer issues through tickets.
Assign tickets to appropriate support agents.
Maintain communication logs for each ticket.
Generate reports and analytics based on ticket data.
Usage:

The stored procedures can be called from any application or interface that connects to the MySQL database. This allows for easy integration with various front-end systems or other applications that require access to the customer support data.

Future Enhancements:

Implement user authentication and authorization.
Add features for reporting and analytics.
Develop a web-based interface for the system.
Implement email or SMS notifications for ticket updates.
Add more detailed ticket statuses and ticket categories.
