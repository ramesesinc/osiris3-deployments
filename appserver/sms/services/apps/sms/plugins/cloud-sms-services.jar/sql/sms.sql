[getMessagesForUpload]
SELECT sms.*, fu.dtexpiry, fu.dtretry  
FROM sms_forupload fu  
	INNER JOIN sms ON sms.objid=fu.objid 
WHERE fu.dtretry <= $P{rundate} 
	AND fu.dtexpiry >= $P{rundate}  
	AND fu.dtretry <= fu.dtexpiry 
ORDER BY sms.dtfiled 

[findMessageForUpload]
SELECT sms.*, fu.dtexpiry, fu.dtretry 
FROM sms_forupload fu  
	INNER JOIN sms ON sms.objid=fu.objid 
WHERE fu.dtretry <= $P{rundate} 
	AND fu.dtexpiry >= $P{rundate}  
	AND fu.dtretry <= fu.dtexpiry 
ORDER BY sms.dtfiled 

[getExpiredMessages]
SELECT sms.*, fu.dtexpiry, fu.dtretry 
FROM sms_forupload fu  
	INNER JOIN sms ON sms.objid=fu.objid 
WHERE fu.dtexpiry < $P{rundate}  
ORDER BY sms.dtfiled 