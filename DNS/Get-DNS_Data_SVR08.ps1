<# 
.SYNOPSIS
    Gets DNS data using WMI in Server 2008. In Server 2012, there is are DNS cmdlets that make this task much easier.

#>


# All Records
get-wmiobject -Namespace root\MicrosoftDNS -class microsoftdns_resourcerecord | select __Class, ContainerName, DomainName, RecordData, ownername | Export-csv .\DNS_Recods.csv

# Gets Roothints
get-wmiobject -Namespace root\MicrosoftDNS -class microsoftdns_resourcerecord | where{$_.domainname -eq "..roothints"} | Export-csv .\DNS_Roothints.csv

# Gets Zones 
get-WmiObject -namespace "root\MicrosoftDNS" -class MicrosoftDNS_Zone | select Name | Export-csv .\DNS_Zones.csv

# Stats
get-wmiobject -Namespace root\MicrosoftDNS -class microsoftdns_statistic | select name, value | Export-csv .\DNS_Stats.csv