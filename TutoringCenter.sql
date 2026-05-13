 CREATE DATABASE TutoringCenter;

 USE TutoringCenter;

 CREATE TABLE STUDENT (
		StudentID INT PRIMARY KEY,
		StudentName VARCHAR(100),
		StudentEmail VARCHAR(100),
		Major VARCHAR(50)
	);
 CREATE TABLE TUTOR (
        TutorID INT PRIMARY KEY,
        TutorName VARCHAR(100),
        TutorEmail VARCHAR(100)
    );

 CREATE TABLE COURSE (
		CourseID INT PRIMARY KEY,
		CourseTitle VARCHAR(100),
		Department VARCHAR(50)
    );


CREATE TABLE ROOM (
		RoomID INT PRIMARY KEY,
		RoomBuilding VARCHAR(100),
		RoomCapacity INT
		);

CREATE TABLE SESSION (
        SessionID INT PRIMARY KEY,
		SessionDate DATE,
        SessionTime TIME,
        StudentID INT,
		TutorID INT,
		CourseID INT,
        RoomID INT,
        SessionType VARCHAR(50),
		HourlyRate DECIMAL(5,2),
		DurationMinutes INT,
    
		FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
        FOREIGN KEY (TutorID) REFERENCES TUTOR(TutorID),
		FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID),
		FOREIGN KEY (RoomID) REFERENCES ROOM(RoomID)
    );


INSERT INTO STUDENT VALUES
		(1, 'Alice Johnson', 'alice@univ.edu', 'Computer Science'),
		(2, 'Brian Smith', 'brian@univ.edu', 'Mathematics'),
		(3, 'Cathy Lee', 'cathy@univ.edu', 'Biology'),
		(4, 'David Brown', 'david@univ.edu', 'Physics'),
		(5, 'Emma Wilson', 'emma@univ.edu', 'Engineering');

INSERT INTO COURSE VALUES
		(201, 'Database Systems', 'Computer Science'),
		(202, 'Calculus I', 'Mathematics'),
		(203, 'Organic Chemistry', 'Chemistry'),
		(204, 'Physics I', 'Physics'),
		(205, 'Programming Fundamentals', 'Computer Science');

INSERT INTO ROOM VALUES
     (301, 'Science Hall', 30),
     (302, 'Engineering Building', 25),
     (303, 'Library', 15),
     (304, 'Math Center', 20),
     (305, 'Tech Building', 35);



INSERT INTO TUTOR VALUES
	(101, 'John Carter', 'john.carter@univ.edu'),
	(102, 'Sarah Kim', 'sarah.kim@univ.edu'),
	(103, 'Michael Chen', 'michael.chen@univ.edu'),
	(104, 'Lisa White', 'lisa.white@univ.edu'),
	(105, 'James Hall', 'james.hall@univ.edu');


INSERT INTO SESSION VALUES
	(1, '2026-05-01', '10:00:00', 1, 101, 201, 301, 'Individual', 25.00, 60),
	(2, '2026-05-02', '11:30:00', 2, 102, 202, 302, 'Group', 20.00, 90),
    (3, '2026-05-03', '01:00:00', 3, 103, 203, 303, 'Individual', 30.00, 75),
	(4, '2026-05-04', '02:15:00', 4, 104, 204, 304, 'Group', 22.50, 120),
	(5, '2026-05-05', '03:45:00', 5, 105, 205, 305, 'Individual', 28.00, 60);


 SELECT
        S.StudentName,
        T.TutorName,
        C.CourseTitle,
        R.RoomID
     FROM SESSION SE
     JOIN STUDENT S ON SE.StudentID = S.StudentID
     JOIN TUTOR T ON SE.TutorID = T.TutorID
     JOIN COURSE C ON SE.CourseID = C.CourseID
     JOIN ROOM R ON SE.RoomID = R.RoomID;

 SELECT *
     FROM SESSION
     WHERE StudentID = 1;

 SELECT *
     FROM SESSION
     WHERE TutorID = 101;


 SELECT
        CourseID,
		COUNT(*) AS TotalSessions
		FROM SESSION
		GROUP BY CourseID;

 SELECT
		RoomID,
		COUNT(*) AS TotalSessions
		FROM SESSION
		GROUP BY RoomID;
