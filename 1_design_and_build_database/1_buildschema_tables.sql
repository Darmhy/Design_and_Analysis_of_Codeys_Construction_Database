-- To build the database

CREATE TABLE projects (
    	id     		INTEGER NOT NULL,
    	name      	VARCHAR(300) NOT NULL,
	value     	FLOAT(8, 1),
    	start_date 	DATE NOT NULL,
    	end_date    	DATE NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
  );

CREATE TABLE contractors (
    	id              INTEGER NOT NULL,
    	first_name      VARCHAR(300) NOT NULL,
    	last_name       VARCHAR(300) NOT NULL,
	hourly_wage     FLOAT(5, 2) NOT NULL,
    	hire_date       DATE NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
  );
 
 
CREATE TABLE employees (
    	id              INTEGER NOT NULL,
    	first_name      VARCHAR(300) NOT NULL,
    	last_name       VARCHAR(300) NOT NULL,
	hourly_wage     FLOAT(5, 2) NOT NULL,
    	hire_date       DATE NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
  );
  
  
CREATE TABLE job_orders (
	id			INTEGER NOT NULL,
	employee_id		INTEGER NOT NULL, 
	project_id		INTEGER NOT NULL, 
	description		VARCHAR(300) NOT NULL,
	order_datetime		DATETIME DEFAULT CURRENT_TIMESTAMP,
	quantity		INTEGER NOT NULL,
	price			FLOAT(5, 2) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY (employee_id)	REFERENCES employees (id),
	FOREIGN KEY	(project_id) REFERENCES projects (id)
  );

CREATE TABLE project_employees (
	employee_id		INTEGER NOT NULL,
	project_id		INTEGER NOT NULL,
	hours			FLOAT(6, 2) NOT NULL DEFAULT 0.00,
	FOREIGN KEY (employee_id)	REFERENCES employees (id),
	FOREIGN KEY	(project_id) REFERENCES projects (id)
  );
  
CREATE TABLE project_feedbacks (
	project_id		INTEGER NOT NULL,
	customer_id		INTEGER NOT NULL,
	project_feedback	TEXT,
	PRIMARY KEY("project_id", "customer_id")
  );
  
CREATE TABLE customers (
    	name			VARCHAR(255),
	industry		VARCHAR(255),
	project1_id		INTEGER,
	project1_feedback	TEXT,
	project2_id		INTEGER,
	project2_feedback	TEXT,
	contact_person_id	INTEGER,
	contact_person_and_role	VARCHAR(300),
	phone_number		VARCHAR(12),
	address			VARCHAR(255),
	city			VARCHAR(255),
	zip			VARCHAR(5)
	);
