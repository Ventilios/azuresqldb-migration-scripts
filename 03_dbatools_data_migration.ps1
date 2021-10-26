##############################################
#
# SAMPLE SCRIPT. TESTING PURPOSES ONLY. 
#
##############################################

#
# Copy table content with Copy-DbaDbTableData included with dbatools
# dbatools: https://dbatools.io
# Copy-DbaDbTableData: https://docs.dbatools.io/Copy-DbaDbTableData
# Function source: https://github.com/sqlcollaborative/dbatools/blob/development/functions/Copy-DbaDbTableData.ps1
#
####

#
# 1 table example
$sqlcred = Get-Credential

$params1 = @{
  # Source
  SqlInstance = 'localhost'
  Database = 'SourceDatabase'
  Table = '[SourceSchema].[SourceTable]'

  # Destination
  Destination = 'Destination.database.windows.net'
  DestinationDatabase = 'TargetDatabase'
  DestinationTable = '[TargetSchema].[TargetTable]'
  DestinationSqlCredential = $sqlcred
  
  # Copy specific parameters
  KeepIdentity = $true
  KeepNulls = $true
  # Truncate = $true
  # BatchSize = 10000
}
Copy-DbaDbTableData @params1


#
# Dynamic copy
$sqlcred = Get-Credential

$params2 = @{
  # Source
  SqlInstance = 'SourceInstance'
  Database = 'SourceDatabase'

  # Destination
  Destination = 'TargetDestination.database.windows.net'
  DestinationDatabase = 'TargetDatabase'
  DestinationSqlCredential = $sqlcred

  # Copy specific parameters
  KeepIdentity = $true
  KeepNulls = $true
  # Truncate = $true
  # BatchSize = 10000
}
Get-DbaDbTable -SqlInstance $params2.SqlInstance -Database $params2.Database | Copy-DbaDbTableData -Destination $params2.Destination -DestinationDatabase $params2.DestinationDatabase -DestinationSqlCredential $params2.DestinationSqlCredential