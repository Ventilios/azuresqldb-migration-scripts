# azuresqldb-migration-scripts
Situations with extreme amount of objects or data might not fit the out-of-the-box Microsoft tools. 
This repository contains some notes and ideas on moving data and deploying schema's separately purely focussed on Azure SQL Single Database or Azure SQL Single Database in an [Elastic Pool](https://docs.microsoft.com/en-us/azure/azure-sql/database/elastic-pool-overview)

### Out-of-the-box Microsoft tooling & resources
* [Data Migration Guide with a general overview of considerations when migrating](https://docs.microsoft.com/en-us/azure/azure-sql/migration-guides/database/sql-server-to-sql-database-overview)
* [Data Migration Assistant](https://docs.microsoft.com/en-us/sql/dma/dma-overview) and an explanation on how to [migrate from SQL Server to Azure SQL Database](https://docs.microsoft.com/en-us/sql/dma/dma-migrateonpremsqltosqldb)
* [SQL Server Management Studio Import & Export](https://docs.microsoft.com/en-us/sql/integration-services/import-export-data/start-the-sql-server-import-and-export-wizard)
* [SQL Server Management Studio Generate Scripts](https://docs.microsoft.com/en-us/sql/ssms/tutorials/scripting-ssms?view=sql-server-ver15)
* Not supporting Azure SQL Database (yet) as target but something to keep an eye on is [Azure Data Studio Azure SQL Migration Extension](https://docs.microsoft.com/en-us/azure/dms/migration-using-azure-data-studio). Currently supporting Managed Instance and SQL Server on a Virtual Machine.

### Examples in this repository
Based on Microsoft and open source tooling it's possible to migrate your database in separate steps, Schema migration and Data migration. 
* _[Schema Migration]_ [01_sqlcmd_schema_import.ps1](https://github.com/Ventilios/azuresqldb-migration-scripts/blob/main/01_sqlcmd_schema_import.ps1) - Option using SQLCMD to execute sql-file(s) containing the database objects that have been exported with [Data Migration Assistant](https://docs.microsoft.com/en-us/sql/dma/dma-overview) or [SQL Server Management Studio Generate Scripts](https://docs.microsoft.com/en-us/sql/ssms/tutorials/scripting-ssms?view=sql-server-ver15).  
* _[Schema Migration]_ [02_sqlpackage_schema_migration.ps1](https://github.com/Ventilios/azuresqldb-migration-scripts/blob/main/02_sqlpackage_schema_migration.ps1) - Option using sqlpackage to _extract_ a DACPAC-file from the source SQL Server instance (for example SQL Server on a Virtual Machine) and _publish_ the DACPAC-file to a Azure SQL Database target.
* _[Data Migration]_ [03_dbatools_data_migration.ps1](https://github.com/Ventilios/azuresqldb-migration-scripts/blob/main/03_dbatools_data_migration.ps1) - Using the PowerShell function Copy-DbaDbTableData included in to copy the data from Source to Target tables [dbatools](https://dbatools.io)
* _[Data Migration]_ 04_smartbulkcopy_example_to_be_created.ps1 - Using PowerShell to generate the table configuration and execute the [smartbulkcopy project](https://github.com/Azure-Samples/smartbulkcopy) to start the migration.

### Considerations
* When generating scripts for model deployment consider to break it up by excluding indexes at initial deployment, insert the data and post-deploy the indexes.
* Leverage a higher SKU; more DTU or vCore but also consider General Purpose versus Business Critical (more I/O througput). Scale down after the migration.
* Changing the Packet Size when connecting to Azure SQL Database with sqlcmd ("-a packet_size" parameter) will have no affect. 
