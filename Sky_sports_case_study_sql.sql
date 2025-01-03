use lk;



-- contains information on each team's performance in each game
select * from `sky part1`;
-- contains overall statistics of each team at the current FIFA World Cup,
select * from `sky sports part2`;



-- "UNIQUE team names"
select distinct(team) as "unique team names" from `sky part1`;

select count( distinct(team)) as total_team from `sky part1`;

-- "name of team which has rank 1 from group 7"
select team from `sky sports part2` ssp where `rank` = 1 and `group` = 7;

-- "count of all teams "
select count(team) from `sky part1` sp ;

-- "matches_played by each team"
select sum(matches_played) as 'matches_played' ,team from `sky sports part2` ssp group by team;

-- "team, percent of wins with respect to matches_played by each team"
select sum(wins)/sum(matches_played)* 100 as wins_percent , team from `sky sports part2` ssp group by team;

-- which team has maximum goals_scored and their count

select  max(goals_scored),team from `sky sports part2` ssp group by team order by max(goals_scored) desc limit 1;

-- percent of draws with respect to matches_played round of to 2 digits by each team
select round(sum(draws)/sum(matches_played)* 100) as 'wins_percent in %' , team from `sky sports part2` ssp group by team;

-- show which team has minimum goals_scored and their count
select  min(goals),team from `sky part1` sp group by team having min(goals) = 1 order by min(goals) asc;

-- show percent of losses with respect to matches_played by each team in ascending order by losses and name the resulting column as losses_percent
select sum(losses)/sum(matches_played)*100 as losses_percent ,team 
from `sky sports part2` ssp group by team order by losses_percent asc;

-- show the average goal_difference 
select avg(goal_difference) as 'average goal_difference', team 
from `sky sports part2` ssp group by team order by avg(goal_difference) desc;

-- show name of the team where points are 0 
select team,points from `sky sports part2` ssp where points = 0;

-- show all data where expected_goal_scored is less than exp_goal_conceded
select * from `sky sports part2` ssp where expected_goal_scored < exp_goal_conceded order by 'rank' asc;

-- show data where exp_goal_difference is in between -0.5 and 0.5
select * from `sky sports part2` ssp where exp_goal_difference between -0.5 and 0.5;

-- show all data in ascending order by exp_goal_difference_per_90
select * from `sky sports part2` ssp order by exp_goal_difference_per_90 asc;




-- contains information on each team's performance in each game
select * from `sky part1`;
-- contains overall statistics of each team at the current FIFA World Cup,
select * from `sky sports part2`;



-- show team which has maximum number of players_used
select max(players_used),team from `sky part1` sp group by team order by max(players_used) desc limit 1;

-- show each team name and avg_age in ascending order by avg_age
select team,avg_age from `sky part1` sp order by avg_age asc; 

-- show average possession of teams 
select avg(possession) from `sky part1` sp ;

-- show team which has played atleast 5 games
select team,matches_played from `sky sports part2` ssp where matches_played >=5;

-- show all data for which minutes is greater than 600
select * from `sky part1` sp where minutes > 600;

-- show team, goals, assists in ascending order by goals
select team,goals,assists from `sky part1` sp order by goals asc; 

-- show team, pens_made, pens_att in descending order by pens_made
select team,pens_made,pens_att from `sky part1` sp order by pens_made desc;

-- show team, cards_yellow, cards_red where cards_red is equal to 1 in ascending order by cards_yellow 
select team, cards_yellow , cards_red 
from `sky part1` sp where cards_red =1 order by cards_yellow asc;

-- show team, goals_per90, assists_per90, goals_assists_per90 in descending order by goals_assists_per90 
select team, goals_per90 , assists_per90 , goals_assists_per90 
from `sky part1` sp order by goals_assists_per90  desc;

-- show team, goals_pens_per90, goals_assists_pens_per90 in ascending order by goals_assists_pens_per90 
select team, goals_per90, goals_assists_pens_per90 
from `sky part1` sp order by goals_assists_pens_per90 asc;

-- show team, shots, shots_on_target, shots_on_target_pct where shots_on_target_pct is less than 30 in ascending order by shots_on_target_pct 
select team, shots, shots_on_target, shots_on_target_pct 
from `sky part1` sp where shots_on_target_pct < 30 order by shots_on_target_pct asc;

-- show team, shots_per90, shots_on_target_per90 for team Belgium
select team, shots_per90, shots_on_target_per90 
from `sky part1` sp where team = 'Belgium' ;



-- show team, goals_per_shot, goals_per_shot_on_target, average_shot_distance in descending order by average_shot_distance
select team, goals_per_shot, goals_per_shot_on_target, average_shot_distance 
from `sky part1` sp order by average_shot_distance desc;

-- show team, errors, touches for which errors is 0 and touches is less than 1500 
select team, errors, touches 
from `sky part1` sp where errors = 0 and touches < 1500;

-- show team, fouls which has maximum number of fouls
select max(fouls) from `sky part1` sp;
select team, fouls 
from `sky part1` sp where fouls in (select max(fouls) from `sky part1` sp);

-- show team, offisdes which has offsides less than 10 or greater than 20
select team,offsides from `sky part1` sp where offsides < 10 or offsides > 20;

-- show team, aerials_won, aerials_lost, aerials_won_pct in descending order by aerials_won_pct 
select team, aerials_won, aerials_lost, aerials_won_pct 
from `sky part1` sp order by aerials_won_pct desc;

-- show number of teams each group has!
select  `group`,count(team) 
from `sky sports part2` ssp group by `group`;

-- show team names group 6 has
select team from `sky sports part2` ssp where `group` = 6;

-- show Australia belongs to which group 
select `group` 
from `sky sports part2` ssp where team = 'Australia'; 

-- show group, average wins by each group 
select `group`, avg(wins) 
from `sky sports part2` ssp group by `group`;

-- show group, maximum expected_goal_scored by each group in ascending order by expected_goal_scored
select `group`, max(expected_goal_scored)
from `sky sports part2` ssp group by `group` order by max(expected_goal_scored) asc;

-- show group, minimum exp_goal_conceded by each group in descending order by exp_goal_conceded 
select `group`,min(exp_goal_conceded)
from `sky sports part2` ssp  group by `group` order by min(exp_goal_conceded) desc;

-- show group, average exp_goal_difference_per_90 for each group in ascending order by exp_goal_difference_per_90 
select `group` , avg(exp_goal_difference_per_90) 
from `sky sports part2` ssp group by `group` order by avg(exp_goal_difference_per_90);

-- show which team has equal number of goals_scored and goals_against 
select team from `sky sports part2` ssp where goals_scored = goals_against;

-- show which team has maximum players_used 
select max(players_used)
from `sky part1` sp;
select team,players_used 
from `sky part1` sp  where players_used in (select max(players_used)
from `sky part1` sp);

-- show team, players_used, avg_age, games, minutes where minutes lessthan 500 and greater than 200 
select team, players_used, avg_age, games, minutes 
from `sky part1` sp where minutes < 500 and minutes >200;

-- show all data of group_stats in ascending order BY points
select * from `sky sports part2` ssp  order by points asc;

-- show ALL UNIQUE team in ascending order by team
select team from `sky part1` sp order by team asc;

-- show average avg_age of each group and arrange it in descending order by avg_age. 
select avg(sp.avg_age) as 'avg_age', ssp.`group` 
from `sky part1` sp inner join `sky sports part2` ssp on sp.team = ssp.team group by ssp.`group` order by avg(sp.avg_age) desc;

-- sum of fouls for each group and arrange it in ascending order by fouls.
select sum(sp.fouls) as 'fouls', ssp.`group` 
from `sky part1` sp inner join `sky sports part2` ssp on sp.team = ssp.team group by ssp.`group` order by sum(sp.fouls) asc;

-- show total number of games for each group and arrange it in descending order by games. 
select sum(sp.games) as total_games, ssp.`group` 
from `sky part1` sp inner join `sky sports part2` ssp on sp.team = ssp.team group by ssp.`group` order by sum(sp.games) desc;

-- show total number of players_used for each group and arrange it in ascending order by players_used. 
select sum(sp.players_used) as total_number_of_player_used, ssp.`group` 
from `sky part1` sp inner join `sky sports part2` ssp on sp.team = ssp.team group by ssp.`group` order by sum(sp.players_used) asc;

-- show total number of offsides for each group and arrange it in ascending order by offsides.
select sum(sp.offsides) as total_number_of_offside, ssp.`group` 
from `sky part1` sp inner join `sky sports part2` ssp on sp.team = ssp.team group by ssp.`group` order by sum(sp.offsides) asc;

-- show average passes_pct for each group and arrange it in descending order by passes_pct.
select avg(sp.passes_pct) as average_passes_pct , ssp.`group` 
from `sky part1` sp inner join `sky sports part2` ssp on sp.team = ssp.team group by ssp.`group` order by avg(sp.passes_pct) desc;

-- show average goals_per90 for each group and arrange it in ascending order by goals_per90.
select avg(sp.goals_per90) as average_goals_per90 , ssp.`group` 
from `sky part1` sp inner join `sky sports part2` ssp on sp.team = ssp.team group by ssp.`group` order by avg(sp.goals_per90) asc;










































