------------------START------------------
ALTER TABLE EGW_MILESTONE ADD COLUMN CANCELLATIONREASON varchar(50);
ALTER TABLE EGW_MILESTONE ADD COLUMN CANCELLATIONREMARKS varchar(256);
-------------------END-------------------
--rollback ALTER TABLE EGW_WORKORDER DROP COLUMN CANCELLATIONREMARKS;
--rollback ALTER TABLE EGW_WORKORDER DROP COLUMN CANCELLATIONREASON;