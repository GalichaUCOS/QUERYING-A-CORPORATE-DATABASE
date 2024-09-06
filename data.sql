-- 1.	Show all the first name and last name of faculty members, subjects they’re teaching, schedule (timestart, timeend and day), the school year and the corresponding semester.

SELECT 
    f.first_name AS faculty_first_name,
    f.last_name AS faculty_last_name,
    a.available_subject_name AS subject_name,
    c.day,
    c.time_start,
    c.time_end,
    sy.year_start AS school_year_start,
    sy.year_end AS school_year_end,
    s.semester AS semester_name
FROM Classes c
JOIN Available_subjects a ON c.available_subject_id = a.available_subject_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Programs p ON a.program_id = p.program_id
JOIN School_years sy ON p.school_year_id = sy.school_year_id
JOIN Semesters s ON p.school_year_id = s.school_year_id
WHERE s.semester_id = (SELECT semester_id 
                      SSFROM Semesters 
                       WHERE school_year_id = p.school_year_id 
                         AND semester_id = (SELECT MAX(semester_id) 
                                            FROM Semesters 
                                            WHERE school_year_id = p.school_year_id))
ORDER BY f.last_name, f.first_name, a.available_subject_name, c.day, c.time_start;

-- 2.	Show all the available subjects for the school year 2019-2020 1st semester. This includes the schedule of the subject (day, timestart, timeend), the room number and the faculty assigned to that class.

SELECT 
    a.available_subject_name AS subject_name,
    c.day,
    c.time_start,
    c.time_end,
    r.room_number,
    f.first_name AS faculty_first_name,
    f.last_name AS faculty_last_name
FROM Classes c
JOIN Available_subjects a ON c.available_subject_id = a.available_subject_id
JOIN Rooms r ON c.room_id = r.room_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Programs p ON a.program_id = p.program_id
JOIN School_years sy ON p.school_year_id = sy.school_year_id
JOIN Semesters s ON a.semester_id = s.semester_id
WHERE sy.year_start = 2019 
  AND sy.year_end = 2020 
  AND s.semester = 1  -- Adjust based on how semester is stored
ORDER BY a.available_subject_name, c.day, c.time_start;

-- 3.	Show the student id, firstname, lastname, subject and grades of a student with a student id = 2. Show only the grades coming from the school year 2019-2020 1st semester. 
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    asub.available_subject_name AS subject,
    g.grade
FROM 
    Students s
JOIN 
    Grades g ON s.student_id = g.student_id
JOIN 
    Classes c ON g.class_id = c.class_id
JOIN 
    Available_subjects asub ON c.available_subject_id = asub.available_subject_id
JOIN 
    School_years sy ON asub.school_year_id = sy.school_year_id
JOIN 
    Semesters sem ON asub.semester_id = sem.semester_id
WHERE 
    s.student_id = 2
    AND sy.year_start = 2019
    AND sy.year_end = 2020
    AND sem.semester = 1;

-- 4.	Show all the rooms and the number of classes being held in each room for the school year 2019-2020 2nd semester. 
SELECT
	Rooms.room_number, COUNT(Classes.class_id) AS number_of_classes
FROM 
	Rooms
JOIN 
	Classes on Rooms.room_id = Classes.room_id
JOIN 
	Available_subjects on Classes.available_subject_id = Available_subjects.available_subject_id
WHERE
	available_subjects.semester_id = 2
GROUP BY 
	Rooms.room_number;
