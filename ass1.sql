use hr;
-- 1. to display the names (first_name, last_name) using alias name “First Name", "Last Name"
select * from employees;
SELECT 
    e.salary, CONCAT(e.first_name, ' ', e.last_name) AS 'NAME'
FROM
    employees e;


-- 2.to get unique department ID from employee table.
select * from employees;
 SELECT DISTINCT
    manager_id, department_id
FROM
    employees;
    
    
-- 3.to get all employee details from the employee table order by first name, descending
    select * from employees;
    SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.phone_number,
    e.hire_date,
    e.job_id,
    e.salary,
    e.commission_pct,
    e.manager_id,
    e.department_id
FROM
    employees e
ORDER BY e.first_name desc;

-- 4.to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary) 

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.phone_number,
    e.hire_date,
    e.job_id,
    e.commission_pct,
    e.manager_id,
    e.department_id,
    e.salary,
    e.salary * 0.15 pf
FROM
    employees e;
    
    
-- 5.to get the employee ID, names (first_name, last_name), salary in ascending order of salary

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary
FROM
    employees e
ORDER BY e.salary;

-- 6.to get the total salaries payable to employees 

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    e.commission_pct,
    SUM(e.salary + e.commission_pct) 'Totalsalaries'
FROM
    employees e
WHERE
    e.commission_pct IS NOT NULL
GROUP BY e.salary;


-- 7.to get the maximum and minimum salary from employees table
select * from employees;
SELECT 
    e.salary,
    MAX(e.salary) 'max salary',
    MIN(e.salary) 'min salary'
FROM
    employees e
ORDER BY e.salary;
    
 -- 8.to get the average salary and number of employees in the employees table   
 
 select * from employees;
 SELECT 
    e.salary, AVG(e.salary), COUNT(*)
FROM
    employees e;
    
-- 9.to get the number of employees working with the company
SELECT 
    COUNT(*) 'NO. of Employees'
FROM
    employees;
    
-- 10.to get the number of jobs available in the employees table
select * from jobs;
 
SELECT 
    COUNT(*) 'NO. of Jobs'
FROM
    jobs;

-- 11.get all first name from employees table in upper case 
select * from employees;
SELECT 
    UPPER(e.first_name) 'FIRSTNAME',
    UPPER(e.last_name) 'LASTNAME',
    UPPER(e.email) 'EMAIL@gmail.com'
FROM
    employees e;

-- 12.to get the first 3 characters of first name from employees table 

SELECT 
    UPPER(e.first_name) 'FIRSTNAME',
    UPPER(e.last_name) 'LASTNAME',
    UPPER(e.email) 'EMAIL@gmail.com'
FROM
    employees e
LIMIT 3;

-- 13.to get first name from employees table after removing white spaces from both side

SELECT TRIM(  first_name  ) 'FIRST NAME'
    FROM employees;
    
  -- 14.to get the length of the employee names (first_name, last_name) from employees table 
  
  SELECT 
    LOWER(CONCAT(first_name, ' ', last_name)) 'Lower Name',
    LENGTH(LOWER(CONCAT(first_name, ' ', last_name))) 'Lenth of Name'
FROM
    employees;
    
-- 15.to check if the first_name fields of the employees table contains numbers 

select * from employees;
SELECT 
    first_name REGEXP (0 - 9) AS 'num in first',
    last_name REGEXP (0 - 9) AS 'num in last'
FROM
    employees;
    

-- 16.to display the name (first_name, last_name) and salary for 
-- all employees whose salary is not in the range $10,000 through $15,000

SELECT 
    e.employee_id, e.first_name, e.last_name, e.salary
FROM
    employees e
WHERE
    e.salary BETWEEN 10000 AND 15000;
    
    
-- 17.to display the name (first_name, last_name) 
-- and department ID of all employees in departments 30 or 100 in ascending order
select * from employees;
select * from departments;
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_id,
    d.department_name,
    e.salary
FROM
    employees e
        INNER JOIN
    departments d ON e.department_id = d.department_id
WHERE
    d.department_id IN (30 , 100);
    
    
-- 18.to display the name (first_name, last_name) and salary for
--  all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100
    
    select * from employees;
select * from departments;
    SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_id,
    d.department_name,
    e.salary
FROM
    employees e
        INNER JOIN
    departments d ON e.department_id = d.department_id
WHERE
    e.salary BETWEEN 10000 AND 15000
        AND d.department_id IN (30 , 100);
        
        
	-- 19.to display the name (first_name, last_name) and hire date for all employees who were hired in 1987 
    select * from employees;
    SELECT 
    e.employee_id, e.first_name, e.last_name, e.hire_date
FROM
    employees e
WHERE
    e.hire_date LIKE '1987%';

-- 20.to display the first_name of all employees who have both "b" and "c" in their first name

SELECT 
    e.employee_id, e.first_name, e.last_name, e.salary
FROM
    employees e
WHERE
    e.first_name LIKE '%b%'
        OR e.first_name LIKE '%c%';

-- 21.to display the last name, job, and salary for all employees whose job is that of a Programmer
-- or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000

select * from employees;
select * from jobs;
SELECT 
    e.last_name, e.salary, j.job_id, j.job_title
FROM
    employees e
        INNER JOIN
    jobs j ON e.job_id = j.job_id
WHERE 
    j.job_title LIKE 'programmer'
        OR j.job_title LIKE 'shipping Clerk' 
        AND e.salary NOT IN (4500 , 10000, 15000)
        group by e.salary;
        
-- 22.to display the last name of employees whose names have exactly 6 characters 

select * from employees;
 
 SELECT 
    last_name
FROM
    employees
WHERE
    LENGTH(last_name) = 6;
  -- 23.to display the last name of employees having 'e' as the third character 
  
 SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE '__e%';
    
--  24.to get the job_id and related employee's id 
select * from employees;
SELECT 
    job_id, GROUP_CONCAT(employee_id) 'Employees ID'
FROM
    employees
GROUP BY job_id;



-- 25.to update the portion of the phone_number in the 
-- employees table, within the phone number the substring '124' will be replaced by '999

select * from employees;
SELECT 
    REPLACE(phone_number, '124', '999') AS 'new phone_number'
FROM
    employees
WHERE
    phone_number LIKE '%124%';


-- 26.to get the details of the employees where the length of the first name greater than or equal to 8
 
SELECT 
    first_name
FROM
    employees
WHERE
    LENGTH(first_name) >= 8;

-- 27.to append '@example.com' to email field
select * from employees;
use hr;  
SELECT 
    CONCAT(email, '.@example.com') AS 'email@example.com'
FROM
    employees;

-- 28.to extract the last 4 character of phone numbers

SELECT 
    RIGHT(phone_number, 4) AS 'last 4 No.'
FROM
    employees;
    
    
-- 29.to get the last word of the street address   
    
    select * from locations;

  SELECT 
    RIGHT(street_address, 4) 
    AS lastword
FROM
    locations;
    
    
-- 30.to get the locations that have minimum street length
SELECT 
    *
FROM
    locations
WHERE
    LENGTH(street_address) <= (SELECT 
            MIN(LENGTH(street_address))
        FROM
            locations);
   
   
   
   
-- 31.to display the first word from those job titles which contains more than one words 

select * from jobs;


SELECT 
    job_title,
    SUBSTR(job_title,
        1,
        INSTR(job_title, ' ') - 1) as jobtitle
FROM
    jobs;
    
 -- 32.to display the length of first name for
--     employees where last name contain character 'c' after 2nd position 

 select * from employees;
SELECT 
    first_name, LENGTH(first_name) 'length', last_name
FROM
    employees
WHERE
    INSTR(last_name, 'c') > 2;
 

-- 33.that displays the first name and the length of the first name for all
-- employees whose name starts with the letters 'A', 'J' or 'M'. Give each column 
--  an appropriate label. Sort the results by the employees' first names    

 select * from employees;
 
SELECT 
    first_name, LENGTH(first_name) 'length'
FROM
    employees
WHERE
    first_name LIKE 'a%'
        OR first_name LIKE 'j%'
        OR first_name LIKE 'm%'
ORDER BY first_name;

-- 34.to display the first name and salary for all employees. Format the salary
-- to be 10 characters long, left-padded with the $ symbol. Label the column SALARY

 select * from employees;
 
SELECT 
    first_name, last_name, LPAD(salary, 10, '$') '$salary'
FROM
    employees;

 
 -- 35.to display the first eight characters of the employees' first names and 
 -- indicates the amounts of their salaries with '$' sign. Each '$' sign signifies
 -- a thousand dollars. Sort the data in descending order of salary
 
 select * from employees;
  
SELECT 
    e.first_name,
    LEFT(e.first_name, 8) 'first_8',
    REPEAT('$', FLOOR(e.salary / 1000)) '$SALARY',
    LPAD(e.salary, 9, '$') 'salary with $'
FROM
    employees e
ORDER BY e.salary DESC;

 
 
 -- 36.to display the employees with their code, first name, last name and 
 -- hire date who hired either on seventh day of any month or seventh month in any year
  
  select * from employees;
  
  SELECT 
    employee_id, department_id, first_name, last_name, hire_date
FROM
    employees
WHERE
    POSITION(07 IN DATE_FORMAT(hire_date, '%d %m %Y'));
    
