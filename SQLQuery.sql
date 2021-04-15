SELECT Students.Id AS ID, Students.Name, Students.Surname, Students.BirthDate AS Birth, Registration.Subject FROM Students LEFT JOIN Registration ON Registration.StudentId = Students.Id

SELECT Surname, COUNT(Id) AS Matches FROM Students GROUP BY Surname ORDER BY Matches DESC

SELECT Subject, COUNT(StudentId) AS Students FROM Registration GROUP BY Subject HAVING COUNT(StudentId) < 3

SELECT Subject, MAX(Mark) AS Best, MIN(Mark) AS Worst, AVG(Mark) AS Average, COUNT(StudentId) AS Students FROM Marks GROUP BY Subject