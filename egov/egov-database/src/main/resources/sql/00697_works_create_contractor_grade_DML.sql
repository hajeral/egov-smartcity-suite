insert into EG_MODULE (ID,NAME,ENABLED,CONTEXTROOT,PARENTMODULE,DISPLAYNAME,ORDERNUMBER) VALUES (NEXTVAL('SEQ_EG_MODULE'),'WorksContractorGradeMaster','true',null,(select id from eg_module where name = 'WorksMasters'),'Contractor Grade', 2);
-- Create Contractor Grade --
Insert into EG_ACTION (ID,NAME,URL,QUERYPARAMS,PARENTMODULE,ORDERNUMBER,DISPLAYNAME,ENABLED,CONTEXTROOT,VERSION,CREATEDBY,CREATEDDATE,LASTMODIFIEDBY,LASTMODIFIEDDATE,APPLICATION) values (NEXTVAL('SEQ_EG_ACTION'),'Create Contractor Grade','/masters/contractorGrade-newform.action',null,(select id from EG_MODULE where name = 'WorksContractorGradeMaster'),1,'Create Contractor Grade','true','egworks',0,1,now(),1,now(),(select id from eg_module  where name = 'Works Management'));
Insert into eg_roleaction (roleid, actionid) values ((select id from eg_role where name = 'Super User'),(select id from eg_action where name ='Create Contractor Grade' and contextroot = 'egworks'));