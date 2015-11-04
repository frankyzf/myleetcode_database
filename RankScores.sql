#Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.
select Score, Rank from 
(select Score, 
		@rank := @rank + IF(@prevScore = Score, 0, 1) as Rank,
		@prevScore := Score from 
	(select Score from Scores order by Score Desc ) t, (select @rank := 0, @prevScore := NULL) k
	) tt
