SELECT 
	D.[Date]
,	D.[Date Key]
,	D.[Calendar Month]
,	D.[Calendar Month Number]
,	D.[Calendar Week in Year]
,	D.[Calendar Week Number in Year]
,	D.[Calendar Year Month Number]
,	D.[Calendar Year Week Number]
,	D.[Calendar Year]
,
	CASE
		WHEN YEAR(D.[Date]) = YEAR(CURRENT_TIMESTAMP) THEN 'Current Calendar Year'
		WHEN YEAR(D.[Date]) = YEAR(CURRENT_TIMESTAMP)-1 THEN 'Prior Calendar Year'
		WHEN YEAR(D.[Date]) = YEAR(CURRENT_TIMESTAMP)-2 THEN '2 Yrs Prior Calendar Year'
		WHEN YEAR(D.[Date]) = YEAR(CURRENT_TIMESTAMP)-3 THEN '3 Yrs Prior Calendar Year'
		ELSE 'Other Calendar Year' 
	END AS [Calendar Year Status]
,
	CASE
		WHEN YEAR(D.[Date]) = YEAR(CURRENT_TIMESTAMP) AND MONTH(D.Date) = MONTH(CURRENT_TIMESTAMP) THEN 'Current Calendar Month'
		WHEN YEAR(D.[Date]) = YEAR(DATEADD(MONTH,-1,CAST(CURRENT_TIMESTAMP AS date))) AND 
		MONTH(D.[Date]) = MONTH(DATEADD(MONTH,-1,CAST(CURRENT_TIMESTAMP AS date))) THEN 'Prior Calendar Month'
		WHEN YEAR(D.[Date]) = YEAR(DATEADD(MONTH,-2,CAST(CURRENT_TIMESTAMP AS date))) AND 
		MONTH(D.[Date]) = MONTH(DATEADD(MONTH,-2,CAST(CURRENT_TIMESTAMP AS date))) THEN '2 Mo Prior Calendar Month'
		WHEN YEAR(D.[Date]) = YEAR(DATEADD(MONTH,-3,CAST(CURRENT_TIMESTAMP AS date))) AND 
		MONTH(D.[Date]) = MONTH(DATEADD(MONTH,-3,CAST(CURRENT_TIMESTAMP AS date))) THEN '3 Mo Prior Calendar Month'
		ELSE 'Other Calendar Month'
	END AS [Calendar Month Status]
,
	CASE	
		WHEN YEAR(D.Date) = YEAR(CURRENT_TIMESTAMP) AND DATEPART(WEEK,D.Date) = DATEPART(WEEK,CURRENT_TIMESTAMP) THEN 'Current Calendar Week'
		WHEN YEAR(D.Date) = YEAR(DATEADD(WEEK,-1,CAST(CURRENT_TIMESTAMP AS date))) AND DATEPART(WEEK,D.Date) = 
		DATEPART(WEEK,DATEADD(WEEK,-1,CAST(CURRENT_TIMESTAMP AS date))) THEN 'Prior Calendar Week'
		WHEN YEAR(D.Date) = YEAR(DATEADD(WEEK,-2,CAST(CURRENT_TIMESTAMP AS date))) AND DATEPART(WEEK,D.Date) = 
		DATEPART(WEEK,DATEADD(WEEK,-2,CAST(CURRENT_TIMESTAMP AS date))) THEN '2 Wk Prior Calendar Week'
		WHEN YEAR(D.Date) = YEAR(DATEADD(WEEK,-3,CAST(CURRENT_TIMESTAMP AS date))) AND DATEPART(WEEK,D.Date) = 
		DATEPART(WEEK,DATEADD(WEEK,-3,CAST(CURRENT_TIMESTAMP AS date))) THEN '3 Wk Prior Calendar Week'
		ELSE 'Other Calendar Week'
	End As [Calendar Week Status]
,	D.[Calendar Yr-Mo]
,	D.[Calendar Yr-Qtr]
,	D.[Calendar Year Quarter Number]
,	D.[Calendar Yr-Wk]
,	D.[Prior Calendar Year Date]
,	D.[Prior Calendar Month Date]
,	D.[Date Number]
,	D.[Fiscal Quarter]
,	D.[Fiscal Period]
,	D.[Calendar Week Ending Date]
,	D.[Weekday Sort]
,	d.[Weekday Abb]
,	d.[Weekday]
,	d.[Fiscal Yr-Wk Sort]
,	d.[Fiscal Yr-Wk]
,	d.[Fiscal Yr-Qtr]
,	d.[Fiscal Yr-Period]
,	d.[Fiscal Yr-Period Sort]
,	d.[Fiscal Year]
,	d.[Fiscal Week Sort]
,	d.[Fiscal Yr-Qtr Sort]
,	d.[Fiscal Date Last Year]
,	d.[Fiscal Week Sequence]
,	d.[Fiscal Week of Period]
,	D.[Full Date Description]
,	D.[Day Number in Calendar Month]
,	D.[Day Number in Calendar Year]
,	D.[Calendar Quarter in Year]
,	D.[Calendar Quarter Number in Year]
,	D.[Weekday Indicator]
,	D.[Holiday Indicator]
,	D.[Calendar Week in Month]
,	DATEADD(YEAR,-1,CAST(CURRENT_TIMESTAMP as date)) as 'One Year Prior Date'
,	D.[DST Flag]
FROM
DBO.DimFinDate as D
WHERE
D.[Calendar Year] >=  DATEPART(YEAR,CURRENT_TIMESTAMP)-3
AND D.Date <= CAST(CURRENT_TIMESTAMP as date);



