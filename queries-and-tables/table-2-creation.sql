-- Performance Rating & Rating Level & Satisfaction Level Table  --
CREATE TABLE `world-bank-group-analysis.datasets.table_2` AS
SELECT
PerformanceID, 
EmployeeID,
ReviewDate, 
E5.SatisfactionLevel AS EnvironmentSatisfaction, 
E6.SatisfactionLevel AS JobSatisfaction, 
E7.SatisfactionLevel AS RelationshipSatisfaction, 
TrainingOpportunitiesWithinYear, 
TrainingOpportunitiesTaken, 
WorkLifeBalance, 
E3.RatingLevel As SelfRating, 
E4.RatingLevel As ManagerRating
FROM `world-bank-group-analysis.datasets.Performance-rating` E2

JOIN `world-bank-group-analysis.datasets.Rating-level` E3
ON E2.SelfRating = E3.RatingID

JOIN `world-bank-group-analysis.datasets.Rating-level` E4
ON E2.ManagerRating = E4.RatingID

JOIN `world-bank-group-analysis.datasets.satisfied-level` E5
ON E2.EnvironmentSatisfaction = E5.SatisfactionID

JOIN `world-bank-group-analysis.datasets.satisfied-level` E6
ON E2.JobSatisfaction = E6.SatisfactionID

JOIN `world-bank-group-analysis.datasets.satisfied-level` E7
ON E2.RelationshipSatisfaction = E7.SatisfactionID;




