--SEQUENCE START

CREATE SEQUENCE leave_status_master_seq START 1000001;
CREATE SEQUENCE leave_type_master_seq START 1000001;
CREATE SEQUENCE role_master_seq START 1000001;
CREATE SEQUENCE blood_group_master_seq START 1000001;
CREATE SEQUENCE designation_master_seq START 1000001;
CREATE SEQUENCE skill_master_seq START 1000001;
CREATE SEQUENCE gender_master_seq START 1000001;
CREATE SEQUENCE department_master_seq START 1000001;
CREATE SEQUENCE city_master_seq START 1000001;
CREATE SEQUENCE user_details_seq START 1000001;
CREATE SEQUENCE leave_details_seq START 1000001;
CREATE SEQUENCE company_details_seq START 1000001;
CREATE SEQUENCE checkin_details_seq START 1000001;
CREATE SEQUENCE report_details_seq START 1000001;

--TABLES START

CREATE TABLE leave_status_master (
    leave_status_id VARCHAR(10) DEFAULT ('LSM' || nextval('leave_status_master_seq')) PRIMARY KEY,
    leave_status_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT leave_status_master_leave_status_id_chk CHECK (leave_status_id ~ '^LSM[0-9]+$')
);
CREATE TABLE leave_type_master (
    leave_type_id VARCHAR(10) DEFAULT ('LTM' || nextval('leave_type_master_seq')) PRIMARY KEY,
    leave_type_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT leave_type_master_leave_type_id_chk CHECK (leave_type_id ~ '^LTM[0-9]+$')
);
CREATE TABLE role_master (
    role_id VARCHAR(10) DEFAULT ('ROL' || nextval('role_master_seq')) PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT role_master_role_id_chk CHECK (role_id ~ '^ROL[0-9]+$')
);
CREATE TABLE blood_group_master (
    blood_group_id VARCHAR(10) DEFAULT ('BGM' || nextval('blood_group_master_seq')) PRIMARY KEY,
    blood_group_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT blood_group_master_blood_group_id_chk CHECK (blood_group_id ~ '^BGM[0-9]+$')
);
CREATE TABLE designation_master (
    designation_id VARCHAR(10) DEFAULT ('DES' || nextval('designation_master_seq')) PRIMARY KEY,
    designation_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT designation_master_designation_id_chk CHECK (designation_id ~ '^DES[0-9]+$')
);
CREATE TABLE skill_master (
    skill_id VARCHAR(10) DEFAULT ('SKL' || nextval('skill_master_seq')) PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT skill_master_skill_id_chk CHECK (skill_id ~ '^SKL[0-9]+$')
);
CREATE TABLE gender_master (
    gender_id VARCHAR(10) DEFAULT ('GEN' || nextval('gender_master_seq')) PRIMARY KEY,
    gender_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT gender_master_gender_id_chk CHECK (gender_id ~ '^GEN[0-9]+$')
);
CREATE TABLE department_master (
    department_id VARCHAR(10) DEFAULT ('DEP' || nextval('department_master_seq')) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT department_master_department_id_chk CHECK (department_id ~ '^DEP[0-9]+$')
);
CREATE TABLE city_master (
    city_id VARCHAR(10) DEFAULT ('CTY' || nextval('city_master_seq')) PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT city_master_city_id_chk CHECK (city_id ~ '^CTY[0-9]+$')
);
CREATE TABLE user_details (
    user_id VARCHAR(10) DEFAULT ('USR' || nextval('user_details_seq')) PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(10),
    date_of_birth DATE,
    password VARCHAR(255),
    company_id VARCHAR(10),
    role_id VARCHAR(10),
    designation_id VARCHAR(10),
    department_id VARCHAR(10),
    city_id VARCHAR(10),
    blood_group_id VARCHAR(10),
    gender_id VARCHAR(10),
    photo VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT user_details_user_id_chk CHECK (user_id ~ '^USR[0-9]+$')
);
CREATE TABLE leave_details (
    leave_id VARCHAR(10) DEFAULT ('LDT' || nextval('leave_details_seq')) PRIMARY KEY,
    user_id VARCHAR(10) NOT NULL,
    leave_type_id VARCHAR(10) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    reason VARCHAR(1000) NOT NULL,
    leave_status_id VARCHAR(10) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    CONSTRAINT leave_details_leave_id_chk CHECK (leave_id ~ '^LDT[0-9]+$')
);
CREATE TABLE company_details (
    company_id VARCHAR(10) DEFAULT ('COM' || nextval('company_details_seq')) PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    gstin VARCHAR(15),
    pan VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT company_details_company_id_chk CHECK (company_id ~ '^COM[0-9]+$')
);
CREATE TABLE skill_details (
    user_id VARCHAR(10),
    skill_id VARCHAR(10),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, skill_id)
);
CREATE TABLE checkin_details (
    checkin_id VARCHAR(10) DEFAULT ('CHK' || nextval('checkin_details_seq')) PRIMARY KEY,
    user_id VARCHAR(10) NOT NULL,
    clock_in TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    clock_out TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT checkin_details_checkin_id_chk CHECK (checkin_id ~ '^CHK[0-9]+$')
);
CREATE TABLE report_details (
    report_id VARCHAR(10) DEFAULT ('REP' || nextval('report_details_seq')) PRIMARY KEY,
    user_id VARCHAR(10) NOT NULL,
    task_name VARCHAR(255),
    description TEXT,
    hours_worked NUMERIC(4,0),
    feedback VARCHAR(1000),
    is_feedback_positive BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT report_details_report_id_chk CHECK (report_id ~ '^REP[0-9]+$')
);

--FOREIGN KEY START

ALTER TABLE user_details
ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES role_master(role_id);

ALTER TABLE user_details
ADD CONSTRAINT fk_user_designation FOREIGN KEY (designation_id) REFERENCES designation_master(designation_id);

ALTER TABLE user_details
ADD CONSTRAINT fk_user_department FOREIGN KEY (department_id) REFERENCES department_master(department_id);

ALTER TABLE user_details
ADD CONSTRAINT fk_user_city FOREIGN KEY (city_id) REFERENCES city_master(city_id);

ALTER TABLE user_details
ADD CONSTRAINT fk_user_blood_group FOREIGN KEY (blood_group_id) REFERENCES blood_group_master(blood_group_id);

ALTER TABLE user_details
ADD CONSTRAINT fk_user_gender FOREIGN KEY (gender_id) REFERENCES gender_master(gender_id);

ALTER TABLE user_details
ADD CONSTRAINT fk_user_company FOREIGN KEY (company_id) REFERENCES company_details(company_id);

ALTER TABLE leave_details
ADD CONSTRAINT fk_leave_user FOREIGN KEY (user_id) REFERENCES user_details(user_id);

ALTER TABLE leave_details
ADD CONSTRAINT fk_leave_type FOREIGN KEY (leave_type_id) REFERENCES leave_type_master(leave_type_id);

ALTER TABLE leave_details
ADD CONSTRAINT fk_leave_status FOREIGN KEY (leave_status_id) REFERENCES leave_status_master(leave_status_id);

ALTER TABLE skill_details
ADD CONSTRAINT fk_skill_user FOREIGN KEY (user_id) REFERENCES user_details(user_id);

ALTER TABLE skill_details
ADD CONSTRAINT fk_skill_skill FOREIGN KEY (skill_id) REFERENCES skill_master(skill_id);

ALTER TABLE checkin_details
ADD CONSTRAINT fk_checkin_user FOREIGN KEY (user_id) REFERENCES user_details(user_id);

ALTER TABLE report_details
ADD CONSTRAINT fk_checkin_user FOREIGN KEY (user_id) REFERENCES user_details(user_id);

--DATA START

INSERT INTO leave_status_master (leave_status_name) VALUES
('pending'),
('approved'),
('rejected');

INSERT INTO leave_type_master (leave_type_name) VALUES
('sick leave'),
('casual leave'),
('earned'),
('half day');

INSERT INTO role_master (role_name) VALUES
('admin'),
('manager'),
('employee');

INSERT INTO blood_group_master (blood_group_name) VALUES
('A+ve'),
('A-ve'),
('B+ve'),
('B-ve'),
('AB +ve'),
('AB -ve'),
('O+ve'),
('O-ve');

INSERT INTO designation_master (designation_name) VALUES
('Java Developer'),
('Python Developer'),
('QA Tester'),
('Software Engineer'),
('FrontEnd Developer'),
('Backend Developer');

INSERT INTO skill_master (skill_name) VALUES
('Java'),
('Nodejs'),
('React'),
('JavaScript'),
('Html'),
('Css');

INSERT INTO gender_master (gender_name) VALUES
('male'),
('female');

INSERT INTO department_master (department_name) VALUES
('Human Resources'),
('Software Development'),
('Design'),
('Testing'),
('Accounting');

INSERT INTO city_master (city_name) VALUES
('Hyderabad'),
('Kerala'),
('Amaravati'),
('Mumbai'),
('Bangalore'),
('Kolkata');

INSERT INTO company_details (company_name, gstin, pan) VALUES
('Karncy Ventures Private Limited' ,'SDFAC1235C' ,'36AACCO3611Q1Z7');

--VIEW START

CREATE OR REPLACE VIEW vw_user_dtls AS
SELECT
    ud.user_id,
    ud.first_name,
    ud.last_name,
    ud.email,
    ud.phone_number,
    ud.date_of_birth,
    cd.company_id,
    cd.company_name,
    cd.gstin,
    cd.pan,
    rm.role_id,
    rm.role_name,
    dm.designation_id,
    dm.designation_name,
    dept.department_id,
    dept.department_name,
    ct.city_id,
    ct.city_name,
    bg.blood_group_id,
    bg.blood_group_name,
    gm.gender_id,
    gm.gender_name,
    ud.photo,
    ud.is_active,
    ud.created_at,
    ud.modified_at
FROM user_details ud
LEFT JOIN company_details cd ON ud.company_id = cd.company_id
LEFT JOIN role_master rm ON ud.role_id = rm.role_id
LEFT JOIN designation_master dm ON ud.designation_id = dm.designation_id
LEFT JOIN department_master dept ON ud.department_id = dept.department_id
LEFT JOIN city_master ct ON ud.city_id = ct.city_id
LEFT JOIN blood_group_master bg ON ud.blood_group_id = bg.blood_group_id
LEFT JOIN gender_master gm ON ud.gender_id = gm.gender_id;

CREATE OR REPLACE VIEW vw_leave_dtls AS
SELECT
    ld.leave_id,
    ld.user_id,
    ld.leave_type_id,
    lt.leave_type_name,
    ld.start_date,
    ld.end_date,
    ld.reason,
    ld.leave_status_id,
    ls.leave_status_name,
    ld.is_active AS leave_is_active,
    ld.created_at AS leave_created_at,
    ld.modified_at AS leave_modified_at,
    ud.first_name,
    ud.last_name,
    ud.email,
    ud.phone_number,
    ud.date_of_birth,
    ud.company_id,
    cm.company_name,
    ud.role_id,
    rm.role_name,
    ud.designation_id,
    dm.designation_name,
    ud.department_id,
    dpm.department_name,
    ud.city_id,
    ctm.city_name,
    ud.blood_group_id,
    bgm.blood_group_name,
    ud.gender_id,
    gm.gender_name,
    ud.photo,
    ud.is_active AS user_is_active,
    ud.created_at AS user_created_at,
    ud.modified_at AS user_modified_at
FROM leave_details ld
JOIN user_details ud ON ld.user_id = ud.user_id
JOIN leave_type_master lt ON ld.leave_type_id = lt.leave_type_id
JOIN leave_status_master ls ON ld.leave_status_id = ls.leave_status_id
LEFT JOIN company_details cm ON ud.company_id = cm.company_id
LEFT JOIN role_master rm ON ud.role_id = rm.role_id
LEFT JOIN designation_master dm ON ud.designation_id = dm.designation_id
LEFT JOIN department_master dpm ON ud.department_id = dpm.department_id
LEFT JOIN city_master ctm ON ud.city_id = ctm.city_id
LEFT JOIN blood_group_master bgm ON ud.blood_group_id = bgm.blood_group_id
LEFT JOIN gender_master gm ON ud.gender_id = gm.gender_id;
