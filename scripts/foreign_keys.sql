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