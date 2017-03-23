create trigger protectionTrigger on [dbo].[PAYCHECK]
instead of delete
as 
	declare @id varchar(15);
	declare @amount char(10);
	declare @accnt_no char(10);
	declare @essn char(10);
	declare @owner_ssn char(9);

	select @id=d.id from deleted d;
	select @amount=d.amount from deleted d;
	select @accnt_no=d.accnt_no from deleted d;
	select @essn=d.essn from deleted d;
	select @owner_ssn=d.owner_ssn from deleted d;

	begin
		if(@amount>3000)
		begin
			RAISERROR('invalid action',16,1);
			ROLLBACK;
		end
		else
		begin
			delete from PAYCHECK where id=@id;
			COMMIT;
			insert into PAYCHECK
			(id,amount,accnt_no,essn,owner_ssn)
			values(@id,@amount,@accnt_no,@essn,@owner_ssn);
			PRINT 'record deleted due to deletion trigger'
		end
	END
GO

CREATE TRIGGER trgAfterInsert ON [dbo].[PAYCHECK] 
FOR INSERT
AS
	declare @id varchar(15);
	declare @amount char(10);
	declare @accnt_no char(10);
	declare @essn char(10);
	declare @owner_ssn char(9);
	declare @audit_action varchar(100);

	select @id=i.id from inserted i;
	select @amount=i.amount from inserted i;
	select @accnt_no=i.accnt_no from inserted i;
	select @essn=i.essn from inserted i;
	select @owner_ssn=i.owner_ssn from inserted i;
	set @audit_action = 'Insertion record due to trigger';

	insert into PAYCHECK_AUDIT
           (id,amount,accnt_no,essn,owner_ssn,audit_action,audit_date) 
	values(@id,@amount,@accnt_no,@essn,@owner_ssn,@audit_action,getdate());

	PRINT 'AFTER INSERT ACTIVATED'
GO