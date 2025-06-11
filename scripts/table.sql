--master tables
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

--transaction tables
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
    approved_date DATE,
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
    is_feedback_positive,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT report_details_report_id_chk CHECK (report_id ~ '^REP[0-9]+$')
);
--=========================================

CREATE TABLE workgroups (
    work_group_id 
    company_id
    privacyType ENUM('public', 'private'),
    employeeId VARCHAR(50),
    partnerCompanyName VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);