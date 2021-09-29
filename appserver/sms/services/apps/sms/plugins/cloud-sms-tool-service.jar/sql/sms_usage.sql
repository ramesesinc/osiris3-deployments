[getSummary]
select 
	o.acctname as account_name, a.description as account_description, 
	count(distinct o.objid) as txncount, sum(o.credit) as usedcredit
from sms o 
	left join account a on a.name = o.acctname  
where o.dtfiled >= $P{startdate}  
	and o.dtfiled < $P{enddate}  
	and o.state = 'SUCCESS' 
group by o.acctname, a.description 
