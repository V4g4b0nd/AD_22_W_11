DC Install and Domain Joining

# Windows server enable PS remote #
 Enabled by default in servers
 
 # To enable PS Remoting on client #

Enable-PSRemoting #Enabling#
Enable-PSRemoting -Force # configuring #
Get-NetFirewallRule -Name 'WINRM' | select-Object Name #Allowing remote access 															to client #
Enter-PSSession # On client machines #
