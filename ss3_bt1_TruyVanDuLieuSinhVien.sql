CREATE DATABASE java10_md4_ss3_bt1_QuanLySinhVien;
USE java10_md4_ss3_bt1_QuanLySinhVien;
CREATE TABLE Class
(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE Student
(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subject
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
select *from class;
insert into Class(className,startDate, status) values
('10A1','2013/03/15',1),
('10A2','2014/04/14',1),
('10A3','2015/06/19',0); 
insert into Class(className,startDate,status) value ('10A7','2021/12/15',1);
insert into Student(StudentName, Address, Phone, Status, ClassId) values 
('Long','Ha Noi','0956232456',1,1),
('Nhung','Ho Chi Minh','0978456879',1,2),
('Linh','Da Lat','0987543887',0,1),
('Hoa','Ninh Binh','0986123456',1,3),
('Dung','Quang Ninh','0919865887',1,2);
select *from student;
-- hiển thị tất cả sinh viên có chữ cái h đứng đầu
select *from student where studentName like'h%';
-- hiển thị thông tin lớp học bắt đầu vào từ 2014/12/20 
select *from class where startDate > '2014/12/20';

INSERT INTO Subject
VALUES (1, 'Toán', 5, 1),
       (2, 'Lý', 6, 1),
       (3, 'Hóa', 5, 1),
       (4, 'Văn', 10, 1);
select *from subject;
update subject set credit = 3 where subid = 1;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5. 
select *from subject where credit between 3 and 5;
update student set classId = 1 where studentName = 'Dung';
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 6, 2),
       (4, 3, 12, 1),
       (3, 2, 6, 2),
       (2, 3, 19, 1),
       (4, 1, 15, 1);


select s.studentName , m.mark , sb.subname 
from ((student s 
join mark m on s.studentid = m.studentid) 
join subject sb on m.subid = sb.subid)
order by mark DESC, studentName ASC;


