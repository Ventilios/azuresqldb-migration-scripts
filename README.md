# azuresqldb-migration-scripts
Situations with extreme amount of objects or data might not fit the out-of-the-box Microsoft tools. 
This repository contains some notes and ideas on moving data and deploying schema's separately purely focussed on Azure SQL Single Database or Azure SQL Single Database in an [Elastic Pool](https://docs.microsoft.com/en-us/azure/azure-sql/database/elastic-pool-overview)

### Out-of-the-box Microsoft tooling & resources
* [Data Migration Guide with a general overview of considerations when migrating](https://docs.microsoft.com/en-us/azure/azure-sql/migration-guides/database/sql-server-to-sql-database-overview)
* [Data Migration Assistant](https://docs.microsoft.com/en-us/sql/dma/dma-overview) and an explanation on how to [migrate from SQL Server to Azure SQL Database](https://docs.microsoft.com/en-us/sql/dma/dma-migrateonpremsqltosqldb)
* [SQL Server Management Studio Import & Export](https://docs.microsoft.com/en-us/sql/integration-services/import-export-data/start-the-sql-server-import-and-export-wizard)
* [SQL Server Management Studio Generate Scripts](https://docs.microsoft.com/en-us/sql/ssms/tutorials/scripting-ssms?view=sql-server-ver15)
* Not supporting Azure SQL Database (yet) as target but something to keep an eye on is [Azure Data Studio Azure SQL Migration Extension](https://docs.microsoft.com/en-us/azure/dms/migration-using-azure-data-studio). Currently supporting Managed Instance and SQL Server on a Virtual Machine.
