DECLARE @intErrorCode INT
BEGIN TRAN
	UPDATE restaurant.dbo.EMPLOYEE
	SET experience = 3
	WHERE ssn = '666666666'

	SELECT @intErrorCode = @@ERROR
	IF (@intErrorCode <> 0) GOTO PROBLEM

	UPDATE restaurant.dbo.COOK
	SET education = 3
	WHERE ssn = '666666666'

	SELECT @intErrorCode = @@ERROR
	IF (@intErrorCode <> 0) GOTO PROBLEM
COMMIT TRAN
PROBLEM:
IF (@intErrorCode <> 0) BEGIN
PRINT 'Unexpected error occured!'
	ROLLBACK TRAN
END

SELECT 'Before BEGIN TRAN', @@TRANCOUNT
BEGIN TRAN
	SELECT 'After BEGIN TRAN', @@TRANCOUNT
	INSERT INTO restaurant.dbo.EMPLOYEE values ('123456789', '24', '5', '111111111', 'Dallas')

	BEGIN TRAN nested
		SELECT 'After BEGIN TRAN nested', @@TRANCOUNT

		UPDATE restaurant.dbo.EMPLOYEE
		SET experience = 10
		WHERE ssn = '444444444'

	COMMIT TRAN nested

	SELECT 'After COMMIT TRAN nested', @@TRANCOUNT

ROLLBACK TRAN

SELECT 'After ROLLBACK TRAN', @@TRANCOUNT

SELECT * FROM restaurant.dbo.EMPLOYEE

SELECT 'Before BEGIN TRAN', @@TRANCOUNT
BEGIN TRAN main
	SELECT 'After BEGIN TRAN main', @@TRANCOUNT
	INSERT INTO restaurant.dbo.EMPLOYEE values ('234567890', '22', '2', '222222222', 'Houston')
	SAVE TRAN addrec
	SELECT 'After SAVE TRAN addrec', @@TRANCOUNT

	SELECT * FROM restaurant.dbo.EMPLOYEE

	BEGIN TRAN nested
		SELECT 'After BEGIN TRAN nested', @@TRANCOUNT

		UPDATE restaurant.dbo.EMPLOYEE
		SET experience = 9
		WHERE ssn = '555555555'

		SAVE TRAN updaterec
		SELECT 'After SAVE TRAN updaterec'

			SELECT * FROM restaurant.dbo.EMPLOYEE

	ROLLBACK TRAN addrec
	SELECT 'After SAVE TRAN addrec', @@TRANCOUNT

	SELECT * FROM restaurant.dbo.EMPLOYEE

IF (@@TRANCOUNT > 0) BEGIN
	ROLLBACK TRAN
	SELECT 'AFTER ROLLBACK TRAN', @@TRANCOUNT

END
SELECT * FROM restaurant.dbo.EMPLOYEE