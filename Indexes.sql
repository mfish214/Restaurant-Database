/*It may be necessary to find a specific restaurant based off of who owns it.
Create an index for this case*/
CREATE Index IX_RESTAURANT_OWNER
ON RESTAURANT (owner_ssn ASC);

/*Ordering restaurant by name may be necessary if location unknown/unavailable*/
CREATE Index IX_RESTAURANT_NAME
ON RESTAURANT (Restaurant_name ASC);

/*Employees should be sorted such that you can group them by their specific
restaurant location*/
CREATE Index IX_EMPLOYEE_BY_RESTAURANT
ON EMPLOYEE (rest_location ASC);

/*Paychecks over specific amounts may be searched for. In this case,
we will want the paychecks ordered by amount*/
CREATE Index IX_PAYCHECK_AMOUNT
ON PAYCHECK (amount ASC);

/*You may want the last name associated with a reservation in order for
more convenient search*/
CREATE Index IX_RESERVATION_NAME
ON RESERVATIONS (Lname ASC);
