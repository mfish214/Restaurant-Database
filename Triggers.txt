/*Create a trigger that will handle the deletion of paychecks*/

create trigger protectionTrigger on [dbo].[PAYCHECK]
instead of delete
as 

	/*declare variables for deletion/insertion on the paycheck table*/
	declare @id varchar(15);
	declare @amount char(10);
	declare @accnt_no char(10);
	declare @essn char(10);
	declare @owner_ssn char(9);

	/*Get the values from the deleted paycheck item*/
	select @id=d.id from deleted d;
	select @amount=d.amount from deleted d;
	select @accnt_no=d.accnt_no from deleted d;
	select @essn=d.essn from deleted d;
	select @owner_ssn=d.owner_ssn from deleted d;

	/*Check whether or not the amount of the paycheck is over $3000*/
	begin
		if(@amount>3000)
		/*If so then cancel the deletion*/
		begin
			RAISERROR('invalid action',16,1);
			ROLLBACK;
		end
		else
		begin
		/*If not then allow the deletion to go through*/
			delete from PAYCHECK where id=@id;
			COMMIT;
			insert into PAYCHECK
			(id,amount,accnt_no,essn,owner_ssn)
			values(@id,@amount,@accnt_no,@essn,@owner_ssn);
			PRINT 'record deleted due to deletion trigger'
		end
	END
GO

/*Deletions of paychecks were tested with different dollar amounts. The deletion
of both types were appropriately handeled*/


/*Create a trigger after paycheck insertion so that an audit may be done*/
CREATE TRIGGER trgAfterInsert ON [dbo].[PAYCHECK] 
FOR INSERT
AS
	/*declare the variables for insertion on the audit table*/
	declare @id varchar(15);
	declare @amount char(10);
	declare @accnt_no char(10);
	declare @essn char(10);
	declare @owner_ssn char(9);
	declare @audit_action varchar(100);

	/*Take values from the recently inserted paycheck*/
	select @id=i.id from inserted i;
	select @amount=i.amount from inserted i;
	select @accnt_no=i.accnt_no from inserted i;
	select @essn=i.essn from inserted i;
	select @owner_ssn=i.owner_ssn from inserted i;
	set @audit_action = 'Insertion record due to trigger';

	/*Insert the information and action into the paycheck audit*/
	insert into PAYCHECK_AUDIT
           (id,amount,accnt_no,essn,owner_ssn,audit_action,audit_date) 
	values(@id,@amount,@accnt_no,@essn,@owner_ssn,@audit_action,getdate());

	PRINT 'AFTER INSERT ACTIVATED'
GO

/*Each paycheck inserted was tested for insertion on the paycheck audit.Results
showed successful implementation of the trigger*/