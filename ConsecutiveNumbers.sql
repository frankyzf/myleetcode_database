#Write a SQL query to find all numbers that appear at least three times consecutively.
select Distinct Num  as ConsecutiveNums from 
(select Num, count(rank) as Cnt  from 
	(select Num, 
		@rank := @rank + IF(@prevNum=Num, 0, 1) as rank, 
		@prevNum := Num from 
		Logs, (select @rank:=0, @prevNum := NULL) r 
	) t
group by rank having Cnt >= 3
) rt;

