[createBatch]
update 
	sms_forupload aa, 
	(
		select fu.objid, sms.dtfiled  
		from sms_forupload fu, sms 
		where fu.dtretry <= $P{rundate} 
			and sms.objid = fu.objid 
			and fu.lockid IS NULL 
		order by sms.dtfiled 
		limit 10 
	)bb 
set aa.lockid = $P{batchid} 
where aa.objid = bb.objid 

[getBatch]
select fu.*, sms.dtfiled 
from sms_forupload fu, sms 
where fu.lockid = $P{batchid} 
	and sms.objid = fu.objid
order by sms.dtfiled 

[findByObjid]
select sms.*, fu.dtretry, fu.retrycount, fu.dtexpiry, 
	(case when fu.dtretry <= fu.dtexpiry then 0 else 1 end) as expired 
from sms_forupload fu, sms 
where fu.objid = $P{objid} 
	and sms.objid = fu.objid
