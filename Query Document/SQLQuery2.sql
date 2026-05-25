USE [PANASONY_DB]
GO

/****** Object:  View [dbo].[vw_FactInventoryManagement]    Script Date: 23-05-2026 11:02:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dbo].[vw_FactInventoryManagement] 
AS
SELECT
     d.[YearNumber]
	,d.[QuarterNumber]
	,d.[MonthNumber]
    ,d.[MonthName]
	,CAST(CONCAT(d.YearNumber,RIGHT('00'+CAST(d.MonthNumber AS VARCHAR(2)), 2))AS INT) AS YearMonthKey
	,f.[FactoryCode]
    ,f.[FactoryName]
    ,f.[City]
    ,f.[Country]
    ,f.[Region]
    ,f.[PlantType]
	,p.[SKU]
    ,p.[ProductName]
    ,p.[ModelNumber]
    ,p.[UOM]
    ,p.[BusinessUnitCode]
    ,p.[DivisionName]
    ,p.[CategoryCode]
    ,p.[CategoryName]
    ,p.[SubsCategoryCode]
    ,p.[SubCategoryName]
    ,p.[ProductCategoryCode]
    ,p.[ProductCategoryName]
	,fi.[FactoryKey] 
    ,SUM(fi.[OnHandQty]) AS OnHandQty
    ,SUM(fi.[AvailableQty]) AS AvailableQty
    ,SUM(fi.[ReservedQty]) AS ReservedQty
    ,SUM(fi.[InTransitQty]) AS InTransitQty
    ,SUM(fi.[InventoryValue]) AS InventoryValue
	

FROM dbo.FactInventory AS fi
LEFT JOIN dbo.DimDate AS d
ON fi.DateKey = d.DateKey

LEFT JOIN dbo.DimFactory AS f
ON fi.FactoryKey = f.FactoryKey

LEFT JOIN dbo.DimProduct AS p
ON fi.ProductKey = p.ProductKey

GROUP BY
        d.[YearNumber]
	,d.[QuarterNumber]
	,d.[MonthNumber]
    ,d.[MonthName]
	,CAST(CONCAT(d.YearNumber,RIGHT('00'+CAST(d.MonthNumber AS VARCHAR(2)), 2))AS INT)
	,f.[FactoryCode]
    ,f.[FactoryName]
    ,f.[City]
    ,f.[Country]
    ,f.[Region]
    ,f.[PlantType]
	,p.[SKU]
    ,p.[ProductName]
    ,p.[ModelNumber]
    ,p.[UOM]
    ,p.[BusinessUnitCode]
    ,p.[DivisionName]
    ,p.[CategoryCode]
    ,p.[CategoryName]
    ,p.[SubsCategoryCode]
    ,p.[SubCategoryName]
    ,p.[ProductCategoryCode]
    ,p.[ProductCategoryName]
	,fi.[FactoryKey] 
GO

