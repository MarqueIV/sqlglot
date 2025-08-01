--------------------------------------
-- Qualify columns
--------------------------------------
SELECT a FROM x;
SELECT x.a AS a FROM x AS x;

SELECT "a" FROM x;
SELECT x.a AS a FROM x AS x;

# execute: false
SELECT a FROM zz GROUP BY a ORDER BY a;
SELECT zz.a AS a FROM zz AS zz GROUP BY zz.a ORDER BY a;

# execute: false
SELECT x, p FROM (SELECT x from xx) xx CROSS JOIN yy;
SELECT xx.x AS x, yy.p AS p FROM (SELECT xx.x AS x FROM xx AS xx) AS xx CROSS JOIN yy AS yy;

SELECT a FROM x AS z;
SELECT z.a AS a FROM x AS z;

SELECT a AS a FROM x;
SELECT x.a AS a FROM x AS x;

SELECT x.a FROM x;
SELECT x.a AS a FROM x AS x;

SELECT x.a AS a FROM x;
SELECT x.a AS a FROM x AS x;

SELECT a AS b FROM x;
SELECT x.a AS b FROM x AS x;

# execute: false
SELECT 1, 2 + 3 FROM x;
SELECT 1 AS "1", 2 + 3 AS _col_1 FROM x AS x;

# execute: false
SELECT a + b FROM x;
SELECT x.a + x.b AS _col_0 FROM x AS x;

SELECT l.a FROM x l WHERE a IN (select a FROM x ORDER by a);
SELECT l.a AS a FROM x AS l WHERE l.a IN (SELECT x.a AS a FROM x AS x ORDER BY a);

# execute: false
SELECT a, SUM(b) FROM x WHERE a > 1 AND b > 1 GROUP BY a;
SELECT x.a AS a, SUM(x.b) AS _col_1 FROM x AS x WHERE x.a > 1 AND x.b > 1 GROUP BY x.a;

SELECT SUM(a) AS c FROM x HAVING SUM(a) > 3;
SELECT SUM(x.a) AS c FROM x AS x HAVING SUM(x.a) > 3;

SELECT SUM(a) AS a FROM x HAVING SUM(a) > 3;
SELECT SUM(x.a) AS a FROM x AS x HAVING SUM(x.a) > 3;

SELECT SUM(a) AS c FROM x HAVING c > 3;
SELECT SUM(x.a) AS c FROM x AS x HAVING SUM(x.a) > 3;

# execute: false
SELECT SUM(a) AS a FROM x HAVING a > 3;
SELECT SUM(x.a) AS a FROM x AS x HAVING SUM(x.a) > 3;

SELECT SUM(a) AS c FROM x HAVING SUM(b) > 3;
SELECT SUM(x.a) AS c FROM x AS x HAVING SUM(x.b) > 3;

SELECT a AS j, b FROM x ORDER BY j;
SELECT x.a AS j, x.b AS b FROM x AS x ORDER BY j;

SELECT a AS j, b AS a FROM x ORDER BY 1;
SELECT x.a AS j, x.b AS a FROM x AS x ORDER BY j;

SELECT SUM(a) AS c, SUM(b) AS d FROM x ORDER BY 1, 2;
SELECT SUM(x.a) AS c, SUM(x.b) AS d FROM x AS x ORDER BY c, d;

# execute: false
SELECT CAST(a AS INT) FROM x ORDER BY a;
SELECT CAST(x.a AS INT) AS a FROM x AS x ORDER BY a;

# execute: false
SELECT SUM(a), SUM(b) AS c FROM x ORDER BY 1, 2;
SELECT SUM(x.a) AS _col_0, SUM(x.b) AS c FROM x AS x ORDER BY _col_0, c;

SELECT a AS j, b FROM x GROUP BY j, b;
SELECT x.a AS j, x.b AS b FROM x AS x GROUP BY x.a, x.b;

SELECT a, b FROM x GROUP BY 1, 2;
SELECT x.a AS a, x.b AS b FROM x AS x GROUP BY x.a, x.b;

SELECT a, b FROM x ORDER BY 1, 2;
SELECT x.a AS a, x.b AS b FROM x AS x ORDER BY a, b;

SELECT DISTINCT a AS c, b AS d FROM x ORDER BY 1;
SELECT DISTINCT x.a AS c, x.b AS d FROM x AS x ORDER BY c;

SELECT 2 FROM x GROUP BY 1;
SELECT 2 AS "2" FROM x AS x GROUP BY 1;

SELECT 'a' AS a FROM x GROUP BY 1;
SELECT 'a' AS a FROM x AS x GROUP BY 1;

SELECT NULL AS a FROM x GROUP BY 1;
SELECT NULL AS a FROM x AS x GROUP BY 1;

SELECT TRUE AS a FROM x GROUP BY 1;
SELECT TRUE AS a FROM x AS x GROUP BY 1;

# execute: false
# dialect: oracle
SELECT t."col" FROM tbl t;
SELECT T."col" AS "col" FROM TBL T;

# execute: false
# dialect: oracle
WITH base AS (SELECT x.dummy AS COL_1 FROM dual x) SELECT b."COL_1" FROM base b;
WITH BASE AS (SELECT X.DUMMY AS COL_1 FROM DUAL X) SELECT B.COL_1 AS COL_1 FROM BASE B;

# execute: false
-- this query seems to be invalid in postgres and duckdb but valid in bigquery
SELECT 2 a FROM x GROUP BY 1 HAVING a > 1;
SELECT 2 AS a FROM x AS x GROUP BY 1 HAVING a > 1;

SELECT 2 d FROM x GROUP BY d HAVING d > 1;
SELECT 2 AS d FROM x AS x GROUP BY 1 HAVING d > 1;

SELECT 2 d FROM x GROUP BY 1 ORDER BY 1;
SELECT 2 AS d FROM x AS x GROUP BY 1 ORDER BY d;

# execute: false
SELECT DATE(a), DATE(b) AS c FROM x GROUP BY 1, 2;
SELECT DATE(x.a) AS _col_0, DATE(x.b) AS c FROM x AS x GROUP BY DATE(x.a), DATE(x.b);

# execute: false
SELECT (SELECT MIN(a) FROM UNNEST([1, 2])) AS f FROM x GROUP BY 1;
SELECT (SELECT MIN(_q_0.a) AS _col_0 FROM UNNEST(ARRAY(1, 2)) AS _q_0) AS f FROM x AS x GROUP BY 1;

# dialect: bigquery
WITH x AS (select 'a' as a, 1 as b) SELECT x.a AS c, y.a as d, SUM(x.b) AS y, FROM x join x as y on x.a = y.a group by 1, 2;
WITH x AS (SELECT 'a' AS a, 1 AS b) SELECT x.a AS c, y.a AS d, SUM(x.b) AS y FROM x AS x JOIN x AS y ON x.a = y.a GROUP BY x.a, 2;

SELECT SUM(x.a) AS c FROM x JOIN y ON x.b = y.b GROUP BY c;
SELECT SUM(x.a) AS c FROM x AS x JOIN y AS y ON x.b = y.b GROUP BY y.c;

SELECT COALESCE(x.a) AS d FROM x JOIN y ON x.b = y.b GROUP BY d;
SELECT COALESCE(x.a) AS d FROM x AS x JOIN y AS y ON x.b = y.b GROUP BY COALESCE(x.a);

SELECT a + 1 AS d FROM x WHERE d > 1;
SELECT x.a + 1 AS d FROM x AS x WHERE (x.a + 1) > 1;

# execute: false
SELECT a + 1 AS d, d + 2 FROM x;
SELECT x.a + 1 AS d, x.a + 1 + 2 AS _col_1 FROM x AS x;

SELECT a AS a, b FROM x ORDER BY a;
SELECT x.a AS a, x.b AS b FROM x AS x ORDER BY a;

SELECT a, b FROM x ORDER BY a;
SELECT x.a AS a, x.b AS b FROM x AS x ORDER BY a;

SELECT a FROM x ORDER BY b;
SELECT x.a AS a FROM x AS x ORDER BY x.b;

SELECT SUM(a) AS a FROM x ORDER BY SUM(a);
SELECT SUM(x.a) AS a FROM x AS x ORDER BY SUM(x.a);

# execute: false
SELECT AGGREGATE(ARRAY(a, x.b), 0, (x, acc) -> x + acc + a) AS sum_agg FROM x;
SELECT AGGREGATE(ARRAY(x.a, x.b), 0, (x, acc) -> x + acc + x.a) AS sum_agg FROM x AS x;

# dialect: starrocks
# execute: false
SELECT DATE_TRUNC('week', a) AS a FROM x;
SELECT DATE_TRUNC('WEEK', x.a) AS a FROM x AS x;

# dialect: bigquery
# execute: false
SELECT DATE_TRUNC(a, MONTH) AS a FROM x;
SELECT DATE_TRUNC(x.a, MONTH) AS a FROM x AS x;

# execute: false
SELECT x FROM READ_PARQUET('path.parquet', hive_partition=1);
SELECT _q_0.x AS x FROM READ_PARQUET('path.parquet', hive_partition = 1) AS _q_0;

# execute: false
select * from (values (1, 2));
SELECT _q_0._col_0 AS _col_0, _q_0._col_1 AS _col_1 FROM (VALUES (1, 2)) AS _q_0(_col_0, _col_1);

# execute: false
select * from (values (1, 2)) x;
SELECT x._col_0 AS _col_0, x._col_1 AS _col_1 FROM (VALUES (1, 2)) AS x(_col_0, _col_1);

# execute: false
SELECT SOME_UDF(data).* FROM t;
SELECT SOME_UDF(t.data).* FROM t AS t;

# execute: false
SELECT p.* FROM p UNION ALL SELECT p2.* FROM p2;
SELECT p.* FROM p AS p UNION ALL SELECT p2.* FROM p2 AS p2;

# execute: false
# allow_partial_qualification: true
# validate_qualify_columns: false
SELECT a + 1 AS i, missing_column FROM x;
SELECT x.a + 1 AS i, missing_column AS missing_column FROM x AS x;

# execute: false
# dialect: clickhouse
SELECT s, arr1, arr2 FROM arrays_test LEFT ARRAY JOIN arr1, arrays_test.arr2;
SELECT arrays_test.s AS s, arrays_test.arr1 AS arr1, arrays_test.arr2 AS arr2 FROM arrays_test AS arrays_test LEFT ARRAY JOIN arrays_test.arr1, arrays_test.arr2;

# execute: false
# dialect: snowflake
WITH employees AS (
    SELECT *
    FROM (VALUES ('President', 1, NULL),
                 ('Vice President Engineering', 10, 1),
                 ('Programmer', 100, 10),
                 ('QA Engineer', 101, 10),
                 ('Vice President HR', 20, 1),
                 ('Health Insurance Analyst', 200, 20)
    ) AS t(title, employee_ID, manager_ID)
)
SELECT
  employee_ID,
  manager_ID,
  title,
  level
FROM employees
START WITH title = 'President'
CONNECT BY manager_ID = PRIOR employee_id
ORDER BY
  employee_ID NULLS LAST;
WITH EMPLOYEES AS (SELECT T.TITLE AS TITLE, T.EMPLOYEE_ID AS EMPLOYEE_ID, T.MANAGER_ID AS MANAGER_ID FROM (VALUES ('President', 1, NULL), ('Vice President Engineering', 10, 1), ('Programmer', 100, 10), ('QA Engineer', 101, 10), ('Vice President HR', 20, 1), ('Health Insurance Analyst', 200, 20)) AS T(TITLE, EMPLOYEE_ID, MANAGER_ID)) SELECT EMPLOYEES.EMPLOYEE_ID AS EMPLOYEE_ID, EMPLOYEES.MANAGER_ID AS MANAGER_ID, EMPLOYEES.TITLE AS TITLE, LEVEL AS LEVEL FROM EMPLOYEES AS EMPLOYEES START WITH EMPLOYEES.TITLE = 'President' CONNECT BY EMPLOYEES.MANAGER_ID = PRIOR EMPLOYEES.EMPLOYEE_ID ORDER BY EMPLOYEE_ID;

# execute: false
# dialect: oracle
WITH
t1 AS (
  SELECT
    1 AS c1,
    1 AS c2,
    'Y' AS TOP_PARENT_INDICATOR,
    1 AS id
  FROM DUAL
),
t2 AS (
  SELECT
    1 AS c2,
    2 AS id
  FROM DUAL
)
SELECT t1.c1
FROM t1
LEFT JOIN t2 ON t1.c2 = t2.c2
WHERE (t1.TOP_PARENT_INDICATOR = 'Y' OR LEVEL = 1)
START WITH (t1.id IS NOT NULL)
CONNECT BY PRIOR t1.id = t2.id;
WITH T1 AS (SELECT 1 AS C1, 1 AS C2, 'Y' AS TOP_PARENT_INDICATOR, 1 AS ID FROM DUAL DUAL), T2 AS (SELECT 1 AS C2, 2 AS ID FROM DUAL DUAL) SELECT T1.C1 AS C1 FROM T1 T1 LEFT JOIN T2 T2 ON T1.C2 = T2.C2 WHERE (T1.TOP_PARENT_INDICATOR = 'Y' OR LEVEL = 1) START WITH (NOT T1.ID IS NULL) CONNECT BY PRIOR T1.ID = T2.ID;

# execute: false
# dialect: postgres
SELECT * FROM ROWS FROM (GENERATE_SERIES(1, 3), GENERATE_SERIES(10, 12)) AS t(a, b);
SELECT t.a AS a, t.b AS b FROM ROWS FROM (GENERATE_SERIES(1, 3), GENERATE_SERIES(10, 12)) AS t(a, b);

# execute: false
# dialect: clickhouse
SELECT generate_series FROM generate_series(0, 10) AS g;
SELECT g.generate_series AS generate_series FROM generate_series(0, 10) AS g(generate_series);

# execute: false
# dialect: snowflake
SELECT * FROM quarterly_sales PIVOT(SUM(amount) FOR quarter IN (ANY ORDER BY quarter)) ORDER BY empid;
SELECT * FROM QUARTERLY_SALES AS QUARTERLY_SALES PIVOT(SUM(QUARTERLY_SALES.AMOUNT) FOR QUARTERLY_SALES.QUARTER IN (ANY ORDER BY QUARTER)) AS _Q_0 ORDER BY _Q_0.EMPID;

# execute: false
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY x) AS x FROM t;
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY t.x) AS x FROM t AS t;

# execute: false
# dialect: bigquery
WITH t AS (SELECT 1 AS c) SELECT TO_JSON_STRING(t) FROM t;
WITH t AS (SELECT 1 AS c) SELECT TO_JSON_STRING(t) AS _col_0 FROM t AS t;

--------------------------------------
-- Derived tables
--------------------------------------
SELECT y.a AS a FROM (SELECT x.a AS a FROM x AS x) AS y;
SELECT y.a AS a FROM (SELECT x.a AS a FROM x AS x) AS y;

SELECT y.a AS a FROM (SELECT x.a AS a FROM x AS x) AS y(a);
SELECT y.a AS a FROM (SELECT x.a AS a FROM x AS x) AS y;

SELECT y.c AS c FROM (SELECT x.a AS a, x.b AS b FROM x AS x) AS y(c);
SELECT y.c AS c FROM (SELECT x.a AS c, x.b AS b FROM x AS x) AS y;

SELECT a FROM (SELECT a FROM x AS x) y;
SELECT y.a AS a FROM (SELECT x.a AS a FROM x AS x) AS y;

SELECT a FROM (SELECT a AS a FROM x);
SELECT _q_0.a AS a FROM (SELECT x.a AS a FROM x AS x) AS _q_0;

SELECT a FROM (SELECT a FROM (SELECT a FROM x));
SELECT _q_1.a AS a FROM (SELECT _q_0.a AS a FROM (SELECT x.a AS a FROM x AS x) AS _q_0) AS _q_1;

SELECT x.a FROM x AS x JOIN (SELECT * FROM x) AS y ON x.a = y.a;
SELECT x.a AS a FROM x AS x JOIN (SELECT x.a AS a, x.b AS b FROM x AS x) AS y ON x.a = y.a;

SELECT a FROM x as t1 /* there is comment */;
SELECT t1.a AS a FROM x AS t1 /* there is comment */;

--------------------------------------
-- Joins
--------------------------------------
SELECT a, c FROM x JOIN y ON x.b = y.b;
SELECT x.a AS a, y.c AS c FROM x AS x JOIN y AS y ON x.b = y.b;

SELECT a, c FROM x, y;
SELECT x.a AS a, y.c AS c FROM x AS x, y AS y;

--------------------------------------
-- Unions
--------------------------------------
SELECT a FROM x UNION SELECT a FROM x ORDER BY a;
SELECT x.a AS a FROM x AS x UNION SELECT x.a AS a FROM x AS x ORDER BY a;

SELECT a FROM x UNION SELECT a FROM x UNION SELECT a FROM x ORDER BY a;
SELECT x.a AS a FROM x AS x UNION SELECT x.a AS a FROM x AS x UNION SELECT x.a AS a FROM x AS x ORDER BY a;

SELECT a FROM (SELECT a FROM x UNION SELECT a FROM x) ORDER BY a;
SELECT _q_0.a AS a FROM (SELECT x.a AS a FROM x AS x UNION SELECT x.a AS a FROM x AS x) AS _q_0 ORDER BY a;

# title: nested subqueries in union
((select a from x where a < 1)) UNION ((select a from x where a > 2));
((SELECT x.a AS a FROM x AS x WHERE x.a < 1)) UNION ((SELECT x.a AS a FROM x AS x WHERE x.a > 2));


# dialect: bigquery
# execute: false
SELECT * FROM (SELECT 1 AS foo, 2 AS bar INNER UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz);
SELECT _q_0.bar AS bar FROM (SELECT 1 AS foo, 2 AS bar INNER UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) AS _q_0;

# dialect: bigquery
# execute: false
SELECT * FROM (SELECT 1 AS foo, 2 AS bar UNION ALL CORRESPONDING SELECT 3 AS bar, 4 AS baz);
SELECT _q_0.bar AS bar FROM (SELECT 1 AS foo, 2 AS bar INNER UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) AS _q_0;

# dialect: bigquery
# execute: false
SELECT * FROM (SELECT 1 AS foo, 2 AS bar LEFT UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz);
SELECT _q_0.foo AS foo, _q_0.bar AS bar FROM (SELECT 1 AS foo, 2 AS bar LEFT UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) AS _q_0;

# dialect: bigquery
# execute: false
SELECT * FROM (SELECT 1 AS foo, 2 AS bar FULL UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz);
SELECT _q_0.foo AS foo, _q_0.bar AS bar, _q_0.baz AS baz FROM (SELECT 1 AS foo, 2 AS bar FULL UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) AS _q_0;


# dialect: bigquery
# execute: false
SELECT * FROM (SELECT 1 AS foo, 2 AS bar LEFT UNION ALL CORRESPONDING SELECT 3 AS bar, 4 AS baz);
SELECT _q_0.foo AS foo, _q_0.bar AS bar FROM (SELECT 1 AS foo, 2 AS bar LEFT UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) AS _q_0;


# dialect: bigquery
# execute: false
SELECT * FROM (SELECT 1 AS foo, 2 AS bar FULL UNION ALL CORRESPONDING SELECT 3 AS bar, 4 AS baz);
SELECT _q_0.foo AS foo, _q_0.bar AS bar, _q_0.baz AS baz FROM (SELECT 1 AS foo, 2 AS bar FULL UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) AS _q_0;

# dialect: bigquery
# execute: false
SELECT * FROM (SELECT 1 AS foo, 2 AS bar FULL UNION ALL CORRESPONDING BY (foo, bar) SELECT 3 AS bar, 4 AS baz);
SELECT _q_0.foo AS foo, _q_0.bar AS bar FROM (SELECT 1 AS foo, 2 AS bar FULL UNION ALL BY NAME ON (foo, bar) SELECT 3 AS bar, 4 AS baz) AS _q_0;


# dialect: bigquery
# execute: false
SELECT * FROM (SELECT 1 AS foo, 2 AS bar FULL UNION ALL BY NAME ON (foo, bar) SELECT 3 AS bar, 4 AS baz);
SELECT _q_0.foo AS foo, _q_0.bar AS bar FROM (SELECT 1 AS foo, 2 AS bar FULL UNION ALL BY NAME ON (foo, bar) SELECT 3 AS bar, 4 AS baz) AS _q_0;

# dialect: bigquery
# execute: false
SELECT * FROM ((SELECT 1 AS foo, 2 AS bar LEFT UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) LEFT UNION ALL BY NAME ON (bar) SELECT 3 AS foo, 4 AS bar);
SELECT _q_0.bar AS bar FROM ((SELECT 1 AS foo, 2 AS bar LEFT UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) LEFT UNION ALL BY NAME ON (bar) SELECT 3 AS foo, 4 AS bar) AS _q_0;

# dialect: bigquery
# execute: false
SELECT * FROM ((SELECT 1 AS foo, 2 AS bar LEFT UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) FULL UNION ALL BY NAME ON (foo, qux) SELECT 3 AS qux, 4 AS bar);
SELECT _q_0.foo AS foo, _q_0.qux AS qux FROM ((SELECT 1 AS foo, 2 AS bar LEFT UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) FULL UNION ALL BY NAME ON (foo, qux) SELECT 3 AS qux, 4 AS bar) AS _q_0;

# dialect: bigquery
# execute: false
SELECT * FROM (((SELECT 1 AS foo, 2 AS bar LEFT UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) FULL UNION ALL BY NAME ON (foo, qux) SELECT 3 AS qux, 4 AS bar) INNER UNION ALL BY NAME ON (foo) SELECT 6 AS foo);
SELECT _q_0.foo AS foo FROM (((SELECT 1 AS foo, 2 AS bar LEFT UNION ALL BY NAME SELECT 3 AS bar, 4 AS baz) FULL UNION ALL BY NAME ON (foo, qux) SELECT 3 AS qux, 4 AS bar) INNER UNION ALL BY NAME ON (foo) SELECT 6 AS foo) AS _q_0;

# Title: Nested set operations with modifiers
# dialect: bigquery
# execute: false
WITH t1 AS (SELECT 1 AS a, 2 AS b), t2 AS (SELECT 2 AS b, 3 AS c), t3 AS (SELECT 2 AS c, 3 AS d), t4 AS (SELECT 2 AS e, 3 AS f) SELECT * FROM ((SELECT * FROM t1 FULL OUTER UNION ALL BY NAME (SELECT * FROM t2 FULL OUTER UNION ALL BY NAME (SELECT * FROM t3 FULL OUTER UNION ALL BY NAME SELECT * FROM t4))));
WITH t1 AS (SELECT 1 AS a, 2 AS b), t2 AS (SELECT 2 AS b, 3 AS c), t3 AS (SELECT 2 AS c, 3 AS d), t4 AS (SELECT 2 AS e, 3 AS f) SELECT _q_0.a AS a, _q_0.b AS b, _q_0.c AS c, _q_0.d AS d, _q_0.e AS e, _q_0.f AS f FROM ((SELECT t1.a AS a, t1.b AS b FROM t1 AS t1 FULL OUTER UNION ALL BY NAME (SELECT t2.b AS b, t2.c AS c FROM t2 AS t2 FULL OUTER UNION ALL BY NAME (SELECT t3.c AS c, t3.d AS d FROM t3 AS t3 FULL OUTER UNION ALL BY NAME SELECT t4.e AS e, t4.f AS f FROM t4 AS t4))) AS _q_0);


# Title: Nested set operations with different modifiers (FULL + INNER)
# dialect: bigquery
# execute: false
WITH t1 AS (SELECT 1 AS a, 2 AS b), t2 AS (SELECT 2 AS b, 3 AS c), t3 AS (SELECT 2 AS c, 3 AS d), t4 AS (SELECT 2 AS e, 3 AS f) SELECT * FROM ((SELECT * FROM t1 FULL OUTER UNION ALL BY NAME (SELECT * FROM t2 INNER UNION ALL BY NAME (SELECT * FROM t3 FULL OUTER UNION ALL BY NAME SELECT * FROM t4))));
WITH t1 AS (SELECT 1 AS a, 2 AS b), t2 AS (SELECT 2 AS b, 3 AS c), t3 AS (SELECT 2 AS c, 3 AS d), t4 AS (SELECT 2 AS e, 3 AS f) SELECT _q_0.a AS a, _q_0.b AS b, _q_0.c AS c FROM ((SELECT t1.a AS a, t1.b AS b FROM t1 AS t1 FULL OUTER UNION ALL BY NAME (SELECT t2.b AS b, t2.c AS c FROM t2 AS t2 INNER UNION ALL BY NAME (SELECT t3.c AS c, t3.d AS d FROM t3 AS t3 FULL OUTER UNION ALL BY NAME SELECT t4.e AS e, t4.f AS f FROM t4 AS t4))) AS _q_0);

# Title: Nested set operations with different modifiers (FULL + LEFT)
# dialect: bigquery
# execute: false
WITH t1 AS (SELECT 1 AS a, 2 AS b, 3 AS c, 4 AS d), t2 AS (SELECT 2 AS b, 3 AS c), t3 AS (SELECT 2 AS c, 3 AS d), t4 AS (SELECT 2 AS d, 3 AS e) SELECT * FROM ((SELECT * FROM t1 FULL OUTER UNION ALL BY NAME (SELECT * FROM t2 FULL UNION ALL BY NAME (SELECT * FROM t3 LEFT UNION ALL BY NAME SELECT * FROM t4))));
WITH t1 AS (SELECT 1 AS a, 2 AS b, 3 AS c, 4 AS d), t2 AS (SELECT 2 AS b, 3 AS c), t3 AS (SELECT 2 AS c, 3 AS d), t4 AS (SELECT 2 AS d, 3 AS e) SELECT _q_0.a AS a, _q_0.b AS b, _q_0.c AS c, _q_0.d AS d FROM ((SELECT t1.a AS a, t1.b AS b, t1.c AS c, t1.d AS d FROM t1 AS t1 FULL OUTER UNION ALL BY NAME (SELECT t2.b AS b, t2.c AS c FROM t2 AS t2 FULL UNION ALL BY NAME (SELECT t3.c AS c, t3.d AS d FROM t3 AS t3 LEFT UNION ALL BY NAME SELECT t4.d AS d, t4.e AS e FROM t4 AS t4))) AS _q_0);

--------------------------------------
-- Subqueries
--------------------------------------
SELECT a FROM x WHERE b IN (SELECT c FROM y);
SELECT x.a AS a FROM x AS x WHERE x.b IN (SELECT y.c AS c FROM y AS y);

# execute: false
SELECT (SELECT c FROM y) FROM x;
SELECT (SELECT y.c AS c FROM y AS y) AS _col_0 FROM x AS x;

# execute: false
WITH t(c) AS (SELECT 1) SELECT (SELECT c) FROM t;
WITH t AS (SELECT 1 AS c) SELECT (SELECT t.c AS c) AS _col_0 FROM t AS t;

# execute: false
WITH t1(c1) AS (SELECT 1), t2(c2) AS (SELECT 2) SELECT (SELECT c1 FROM t2) FROM t1;
WITH t1 AS (SELECT 1 AS c1), t2 AS (SELECT 2 AS c2) SELECT (SELECT t1.c1 AS c1 FROM t2 AS t2) AS _col_0 FROM t1 AS t1;

SELECT a FROM (SELECT a FROM x) WHERE a IN (SELECT b FROM (SELECT b FROM y));
SELECT _q_1.a AS a FROM (SELECT x.a AS a FROM x AS x) AS _q_1 WHERE _q_1.a IN (SELECT _q_0.b AS b FROM (SELECT y.b AS b FROM y AS y) AS _q_0);

# dialect: mysql
# execute: false
SELECT * FROM table_a as A WHERE A.col1 IN (SELECT MAX(B.col2) FROM table_b as B UNION ALL SELECT MAX(C.col2) FROM table_b as C);
SELECT * FROM table_a AS `A` WHERE `A`.col1 IN (SELECT MAX(`B`.col2) AS _col_0 FROM table_b AS `B` UNION ALL SELECT MAX(`C`.col2) AS _col_0 FROM table_b AS `C`);

--------------------------------------
-- Correlated subqueries
--------------------------------------
SELECT a FROM x WHERE b IN (SELECT c FROM y WHERE y.b = x.a);
SELECT x.a AS a FROM x AS x WHERE x.b IN (SELECT y.c AS c FROM y AS y WHERE y.b = x.a);

SELECT a FROM x WHERE b IN (SELECT c FROM y WHERE y.b = a);
SELECT x.a AS a FROM x AS x WHERE x.b IN (SELECT y.c AS c FROM y AS y WHERE y.b = x.a);

SELECT a FROM x WHERE b IN (SELECT b FROM y AS x);
SELECT x.a AS a FROM x AS x WHERE x.b IN (SELECT x.b AS b FROM y AS x);

SELECT a FROM x AS i WHERE b IN (SELECT b FROM y AS j WHERE j.b IN (SELECT c FROM y AS k WHERE k.b = j.b));
SELECT i.a AS a FROM x AS i WHERE i.b IN (SELECT j.b AS b FROM y AS j WHERE j.b IN (SELECT k.c AS c FROM y AS k WHERE k.b = j.b));

# execute: false
SELECT (SELECT n.a FROM n WHERE n.id = m.id) FROM m AS m;
SELECT (SELECT n.a AS a FROM n AS n WHERE n.id = m.id) AS _col_0 FROM m AS m;

--------------------------------------
-- Expand *
--------------------------------------
SELECT * FROM x;
SELECT x.a AS a, x.b AS b FROM x AS x;

SELECT x.* FROM x;
SELECT x.a AS a, x.b AS b FROM x AS x;

SELECT * FROM x JOIN y ON x.b = y.b;
SELECT x.a AS a, x.b AS b, y.b AS b, y.c AS c FROM x AS x JOIN y AS y ON x.b = y.b;

SELECT x.* FROM x JOIN y ON x.b = y.b;
SELECT x.a AS a, x.b AS b FROM x AS x JOIN y AS y ON x.b = y.b;

SELECT x.*, y.* FROM x JOIN y ON x.b = y.b;
SELECT x.a AS a, x.b AS b, y.b AS b, y.c AS c FROM x AS x JOIN y AS y ON x.b = y.b;

SELECT a FROM (SELECT * FROM x);
SELECT _q_0.a AS a FROM (SELECT x.a AS a, x.b AS b FROM x AS x) AS _q_0;

SELECT * FROM (SELECT a FROM x);
SELECT _q_0.a AS a FROM (SELECT x.a AS a FROM x AS x) AS _q_0;

SELECT * FROM x GROUP BY 1, 2;
SELECT x.a AS a, x.b AS b FROM x AS x GROUP BY x.a, x.b;

SELECT * FROM (SELECT * FROM x) AS s(a, b);
SELECT s.a AS a, s.b AS b FROM (SELECT x.a AS a, x.b AS b FROM x AS x) AS s;

# execute: false
SELECT * FROM (SELECT * FROM t) AS s(a, b);
SELECT s.a AS a, s.b AS b FROM (SELECT t.a AS a, t.b AS b FROM t AS t) AS s;

# execute: false
SELECT * FROM (SELECT * FROM t1 UNION ALL SELECT * FROM t2) AS s(b);
SELECT s.b AS b FROM (SELECT t1.b AS b FROM t1 AS t1 UNION ALL SELECT t2.b AS b FROM t2 AS t2) AS s;

# dialect: bigquery
# execute: false
WITH tbl1 AS (SELECT STRUCT(1 AS col1, 2 AS col2, Struct("test" AS col1, Struct(3 AS col2) AS lvl2) AS lvl1) AS col), tbl2 AS (SELECT STRUCT(1 AS col1, 2 AS col2, Struct("test" AS col1, Struct(3 AS col2) AS lvl2) AS lvl1) AS col) SELECT tbl1.col.*, tbl2.col.* FROM tbl1, tbl2;
WITH tbl1 AS (SELECT STRUCT(1 AS col1, 2 AS col2, Struct('test' AS col1, Struct(3 AS col2) AS lvl2) AS lvl1) AS col), tbl2 AS (SELECT STRUCT(1 AS col1, 2 AS col2, Struct('test' AS col1, Struct(3 AS col2) AS lvl2) AS lvl1) AS col) SELECT tbl1.col.col1 AS col1, tbl1.col.col2 AS col2, tbl1.col.lvl1 AS lvl1, tbl2.col.col1 AS col1, tbl2.col.col2 AS col2, tbl2.col.lvl1 AS lvl1 FROM tbl1 AS tbl1 CROSS JOIN tbl2 AS tbl2;

# dialect: bigquery
# execute: false
WITH tbl1 AS (SELECT STRUCT(1 AS col1, 2 AS col2, Struct("test" AS col1, Struct(3 AS col2) AS lvl2) AS lvl1, 3 AS col3) AS col) SELECT tbl1.col.lvl1.* FROM tbl1;
WITH tbl1 AS (SELECT STRUCT(1 AS col1, 2 AS col2, Struct('test' AS col1, Struct(3 AS col2) AS lvl2) AS lvl1, 3 AS col3) AS col) SELECT tbl1.col.lvl1.col1 AS col1, tbl1.col.lvl1.lvl2 AS lvl2 FROM tbl1 AS tbl1;

# dialect: bigquery
# execute: false
# title: Cannot expand struct star with unnamed fields
WITH tbl1 AS (SELECT STRUCT(1 AS col1, Struct(5 AS col1)) AS col) SELECT tbl1.col.* FROM tbl1;
WITH tbl1 AS (SELECT STRUCT(1 AS col1, Struct(5 AS col1)) AS col) SELECT tbl1.col.* FROM tbl1 AS tbl1;

# dialect: bigquery
# execute: false
# title: Cannot expand struct star with ambiguous fields
WITH tbl1 AS (SELECT STRUCT(1 AS col1, 2 AS col1) AS col) SELECT tbl1.col.* FROM tbl1;
WITH tbl1 AS (SELECT STRUCT(1 AS col1, 2 AS col1) AS col) SELECT tbl1.col.* FROM tbl1 AS tbl1;

# dialect: bigquery
# execute: false
# title: BigQuery - Expand struct literal
WITH tbl1 AS (SELECT STRUCT(1 AS f0, 2 as f1) AS col) SELECT tbl1.col.* from tbl1;
WITH tbl1 AS (SELECT STRUCT(1 AS f0, 2 AS f1) AS col) SELECT tbl1.col.f0 AS f0, tbl1.col.f1 AS f1 FROM tbl1 AS tbl1;

# dialect: bigquery
# execute: false
# title: BigQuery - Expand top level nested struct
SELECT one.* FROM structs;
SELECT structs.one.a_1 AS a_1, structs.one.b_1 AS b_1 FROM structs AS structs;

# dialect: risingwave
# execute: false
# title: RisingWave - Expand top level nested struct
SELECT (one).* FROM structs;
SELECT (structs.one).a_1 AS a_1, (structs.one).b_1 AS b_1 FROM structs AS structs;

# dialect: risingwave
# execute: false
# title: RisingWave - Preserve struct field identifier quotes
SELECT (quoted).* FROM structs;
SELECT (structs.quoted)."foo bar" AS "foo bar" FROM structs AS structs;

# dialect: bigquery
# execute: false
# title: BigQuery - Expand midlevel struct
SELECT nested_0.nested_1.* FROM structs;
SELECT structs.nested_0.nested_1.a_2 AS a_2, structs.nested_0.nested_1.nested_2 AS nested_2 FROM structs AS structs;

# dialect: risingwave
# execute: false
# title: RisingWave - Expand midlevel struct
SELECT ((nested_0).nested_1).* FROM structs;
SELECT ((structs.nested_0).nested_1).a_2 AS a_2, ((structs.nested_0).nested_1).nested_2 AS nested_2 FROM structs AS structs;

# title: CSV files are not scanned by default
# execute: false
SELECT * FROM READ_CSV('file.csv');
SELECT * FROM READ_CSV('file.csv') AS _q_0;

# dialect: clickhouse
# Title: Expand tuples in VALUES using the structure provided
# execute: false
SELECT * FROM VALUES ('person String, place String', ('Noah', 'Paris'));
SELECT _q_0.person AS person, _q_0.place AS place FROM VALUES ('person String, place String', ('Noah', 'Paris')) AS _q_0(person, place);

# dialect: clickhouse
# Title: Expand tuples in VALUES using the default naming scheme in CH
# execute: false
SELECT * FROM VALUES ((1, 1), (2, 2));
SELECT _q_0.c1 AS c1, _q_0.c2 AS c2 FROM VALUES ((1, 1), (2, 2)) AS _q_0(c1, c2);

# dialect: clickhouse
# Title: Expand fields in VALUES using the default naming scheme in CH
# execute: false
SELECT * FROM VALUES (1, 2, 3);
SELECT _q_0.c1 AS c1 FROM VALUES ((1), (2), (3)) AS _q_0(c1);

# title: Expand PIVOT column combinations
# dialect: duckdb
WITH cities AS (SELECT * FROM (VALUES ('nl', 'amsterdam', 2000, 1005)) AS t(country, name, year, population)) SELECT * FROM cities PIVOT(SUM(population) AS total, COUNT(population) AS count FOR country IN ('nl', 'us') year IN (2000, 2010) name IN ('amsterdam', 'seattle'));
WITH cities AS (SELECT t.country AS country, t.name AS name, t.year AS year, t.population AS population FROM (VALUES ('nl', 'amsterdam', 2000, 1005)) AS t(country, name, year, population)) SELECT _q_0.nl_2000_amsterdam_total AS nl_2000_amsterdam_total, _q_0.nl_2000_amsterdam_count AS nl_2000_amsterdam_count, _q_0.nl_2000_seattle_total AS nl_2000_seattle_total, _q_0.nl_2000_seattle_count AS nl_2000_seattle_count, _q_0.nl_2010_amsterdam_total AS nl_2010_amsterdam_total, _q_0.nl_2010_amsterdam_count AS nl_2010_amsterdam_count, _q_0.nl_2010_seattle_total AS nl_2010_seattle_total, _q_0.nl_2010_seattle_count AS nl_2010_seattle_count, _q_0.us_2000_amsterdam_total AS us_2000_amsterdam_total, _q_0.us_2000_amsterdam_count AS us_2000_amsterdam_count, _q_0.us_2000_seattle_total AS us_2000_seattle_total, _q_0.us_2000_seattle_count AS us_2000_seattle_count, _q_0.us_2010_amsterdam_total AS us_2010_amsterdam_total, _q_0.us_2010_amsterdam_count AS us_2010_amsterdam_count, _q_0.us_2010_seattle_total AS us_2010_seattle_total, _q_0.us_2010_seattle_count AS us_2010_seattle_count FROM cities AS cities PIVOT(SUM(population) AS total, COUNT(population) AS count FOR country IN ('nl', 'us') year IN (2000, 2010) name IN ('amsterdam', 'seattle')) AS _q_0;

--------------------------------------
-- CTEs
--------------------------------------
WITH z AS (SELECT x.a AS a FROM x) SELECT z.a AS a FROM z;
WITH z AS (SELECT x.a AS a FROM x AS x) SELECT z.a AS a FROM z AS z;

WITH z(a) AS (SELECT a FROM x) SELECT * FROM z;
WITH z AS (SELECT x.a AS a FROM x AS x) SELECT z.a AS a FROM z AS z;

WITH z AS (SELECT a FROM x) SELECT * FROM z as q;
WITH z AS (SELECT x.a AS a FROM x AS x) SELECT q.a AS a FROM z AS q;

WITH z AS (SELECT a FROM x) SELECT * FROM z;
WITH z AS (SELECT x.a AS a FROM x AS x) SELECT z.a AS a FROM z AS z;

WITH z AS (SELECT a FROM x), q AS (SELECT * FROM z) SELECT * FROM q;
WITH z AS (SELECT x.a AS a FROM x AS x), q AS (SELECT z.a AS a FROM z AS z) SELECT q.a AS a FROM q AS q;

WITH z AS (SELECT * FROM x) SELECT * FROM z UNION SELECT * FROM z ORDER BY a, b;
WITH z AS (SELECT x.a AS a, x.b AS b FROM x AS x) SELECT z.a AS a, z.b AS b FROM z AS z UNION SELECT z.a AS a, z.b AS b FROM z AS z ORDER BY a, b;

WITH z AS (SELECT * FROM x), q AS (SELECT b FROM z) SELECT b FROM q;
WITH z AS (SELECT x.a AS a, x.b AS b FROM x AS x), q AS (SELECT z.b AS b FROM z AS z) SELECT q.b AS b FROM q AS q;

WITH z AS ((SELECT b FROM x UNION ALL SELECT b FROM y) ORDER BY b) SELECT * FROM z;
WITH z AS ((SELECT x.b AS b FROM x AS x UNION ALL SELECT y.b AS b FROM y AS y) ORDER BY b) SELECT z.b AS b FROM z AS z;

WITH cte(x) AS (SELECT 1) SELECT * FROM cte AS cte(a);
WITH cte AS (SELECT 1 AS x) SELECT cte.a AS a FROM cte AS cte(a);

WITH cte(x, y) AS (SELECT 1, 2) SELECT cte.* FROM cte AS cte(a);
WITH cte AS (SELECT 1 AS x, 2 AS y) SELECT cte.a AS a, cte.y AS y FROM cte AS cte(a);

-- Cannot pop table column aliases for recursive ctes (redshift).
WITH RECURSIVE cte(x) AS (SELECT 1), cte2(y) AS (SELECT 2) SELECT * FROM cte, cte2;
WITH RECURSIVE cte(x) AS (SELECT 1 AS x), cte2(y) AS (SELECT 2 AS y) SELECT cte.x AS x, cte2.y AS y FROM cte AS cte, cte2 AS cte2;

# execute: false
WITH player AS (SELECT player.name, player.asset.info FROM players) SELECT * FROM player;
WITH player AS (SELECT players.player.name AS name, players.player.asset.info AS info FROM players AS players) SELECT player.name AS name, player.info AS info FROM player AS player;

--------------------------------------
-- Except, Replace, Rename
--------------------------------------
# execute: false
SELECT * RENAME(a AS d) FROM x;
SELECT x.a AS d, x.b AS b FROM x AS x;

# execute: false
SELECT * EXCEPT(b) RENAME(a AS d) FROM x;
SELECT x.a AS d FROM x AS x;

SELECT x.* EXCEPT(a), y.* FROM x, y;
SELECT x.b AS b, y.b AS b, y.c AS c FROM x AS x, y AS y;

SELECT * EXCEPT(a) FROM x;
SELECT x.b AS b FROM x AS x;

# execute: false
SELECT * EXCEPT(x.a) FROM x AS x;
SELECT x.b AS b FROM x AS x;

# execute: false
# note: this query would fail in the engine level because there are 0 selected columns
SELECT * EXCEPT (a, b) FROM x;
SELECT * EXCEPT (a, b) FROM x AS x;

SELECT x.a, * EXCEPT (a) FROM x AS x LEFT JOIN x AS y USING (a);
SELECT x.a AS a, x.b AS b, y.b AS b FROM x AS x LEFT JOIN x AS y ON x.a = y.a;

SELECT COALESCE(CAST(t1.a AS VARCHAR), '') AS a, t2.* EXCEPT (a) FROM x AS t1, x AS t2;
SELECT COALESCE(CAST(t1.a AS VARCHAR), '') AS a, t2.b AS b FROM x AS t1, x AS t2;

# execute: false
SELECT * REPLACE(2 AS a) FROM x;
SELECT 2 AS a, x.b AS b FROM x AS x;

# execute: false
SELECT * EXCEPT (a, b) REPLACE (a AS a) FROM x;
SELECT * EXCEPT (a, b) REPLACE (x.a AS a) FROM x AS x;

# execute: false
SELECT * REPLACE(COALESCE(b, a) AS a, a as b) FROM x;
SELECT COALESCE(x.b, x.a) AS a, x.a AS b FROM x AS x;

# execute: false
SELECT * REPLACE(1 AS a) RENAME(b as alias_b) FROM x;
SELECT 1 AS a, x.b AS alias_b FROM x AS x;

# execute: false
SELECT * EXCEPT(a) REPLACE(COALESCE(a, b) AS b) RENAME(b AS new_b) FROM x;
SELECT COALESCE(x.a, x.b) AS new_b FROM x AS x;

# execute: false
SELECT * REPLACE(1 AS a, a AS b) RENAME(b AS new_b) FROM x;
SELECT 1 AS a, x.a AS new_b FROM x AS x;

--------------------------------------
-- Using
--------------------------------------
SELECT x.b FROM x JOIN y USING (b);
SELECT x.b AS b FROM x AS x JOIN y AS y ON x.b = y.b;

# execute: false
WITH cte AS (SELECT a.b.c.d.f.g FROM tbl1) SELECT g FROM (SELECT g FROM tbl2) tbl2 JOIN cte USING(g);
WITH cte AS (SELECT tbl1.a.b.c.d.f.g AS g FROM tbl1 AS tbl1) SELECT COALESCE(tbl2.g, cte.g) AS g FROM (SELECT tbl2.g AS g FROM tbl2 AS tbl2) AS tbl2 JOIN cte AS cte ON tbl2.g = cte.g;

SELECT x.b FROM x JOIN y USING (b) JOIN z USING (b);
SELECT x.b AS b FROM x AS x JOIN y AS y ON x.b = y.b JOIN z AS z ON x.b = z.b;

SELECT b FROM x AS x2 JOIN y AS y2 USING (b);
SELECT COALESCE(x2.b, y2.b) AS b FROM x AS x2 JOIN y AS y2 ON x2.b = y2.b;

SELECT b FROM x JOIN y USING (b) WHERE b = 1 and y.b = 2;
SELECT COALESCE(x.b, y.b) AS b FROM x AS x JOIN y AS y ON x.b = y.b WHERE COALESCE(x.b, y.b) = 1 AND y.b = 2;

SELECT b FROM x JOIN y USING (b) JOIN z USING (b);
SELECT COALESCE(x.b, y.b, z.b) AS b FROM x AS x JOIN y AS y ON x.b = y.b JOIN z AS z ON x.b = z.b;

SELECT * FROM x JOIN y USING(b);
SELECT x.a AS a, COALESCE(x.b, y.b) AS b, y.c AS c FROM x AS x JOIN y AS y ON x.b = y.b;

SELECT x.* FROM x JOIN y USING(b);
SELECT x.a AS a, COALESCE(x.b, y.b) AS b FROM x AS x JOIN y AS y ON x.b = y.b;

SELECT * FROM x LEFT JOIN y USING(b);
SELECT x.a AS a, COALESCE(x.b, y.b) AS b, y.c AS c FROM x AS x LEFT JOIN y AS y ON x.b = y.b;

SELECT b FROM x JOIN y USING(b);
SELECT COALESCE(x.b, y.b) AS b FROM x AS x JOIN y AS y ON x.b = y.b;

SELECT b, c FROM x JOIN y USING(b);
SELECT COALESCE(x.b, y.b) AS b, y.c AS c FROM x AS x JOIN y AS y ON x.b = y.b;

SELECT b, c FROM y JOIN z USING(b, c);
SELECT COALESCE(y.b, z.b) AS b, COALESCE(y.c, z.c) AS c FROM y AS y JOIN z AS z ON y.b = z.b AND y.c = z.c;

SELECT * FROM y JOIN z USING(b, c);
SELECT COALESCE(y.b, z.b) AS b, COALESCE(y.c, z.c) AS c FROM y AS y JOIN z AS z ON y.b = z.b AND y.c = z.c;

SELECT * FROM y JOIN z USING(b, c) WHERE b = 2 AND c = 3;
SELECT COALESCE(y.b, z.b) AS b, COALESCE(y.c, z.c) AS c FROM y AS y JOIN z AS z ON y.b = z.b AND y.c = z.c WHERE COALESCE(y.b, z.b) = 2 AND COALESCE(y.c, z.c) = 3;

-- We can safely convert `b` to `x.b` in the following two queries, because the original queries
-- would be invalid if `b` also existed in `t`'s schema (which we don't know), due to ambiguity.

# execute: false
SELECT b FROM x JOIN t USING(a);
SELECT x.b AS b FROM x AS x JOIN t AS t ON x.a = t.a;

# execute: false
SELECT b FROM t JOIN x USING(a);
SELECT x.b AS b FROM t AS t JOIN x AS x ON t.a = x.a;

# execute: false
SELECT a FROM t1 JOIN t2 USING(a);
SELECT COALESCE(t1.a, t2.a) AS a FROM t1 AS t1 JOIN t2 AS t2 ON t1.a = t2.a;

WITH m(a) AS (SELECT 1), n(b) AS (SELECT 1) SELECT * FROM m JOIN n AS foo(a) USING (a);
WITH m AS (SELECT 1 AS a), n AS (SELECT 1 AS b) SELECT COALESCE(m.a, foo.a) AS a FROM m AS m JOIN n AS foo(a) ON m.a = foo.a;

# title: coalesce the USING clause's columns (3 joins, 2 join columns)
WITH t1 AS (SELECT 'x' AS id, DATE '2024-01-01' AS foo, 000 AS value), t2 AS (SELECT 'x' AS id, DATE '2024-02-02' AS foo, 123 AS value), t3 AS (SELECT 'x' AS id, DATE '2024-02-02' AS foo, 456 AS value) SELECT * FROM t1 FULL OUTER JOIN t2 USING(id, foo) FULL OUTER JOIN t3 USING(id, foo);
WITH t1 AS (SELECT 'x' AS id, CAST('2024-01-01' AS DATE) AS foo, 000 AS value), t2 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 123 AS value), t3 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 456 AS value) SELECT COALESCE(t1.id, t2.id, t3.id) AS id, COALESCE(t1.foo, t2.foo, t3.foo) AS foo, t1.value AS value, t2.value AS value, t3.value AS value FROM t1 AS t1 FULL OUTER JOIN t2 AS t2 ON t1.id = t2.id AND t1.foo = t2.foo FULL OUTER JOIN t3 AS t3 ON COALESCE(t1.id, t2.id) = t3.id AND COALESCE(t1.foo, t2.foo) = t3.foo;

# title: coalesce the USING clause's columns (3 joins, 3 join columns)
WITH t1 AS (SELECT 'x' AS id, CAST('2024-01-01' AS DATE) AS foo, 000 AS value), t2 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 123 AS value), t3 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 456 AS value) SELECT * FROM t1 FULL OUTER JOIN t2 USING (id, foo, value) FULL OUTER JOIN t3 USING (id, foo, value);
WITH t1 AS (SELECT 'x' AS id, CAST('2024-01-01' AS DATE) AS foo, 000 AS value), t2 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 123 AS value), t3 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 456 AS value) SELECT COALESCE(t1.id, t2.id, t3.id) AS id, COALESCE(t1.foo, t2.foo, t3.foo) AS foo, COALESCE(t1.value, t2.value, t3.value) AS value FROM t1 AS t1 FULL OUTER JOIN t2 AS t2 ON t1.id = t2.id AND t1.foo = t2.foo AND t1.value = t2.value FULL OUTER JOIN t3 AS t3 ON COALESCE(t1.id, t2.id) = t3.id AND COALESCE(t1.foo, t2.foo) = t3.foo AND COALESCE(t1.value, t2.value) = t3.value;

# title: coalesce the USING clause's columns (4 joins, 2 join columns)
WITH t1 AS (SELECT 'x' AS id, CAST('2024-01-01' AS DATE) AS foo, 000 AS value), t2 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 123 AS value), t3 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 456 AS value), t4 AS (SELECT 'x' AS id, CAST('2024-03-03' AS DATE) AS foo, 789 AS value) SELECT * FROM t1 FULL OUTER JOIN t2 USING (id, foo) FULL OUTER JOIN t3 USING (id, foo) FULL OUTER JOIN t4 USING (id, foo);
WITH t1 AS (SELECT 'x' AS id, CAST('2024-01-01' AS DATE) AS foo, 000 AS value), t2 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 123 AS value), t3 AS (SELECT 'x' AS id, CAST('2024-02-02' AS DATE) AS foo, 456 AS value), t4 AS (SELECT 'x' AS id, CAST('2024-03-03' AS DATE) AS foo, 789 AS value) SELECT COALESCE(t1.id, t2.id, t3.id, t4.id) AS id, COALESCE(t1.foo, t2.foo, t3.foo, t4.foo) AS foo, t1.value AS value, t2.value AS value, t3.value AS value, t4.value AS value FROM t1 AS t1 FULL OUTER JOIN t2 AS t2 ON t1.id = t2.id AND t1.foo = t2.foo FULL OUTER JOIN t3 AS t3 ON COALESCE(t1.id, t2.id) = t3.id AND COALESCE(t1.foo, t2.foo) = t3.foo FULL OUTER JOIN t4 AS t4 ON COALESCE(t1.id, t2.id, t3.id) = t4.id AND COALESCE(t1.foo, t2.foo, t3.foo) = t4.foo;

# title: Name anonymous STRUCT fields if replacing USING columns
WITH t1 AS (SELECT 1 AS id), t2 AS (SELECT 2 AS id) SELECT STRUCT(id) AS my_field FROM t1 JOIN t2 USING (id);
WITH t1 AS (SELECT 1 AS id), t2 AS (SELECT 2 AS id) SELECT STRUCT(COALESCE(t1.id, t2.id) AS id) AS my_field FROM t1 AS t1 JOIN t2 AS t2 ON t1.id = t2.id;

# title: Do not rename aliased STRUCT fields if replacing USING columns
WITH t1 AS (SELECT 1 AS id), t2 AS (SELECT 2 AS id) SELECT STRUCT(id AS col) AS my_field FROM t1 JOIN t2 USING (id);
WITH t1 AS (SELECT 1 AS id), t2 AS (SELECT 2 AS id) SELECT STRUCT(COALESCE(t1.id, t2.id) AS col) AS my_field FROM t1 AS t1 JOIN t2 AS t2 ON t1.id = t2.id;

--------------------------------------
-- Hint with table reference
--------------------------------------
# dialect: spark
SELECT /*+ BROADCAST(y) */ x.b FROM x JOIN y ON x.b = y.b;
SELECT /*+ BROADCAST(y) */ x.b AS b FROM x AS x JOIN y AS y ON x.b = y.b;

--------------------------------------
-- UDTF
--------------------------------------
# execute: false
SELECT c FROM x LATERAL VIEW EXPLODE (a) AS c;
SELECT _q_0.c AS c FROM x AS x LATERAL VIEW EXPLODE(x.a) _q_0 AS c;

# execute: false
SELECT c FROM xx LATERAL VIEW EXPLODE (a) AS c;
SELECT _q_0.c AS c FROM xx AS xx LATERAL VIEW EXPLODE(xx.a) _q_0 AS c;

# execute: false
SELECT c FROM x LATERAL VIEW EXPLODE (a) t AS c;
SELECT t.c AS c FROM x AS x LATERAL VIEW EXPLODE(x.a) t AS c;

# execute: false
SELECT aa FROM x, UNNEST(a) AS t(aa);
SELECT t.aa AS aa FROM x AS x, UNNEST(x.a) AS t(aa);

# dialect: bigquery
# execute: false
SELECT aa FROM x, UNNEST(a) AS aa;
SELECT aa AS aa FROM x AS x CROSS JOIN UNNEST(x.a) AS aa;

# dialect: bigquery
# execute: false
select * from unnest ([1, 2]) as x with offset;
SELECT x AS x, offset AS offset FROM UNNEST([1, 2]) AS x WITH OFFSET AS offset;

# dialect: bigquery
# execute: false
select * from unnest ([1, 2]) as x with offset as y;
SELECT x AS x, y AS y FROM UNNEST([1, 2]) AS x WITH OFFSET AS y;

# dialect: bigquery
# execute: false
select x, a, x.a from unnest([STRUCT(1 AS a)]) as x CROSS JOIN m;
SELECT x AS x, a AS a, x.a AS a FROM UNNEST([STRUCT(1 AS a)]) AS x CROSS JOIN m AS m;

# dialect: bigquery
# execute: false
WITH cte AS (SELECT [STRUCT(1 AS a)] AS x) select a, x, m.a from cte, UNNEST(x) AS m CROSS JOIN n;
WITH cte AS (SELECT [STRUCT(1 AS a)] AS x) SELECT a AS a, cte.x AS x, m.a AS a FROM cte AS cte CROSS JOIN UNNEST(cte.x) AS m CROSS JOIN n AS n;

# dialect: presto
SELECT x.a, i.b FROM x CROSS JOIN UNNEST(SPLIT(CAST(b AS VARCHAR), ',')) AS i(b);
SELECT x.a AS a, i.b AS b FROM x AS x CROSS JOIN UNNEST(SPLIT(CAST(x.b AS VARCHAR), ',')) AS i(b);

# execute: false
SELECT c FROM (SELECT 1 a) AS x LATERAL VIEW EXPLODE(a) AS c;
SELECT _q_0.c AS c FROM (SELECT 1 AS a) AS x LATERAL VIEW EXPLODE(x.a) _q_0 AS c;

# execute: false
SELECT * FROM foo(bar) AS t(c1, c2, c3);
SELECT t.c1 AS c1, t.c2 AS c2, t.c3 AS c3 FROM FOO(bar) AS t(c1, c2, c3);

# execute: false
SELECT c1, c3 FROM foo(bar) AS t(c1, c2, c3);
SELECT t.c1 AS c1, t.c3 AS c3 FROM FOO(bar) AS t(c1, c2, c3);

# dialect: redshift
# execute: false
SELECT c.f::VARCHAR(MAX) AS f, e AS e FROM a.b AS c, c.d AS e;
SELECT CAST(c.f AS VARCHAR(MAX)) AS f, e AS e FROM a.b AS c, c.d AS e;

# dialect: bigquery
# execute: false
WITH cte AS (SELECT 1 AS col) SELECT * FROM cte LEFT JOIN UNNEST((SELECT ARRAY_AGG(DISTINCT x) AS agg FROM UNNEST([1]) AS x WHERE col = 1));
WITH cte AS (SELECT 1 AS col) SELECT cte.col AS col, _q_1 AS _q_1 FROM cte AS cte LEFT JOIN UNNEST((SELECT ARRAY_AGG(DISTINCT x) AS agg FROM UNNEST([1]) AS x WHERE cte.col = 1)) AS _q_1;

--------------------------------------
-- Window functions
--------------------------------------
# title: ORDER BY in window function
SELECT a + 1 AS a, ROW_NUMBER() OVER (PARTITION BY b ORDER BY a) AS row_num FROM x ORDER BY a, row_num;
SELECT x.a + 1 AS a, ROW_NUMBER() OVER (PARTITION BY x.b ORDER BY x.a) AS row_num FROM x AS x ORDER BY a, row_num;

# dialect: bigquery
SELECT ROW_NUMBER() OVER (PARTITION BY a ORDER BY b) AS row_num FROM x QUALIFY row_num = 1;
SELECT ROW_NUMBER() OVER (PARTITION BY x.a ORDER BY x.b) AS row_num FROM x AS x QUALIFY ROW_NUMBER() OVER (PARTITION BY x.a ORDER BY x.b) = 1;

# dialect: bigquery
SELECT x.b, x.a FROM x LEFT JOIN y ON x.b = y.b QUALIFY ROW_NUMBER() OVER(PARTITION BY x.b ORDER BY x.a DESC) = 1 ORDER BY x.b, x.a;
SELECT x.b AS b, x.a AS a FROM x AS x LEFT JOIN y AS y ON x.b = y.b QUALIFY ROW_NUMBER() OVER (PARTITION BY x.b ORDER BY x.a DESC) = 1 ORDER BY x.b, x.a;

SELECT * FROM x QUALIFY COUNT(a) OVER (PARTITION BY b) > 1;
SELECT x.a AS a, x.b AS b FROM x AS x QUALIFY COUNT(x.a) OVER (PARTITION BY x.b) > 1;

--------------------------------------
-- Expand laterals
--------------------------------------
# execute: false
SELECT 2 AS d, d + 1 FROM x WHERE d = 2 GROUP BY d;
SELECT 2 AS d, 2 + 1 AS _col_1 FROM x AS x WHERE 2 = 2 GROUP BY 1;

# title: expand alias reference
SELECT
  x.a + 1 AS i,
  i + 1 AS j,
  j + 1 AS k
FROM x;
SELECT x.a + 1 AS i, x.a + 1 + 1 AS j, x.a + 1 + 1 + 1 AS k FROM x AS x;

# title: noop - reference comes before alias
# execute: false
# validate_qualify_columns: false
SELECT i + 1 AS j, x.a + 1 AS i FROM x;
SELECT i + 1 AS j, x.a + 1 AS i FROM x AS x;

# title: subquery
SELECT
  *
FROM (
  SELECT
    x.a + 1 AS i,
    i + 1 AS j
  FROM x
);
SELECT _q_0.i AS i, _q_0.j AS j FROM (SELECT x.a + 1 AS i, x.a + 1 + 1 AS j FROM x AS x) AS _q_0;

# title: wrap expanded alias to ensure operator precedence isnt broken
# execute: false
SELECT x.a + x.b AS f, f * x.b FROM x;
SELECT x.a + x.b AS f, (x.a + x.b) * x.b AS _col_1 FROM x AS x;

# title: no need to wrap expanded alias
# execute: false
SELECT x.a + x.b AS f, f, f + 5 FROM x;
SELECT x.a + x.b AS f, x.a + x.b AS _col_1, x.a + x.b + 5 AS _col_2 FROM x AS x;

# title: expand double agg if window func
SELECT a, SUM(b) AS c, SUM(c) OVER(PARTITION BY a) AS d from x group by 1 ORDER BY a;
SELECT x.a AS a, SUM(x.b) AS c, SUM(SUM(x.b)) OVER (PARTITION BY x.a) AS d FROM x AS x GROUP BY x.a ORDER BY a;

# title: we can't expand aliases corresponding to recursive CTE columns (CTE names output columns)
# execute: false
WITH RECURSIVE t(c) AS (SELECT 1 AS c UNION ALL SELECT c + 1 AS c FROM t WHERE c <= 10) SELECT c FROM t;
WITH RECURSIVE t(c) AS (SELECT 1 AS c UNION ALL SELECT t.c + 1 AS c FROM t AS t WHERE t.c <= 10) SELECT t.c AS c FROM t AS t;

# title: we can't expand aliases corresponding to recursive CTE columns (CTE doesn't name output columns)
# execute: false
WITH RECURSIVE t AS (SELECT 1 AS c UNION ALL SELECT c + 1 AS c FROM t WHERE c <= 10) SELECT c FROM t;
WITH RECURSIVE t AS (SELECT 1 AS c UNION ALL SELECT t.c + 1 AS c FROM t AS t WHERE t.c <= 10) SELECT t.c AS c FROM t AS t;

# title: expand DISTINCT ON ordinals / projection names
SELECT DISTINCT ON (new_col, b + 1, 1) t1.a AS new_col FROM x AS t1 ORDER BY new_col;
SELECT DISTINCT ON (new_col, t1.b + 1, new_col) t1.a AS new_col FROM x AS t1 ORDER BY new_col;

# title: Oracle does not support lateral alias expansion
# dialect: oracle
# execute: false
SELECT a AS b, b AS a FROM c;
SELECT C.A AS B, C.B AS A FROM C C;

--------------------------------------
-- Wrapped tables / join constructs
--------------------------------------
# execute: false
SELECT * FROM ((tbl));
SELECT * FROM ((tbl AS tbl));

SELECT a, c FROM (x LEFT JOIN y ON a = c);
SELECT x.a AS a, y.c AS c FROM (x AS x LEFT JOIN y AS y ON x.a = y.c);

# execute: false
SELECT * FROM ((a CROSS JOIN ((b CROSS JOIN c) CROSS JOIN (d CROSS JOIN e))));
SELECT * FROM ((a AS a CROSS JOIN ((b AS b CROSS JOIN c AS c) CROSS JOIN (d AS d CROSS JOIN e AS e))));

# execute: false
SELECT * FROM ((SELECT * FROM tbl));
SELECT * FROM ((SELECT * FROM tbl AS tbl) AS _q_0);

# execute: false
SELECT * FROM ((SELECT c FROM t1) CROSS JOIN t2);
SELECT * FROM ((SELECT t1.c AS c FROM t1 AS t1) AS _q_0 CROSS JOIN t2 AS t2);

# execute: false
SELECT * FROM ((SELECT * FROM x) INNER JOIN y ON a = c);
SELECT y.b AS b, y.c AS c, _q_0.a AS a, _q_0.b AS b FROM ((SELECT x.a AS a, x.b AS b FROM x AS x) AS _q_0 INNER JOIN y AS y ON _q_0.a = y.c);

SELECT x.a, y.b, z.c FROM x LEFT JOIN (y INNER JOIN z ON y.c = z.c) ON x.b = y.b;
SELECT x.a AS a, y.b AS b, z.c AS c FROM x AS x LEFT JOIN (y AS y INNER JOIN z AS z ON y.c = z.c) ON x.b = y.b;

SELECT * FROM ((SELECT * FROM x) INNER JOIN (SELECT * FROM y) ON a = c);
SELECT _q_0.a AS a, _q_0.b AS b, _q_1.b AS b, _q_1.c AS c FROM ((SELECT x.a AS a, x.b AS b FROM x AS x) AS _q_0 INNER JOIN (SELECT y.b AS b, y.c AS c FROM y AS y) AS _q_1 ON _q_0.a = _q_1.c);

SELECT b FROM ((SELECT a FROM x) INNER JOIN y ON a = b);
SELECT y.b AS b FROM ((SELECT x.a AS a FROM x AS x) AS _q_0 INNER JOIN y AS y ON _q_0.a = y.b);

SELECT a, c FROM x TABLESAMPLE SYSTEM (10 ROWS) CROSS JOIN y TABLESAMPLE SYSTEM (10 ROWS);
SELECT x.a AS a, y.c AS c FROM x AS x TABLESAMPLE SYSTEM (10 ROWS) CROSS JOIN y AS y TABLESAMPLE SYSTEM (10 ROWS);

--------------------------------------
-- Snowflake allows column alias to be used in almost all clauses
--------------------------------------
# title: Snowflake column alias in JOIN
# dialect: snowflake
# execute: false
SELECT x.a AS foo FROM x JOIN y ON foo = y.b;
SELECT X.A AS FOO FROM X AS X JOIN Y AS Y ON X.A = Y.B;

# title: Snowflake column alias in QUALIFY
# dialect: snowflake
# execute: false
SELECT x.a AS foo FROM x QUALIFY foo = 1;
SELECT X.A AS FOO FROM X AS X QUALIFY X.A = 1;

# title: Snowflake column alias in GROUP BY
# dialect: snowflake
# execute: false
SELECT x.a AS foo FROM x GROUP BY foo = 1;
SELECT X.A AS FOO FROM X AS X GROUP BY X.A = 1;

# title: Snowflake column alias in WHERE
# dialect: snowflake
# execute: false
SELECT x.a AS foo FROM x WHERE foo = 1;
SELECT X.A AS FOO FROM X AS X WHERE X.A = 1;


--------------------------------------
-- SEMI / ANTI Joins
--------------------------------------

# title: SEMI JOIN table is excluded from the scope
SELECT * FROM x SEMI JOIN y USING (b);
SELECT x.a AS a, x.b AS b FROM x AS x SEMI JOIN y AS y ON x.b = y.b;

# title: ANTI JOIN table is excluded from the scope
SELECT * FROM x ANTI JOIN y USING (b);
SELECT x.a AS a, x.b AS b FROM x AS x ANTI JOIN y AS y ON x.b = y.b;

# title: SEMI + normal joins reinclude the table on scope
SELECT * FROM x SEMI JOIN y USING (b) JOIN y USING (b);
SELECT x.a AS a, COALESCE(x.b, y_2.b) AS b, y_2.c AS c FROM x AS x SEMI JOIN y AS y ON x.b = y.b JOIN y AS y_2 ON x.b = y_2.b;

# title: ANTI + normal joins reinclude the table on scope
SELECT * FROM x ANTI JOIN y USING (b) JOIN y USING (b);
SELECT x.a AS a, COALESCE(x.b, y_2.b) AS b, y_2.c AS c FROM x AS x ANTI JOIN y AS y ON x.b = y.b JOIN y AS y_2 ON x.b = y_2.b;
