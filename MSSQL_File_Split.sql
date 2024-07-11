CREATE TABLE #TempData (
	Oszlop1	NVARCHAR(MAX)
);

BULK INSERT #TempData


FROM 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\TEMP\NavExlcuded2.csv'

WITH (
	FIELDTERMINATOR =',',
	ROWTERMINATOR = '\n',  /* CR LF  */
	FIRSTROW = 1,
	CODEPAGE = '65001' -- UTF-8 karakterkódolás
);


CREATE TABLE #TempCleanedData (
	Oszlop1	NVARCHAR(255),
	Oszlop2	NVARCHAR(255),
	Oszlop3	NVARCHAR(255),
	Oszlop4	NVARCHAR(255),
	Oszlop5	NVARCHAR(255),
	Oszlop6	NVARCHAR(255),
	Oszlop7	NVARCHAR(255)
);


INSERT INTO #TempCleanedData (Oszlop1)
SELECT
    REPLACE(Oszlop1, '"', '') AS Oszlop1
FROM #TempData;


select *,  ROW_NUMBER() OVER (PARTITION BY Oszlop1 ORDER BY (SELECT 1)) AS RowNum
from #TempData

select *
from #TempCleanedData


SELECT Value
FROM #TempCleanedData
CROSS APPLY STRING_SPLIT(Oszlop1, ',');

drop table #TempData

drop table #TempCleanedData