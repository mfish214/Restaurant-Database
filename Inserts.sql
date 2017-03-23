/*Insert 3 owners for 3 different restaurants*/

INSERT INTO The_OWNER
VALUES ('Josh','111111111');

INSERT INTO The_OWNER
VALUES ('Andy','222222222');

INSERT INTO The_OWNER
VALUES ('Kyle','333333333');

/*Insert 3 restaurants with location and owner*/

INSERT INTO RESTAURANT
VALUES('Taco Bell','Dallas','111111111');

INSERT INTO RESTAURANT
VALUES('Wendys','Houston','222222222');

INSERT INTO RESTAURANT
VALUES('Subway','Austin','333333333');

/*Insert employees to work at each restaurant*/

INSERT INTO EMPLOYEE
VALUES('444444444','20','4','111111111','Dallas');

INSERT INTO EMPLOYEE
VALUES('555555555','21','3','222222222','Houston');

INSERT INTO EMPLOYEE
VALUES('666666666','20','2','333333333','Austin');

/*Insert funds accounts for the owners of the restaurants*/

INSERT INTO FUNDS_ACCOUNT
VALUES('1111111111','111111111','10000');

INSERT INTO FUNDS_ACCOUNT
VALUES('2222222222','222222222','20000');

INSERT INTO FUNDS_ACCOUNT
VALUES('3333333333','333333333','15000');

/*Insert paychecks from owners to employees*/

INSERT INTO PAYCHECK
VALUES('12345','500','1111111111','444444444','111111111');

INSERT INTO PAYCHECK
VALUES('23456','400','2222222222','555555555','222222222');

INSERT INTO PAYCHECK
VALUES('34567','300','3333333333','666666666','333333333');

/*Created a few reservations for some customers*/

INSERT INTO RESERVATIONS
VALUES('1900','Jones','11','Dallas','3');

INSERT INTO RESERVATIONS
VALUES('1800','Smith','22','Dallas','2');

INSERT INTO RESERVATIONS
VALUES('2000','Black','33','Houston','6');

/*Give 2 of the employees waiter status*/

INSERT INTO WAITER
VALUES('444444444','20');

INSERT INTO WAITER
VALUES('555555555','21');

/*Make sure there is a cook for menu creators*/

INSERT INTO COOK
VALUES('666666666','20');

/*Add available tables with the employee and number of seats*/

INSERT INTO AVAILABLE_TABLE
VALUES('444444444','4','11');

INSERT INTO AVAILABLE_TABLE
VALUES('444444444','6','22');

INSERT INTO AVAILABLE_TABLE
VALUES('555555555','8','33');

/*Make specific iterations of the menu for each restaurant to use*/

INSERT INTO MENU
VALUES('666666666','11','11');

INSERT INTO MENU
VALUES('666666666','22','22');

INSERT INTO MENU
VALUES('666666666','33','33');

/*Create some online orders for customers*/

INSERT INTO ONLINE_ORDER
VALUES('12345','2 Tacos','11');

INSERT INTO ONLINE_ORDER
VALUES('23456','1 Burger','22');

INSERT INTO ONLINE_ORDER
VALUES('34567','1 Sub','33');

/*Make customers which have processed the online orders at specific restaurants*/

INSERT INTO CUSTOMER
VALUES('12345','3','Dallas','1900','3','12345');

INSERT INTO CUSTOMER
VALUES('23456','2','Dallas','1800','2','23456');

INSERT INTO CUSTOMER
VALUES('34567','6','Houston','2000','6','34567');

/*Have specials, beverages, and regular items for the menu*/

INSERT INTO SPECIAL
VALUES('5.00','11','11','102');

INSERT INTO SPECIAL
VALUES('10.00','22','22','102');

INSERT INTO SPECIAL
VALUES('12.00','33','33','102');

INSERT INTO ALCOHOLIC_BEVERAGE
VALUES('8.00','44','11','4');

INSERT INTO ALCOHOLIC_BEVERAGE
VALUES('7.00','55','22','4');

INSERT INTO ALCOHOLIC_BEVERAGE
VALUES('10.00','66','33','4');

INSERT INTO REGULAR_ITEM
VALUES('4.99','77','11','260');

INSERT INTO REGULAR_ITEM
VALUES('6.99','88','22','260');

INSERT INTO REGULAR_ITEM
VALUES('8.99','99','33','260');