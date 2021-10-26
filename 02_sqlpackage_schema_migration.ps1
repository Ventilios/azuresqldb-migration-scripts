##############################################
#
# SAMPLE SCRIPT. TESTING PURPOSES ONLY. 
#
##############################################

#
# Use sqlpackage.exe to export a data model and publish to your target Azure SQL database.
# sqlpackage download - https://docs.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage-download?view=sql-server-ver15
#
####

$sqlcred = Get-Credential # Prompt to supply SQL Authenticated credentials
$sqlpwd = $sqlcred.GetNetworkCredential().Password
$sqluser = $sqlcred.UserName

$sourcesqldb = "SourceDatabase"
$targetsql = "TargetServer.database.windows.net" #"<xxx>.database.windows.net" # change server name
$targetsqldb = "DestinationDatabase" # replace with database name on the target
$targetfile = ”c:\Workingdirectory\<file>.dacpac”

#
# Export to Dacpac
& "C:\Program Files\Microsoft SQL Server\150\DAC\bin\sqlpackage.exe" /action:Extract /TargetFile:”$targetfile” /SourceConnectionString:”Server=.;Integrated Security=SSPI;Database=$sourcesqldb”

#
# Publish Dacpac
& "C:\Program Files\Microsoft SQL Server\150\DAC\bin\sqlpackage.exe" /SourceFile:"$targetfile" /Action:Publish /TargetServerName:"$targetsql" /TargetDatabaseName:"$targetsqldb" /TargetUser:"$sqluser" /TargetPassword:"$sqlpwd" /p:AllowIncompatiblePlatform=true