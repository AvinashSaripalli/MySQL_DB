CREATE OR REPLACE VIEW vw_user_dtls AS
SELECT
    ud.user_id,
    ud.first_name,
    ud.last_name,
    ud.email,
    ud.password,
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

CREATE OR REPLACE VIEW vw_report_dlts AS
SELECT
    rd.report_id,
    rd.user_id,
    ud.first_name,
    ud.last_name,
    ud.email,
    ud.role_id,
    ud.designation_id,
    ud.department_id,
    ud.city_id,
    ud.blood_group_id,
    ud.gender_id,
    rd.task_name,
    rd.description,
    rd.hours_worked,
    rd.feedback,
    rd.is_feedback_positive,
    rd.created_at AS report_created_at,
    rd.modified_at AS report_modified_at
FROM
    report_details rd
JOIN
    user_details ud ON rd.user_id = ud.user_id;
