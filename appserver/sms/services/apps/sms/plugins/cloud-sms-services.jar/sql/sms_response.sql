[success]
update sms set 
	traceid = $P{traceid}, 
	tracemsg = $P{tracemsg}, 
	tracetime = $P{tracetime}, 
	traceinfo = $P{traceinfo}
where 
	objid = $P{objid}


[pending]
update sms set 
	state = $P{state},
	tracemsg = $P{tracemsg}, 
	traceinfo = $P{traceinfo}
where 
	objid = $P{objid}
