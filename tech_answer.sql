--https://www.oreilly.co.jp/books/4873112818/
--初めてのSQL

--とりあえずテーブル検索
e1. SHOW TABLES;

--やった問題の解答
c3p1. SELECT emp_id, fname, lname
        FROM employee
        ORDER BY lname ASC, fname ASC;

c3p2. SELECT account_id, cust_id, avail_balance
        FROM account
        WHERE status = 'ACTIVE'
            AND avail_balance > 2500;

c3p3. SELECT DISTINCT open_emp_id
        FROM account
        ORDER BY open_emp_id;

c4p3. SELECT account_id, open_date
        FROM account
        WHERE open_date BETWEEN '2002-01-01' AND '2002-12-31'
        ORDER BY account_id ASC;

c4p4. SELECT cust_id, lname, fname
        FROM individual
        WHERE lname LIKE '_a%e%';

c5p2. SELECT a.account_id, b.fed_id, c.name
        FROM account as a
        JOIN (SELECT * FROM customer Where cust_type_cd = 'I') as b
            ON a.cust_id = b.cust_id
        JOIN product AS c
            ON a.product_cd = c.product_cd
        ORDER BY a.account_id ASC;

c5p3. SELECT emp_id, fname, lname
        FROM employee AS a
        where dept_id <> (SELECT dept_id FROM employee WHERE emp_id = a.superior_emp_id);

c6p3. SELECT fname, lname FROM individual
        UNION ALL SELECT fname, lname FROM employee
        ORDER BY lname, fname;

c7p1. SELECT substring('Please find the substring in this string', 17, 9) AS c7p1;

-- -25.76823がおかしかったため、-1をかけた
c7p2. SELECT ABS( 25.76823 * -1 ) AS c7p2_a,
             SIGN( 25.76823 * -1 ) AS c7p2_b,
             ROUND( 25.76823 * -1, 2) AS c7p2_c;

c8p1. SELECT COUNT(*)
        FROM account;

c8p2. SELECT cust_id, COUNT(*)
        FROM account
        GROUP BY cust_id
        ORDER BY cust_id;

c8p3. SELECT cust_id, COUNT(*)
        FROM account
        GROUP BY cust_id
        HAVING COUNT(*) >= 2
        ORDER BY cust_id;

c9p1. SELECT account_id, product_cd, cust_id, avail_balance
        FROM account
        WHERE product_cd IN ((SELECT product_cd FROM product WHERE product_type_cd = 'LOAN'));

c9p2. SELECT a.account_id, a.product_cd, a.cust_id, a.avail_balance
        FROM account as a
        WHERE EXISTS ( SELECT * FROM product WHERE a.product_cd = product.product_cd AND product_type_cd = 'LOAN');

c9p3. SELECT a.emp_id, a.fname, a.lname, l.name
        FROM employee as a
        JOIN (SELECT 'trainee' name, '2004-01-01' start_dt, '2005-12-31' end_dt
                UNION ALL SELECT 'worker' name, '2002-01-01' start_dt, '2003-12-31' end_dt
                UNION ALL SELECT 'mentor' name, '2000-01-01' start_dt, '2001-12-31' end_dt
             ) as l
          on a.start_date BETWEEN l.start_dt AND l.end_dt;

c9p4. SELECT emp_id, fname, lname,
        (SELECT name FROM department WHERE a.dept_id = department.dept_id) as dept_name,
        (SELECT name FROM branch WHERE a.assigned_branch_id = branch.branch_id) as branch_name
        FROM employee as a;

c10p1. SELECT p.product_cd, a.account_id, a.cust_id, a.avail_balance
         FROM account as a
         RIGHT JOIN product as p
             ON p.product_cd = a.product_cd
         ORDER BY p.product_cd ASC, a.account_id ASC;

c10p2. SELECT p.product_cd, a.account_id, a.cust_id, a.avail_balance
         FROM product as p
         LEFT JOIN account as a
             ON p.product_cd = a.product_cd
         ORDER BY p.product_cd ASC, a.account_id ASC;

c10p3. SELECT a.account_id, a.product_cd, i.fname, i.lname, b.name
         FROM account as a
         LEFT JOIN individual as i
             on a.cust_id = i.cust_id
         LEFT JOIN business as b
             on a.cust_id = b.cust_id
         ORDER BY a.account_id ASC;

c11p1. SELECT emp_id,
         CASE
             WHEN title IN ('President', 'Vice President', 'Treasurer', 'Loan Manager')
                 THEN 'Management'
             WHEN title IN ('Operations Manager', 'Head Teller', 'Teller')
                 THEN 'Operations'
             ELSE 'Unknown'
             END as title FROM employee;

c11p2. SELECT DISTINCT (SELECT COUNT(*) FROM account where open_branch_id = 1) AS branch_1,
         (SELECT  COUNT(*) FROM account where open_branch_id = 2) AS branch_2,
         (SELECT  COUNT(*) FROM account where open_branch_id = 3) AS branch_3,
         (SELECT  COUNT(*) FROM account where open_branch_id = 4) AS branch_4
         FROM account;

         
