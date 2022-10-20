/**
 * MySQL commands
 */

sudo systemctl restart mysql;

sudo mysql -u root -p;

CREATE DATABASE alexdb;

show databases;

/**** Права доступа пользователей ********************************************************/
select current_user;

CREATE USER 'alex'@'127.0.0.1' identified BY 'qwerty';


ALTER USER 'alex'@'localhost' IDENTIFIED BY 'qwerty';

GRANT ALL PRIVILEGES ON alexdb.*  TO 'alex'@'127.0.0.1';
GRANT ALL PRIVILEGES ON alexdb.*  TO 'alex'@'localhost';

GRANT SELECT ON alexdb.*  TO 'user1'@'localhost';
REVOKE SELECT ON alexdb.*  TO 'user1'@'localhost';

flush PRIVILEGES;

select * from information_schema.user_privileges;

SELECT USER, host FROM mysql.USER;

REVOKE ALL PRIVILEGES ON alexdb.* FROM 'alex'@'127.0.0.1';

SHOW GRANTS FOR 'alex'@'localhost';

SHOW GRANTS;

SHOW GRANTS FOR CURRENT_USER;

SHOW GRANTS FOR CURRENT_USER();

REVOKE UPDATE,INSERT,DELETE,truncate  ON alexdb FROM 'alex'@'%'; -- отозвать права для удалённых подключений.

DROP USER alex;
DROP USER 'alex'@'127.0.0.1';

SHOW PROCESSLIST; -- для удаления
KILL 16;		--  подключенного пользователя под номером 16;

/**** Просмотр таблиц в ДБ **************************************************************************************/
use alexdb;
show tables;
show columns FROM table_name;

/**** Более подробно *********/
select table_schema, table_name, column_name, column_type 
from information_schema.columns where table_schema = 'mysql'
ORDER BY table_name, ordinal_position;

select table_schema, table_name, column_name, column_type 
from information_schema.columns where table_schema = 'information_schema'
ORDER BY table_name, ordinal_position;

select * 
from information_schema.columns where table_schema = 'alexdb'
ORDER BY table_name, ordinal_position;

show columns FROM table_name;
/*************************************************************/

/**** Удаление данных ****************************************/

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE table1;
TRUNCATE table2;

SET FOREIGN_KEY_CHECKS = 1;
/************************************************************/

/**** Просмотр ограничений внешних ключей ***************************************/
SELECT 
  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 'alexdb' AND
  REFERENCED_TABLE_NAME = 'orders';


















