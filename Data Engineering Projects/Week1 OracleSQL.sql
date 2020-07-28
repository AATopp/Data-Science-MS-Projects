SELECT v_code, v_name, v_contact, v_areacode, v_phone, v_state, v_order 
FROM VENDOR;

SELECT v_name 
FROM VENDOR 
WHERE v_order = '0';

SELECT * 
FROM PRODUCT 
WHERE p_price > 100 AND p_price < 200;

SELECT empno, deptno, ename, sal
FROM EMP 
WHERE deptno = 30
ORDER BY sal DESC;

SELECT ename, job, sal
FROM EMP 
WHERE (job = 'ANALYST') OR (job='SALESMAN');

SELECT ename, job, sal
FROM EMP 
WHERE ename like 'A%';

SELECT empno, ename, sal
FROM EMP 
WHERE sal BETWEEN 3000 AND 4000;

Join the tables:

SELECT a.ename, b.dname
FROM EMP a, DEPT b
WHERE a.deptno = b.deptno;

SELECT DISTINCT deptno
FROM EMP;

SELECT AVG(sal)
FROM EMP;

SELECT COUNT(*)
FROM EMP;

SELECT MAX (sal)
FROM EMP 
GROUP BY deptno;

SELECT deptno, AVG(sal)
FROM EMP
GROUP BY deptno
HAVING AVG(sal) > 2000;

SELECT lower(ename) FROM EMP;

SELECT ROUND (sal,2) FROM EMP;

SELECT ename, job, sal
FROM EMP
WHERE sal >= (SELECT AVG(sal)
FROM EMP);

CREATE OR REPLACE VIEW ATVIEW AS
SELECT a.ename, b.dname
FROM EMP a, DEPT b
WHERE a.deptno = b.deptno;

SELECT * FROM ATVIEW;

Homework:
SELECT emp.ename, dept.dname, emp.job, emp.empno, emp.hiredate, dept.loc
FROM EMP, DEPT
WHERE emp.deptno = dept.deptno
ORDER BY ename;

SELECT dname, COUNT(*) count_of_employees, AVG(sal) as average_salary
FROM dept, emp
WHERE dept.deptno = emp.deptno
GROUP BY DNAME
ORDER BY 2 DESC;
