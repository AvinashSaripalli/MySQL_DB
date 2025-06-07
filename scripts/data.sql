-- leave_status_master
INSERT INTO leave_status_master (leave_status_name) VALUES
('pending'),
('approved'),
('rejected');

-- leave_type_master
INSERT INTO leave_type_master (leave_type_name) VALUES
('sick leave'),
('casual leave'),
('earned'),
('half day');

-- role_master
INSERT INTO role_master (role_name) VALUES
('admin'),
('manager'),
('employee');

-- blood_group_master
INSERT INTO blood_group_master (blood_group_name) VALUES
('A+ve'),
('A-ve'),
('B+ve'),
('B-ve'),
('AB +ve'),
('AB -ve'),
('O+ve'),
('O-ve');

-- designation_master
INSERT INTO designation_master (designation_name) VALUES
('Java Developer'),
('Python Developer'),
('QA Tester'),
('Software Engineer'),
('FrontEnd Developer'),
('Backend Developer');

-- skill_master
INSERT INTO skill_master (skill_name) VALUES
('Adobe Photoshop'),
('Figma Sketch'),
('Adobe XD'),
('UI/UX Principles'),
('Manual Testing'),
('Selenium'),
('Cypress'),
('TestRail'),
('Zephyr'),
('Postman (API Testing)'),
('JUnit'),
('NUnit'),
('TestNG'),
('JMeter'),
('LoadRunner'),
('JIRA, Bugzilla'),
('CI/CD Integration Testing'),
('Tally ERP'),
('Zoho Books'),
('MS Excel'),
('QuickBooks'),
('GST & Tax Filing'),
('Financial Reporting'),
('Bank Reconciliation'),
('Budgeting & Forecasting'),
('Ledger Management'),
('Payroll Accounting'),
('Cost Accounting'),
('JavaScript'),
('TypeScript'),
('Python'),
('Java'),
('React'),
('Angular'),
('Vue'),
('Node.js'),
('Express'),
('Git'),
('GitHub'),
('GitLab'),
('REST APIs'),
('GraphQL'),
('MySQL'),
('MongoDB'),
('AWS'),
('Azure'),
('GCP'),
('CI/CD Pipelines'),
('Data Structures & Algorithms'),
('HRIS, Payroll Management'),
('Recruitment & ATS Tools'),
('Performance Management Systems'),
('Compensation & Benefits Analysis'),
('Labor Law Compliance'),
('Onboarding Tools'),
('Exit Interview Handling');

-- gender_master
INSERT INTO gender_master (gender_name) VALUES
('male'),
('female');

-- department_master
INSERT INTO department_master (department_name) VALUES
('Human Resources'),
('Software Development'),
('Design'),
('Testing'),
('Accounting');

-- city_master
INSERT INTO city_master (city_name) VALUES
('Hyderabad'),
('Kerala'),
('Amaravati'),
('Mumbai'),
('Bangalore'),
('Kolkata');

INSERT INTO company_details (company_name ,pan ,gstin) VALUES
('Karncy Ventures Private Limited' ,'SDFAC1235C' ,'36AACCO3611Q1Z7');