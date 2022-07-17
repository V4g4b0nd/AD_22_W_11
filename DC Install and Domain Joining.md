DC Install and Domain Joining

# Windows server enable PS remote #
 Enabled by default in servers
 
 # To enable PS Remoting on client #

Enable-PSRemoting #Enabling#
Enable-PSRemoting -Force # configuring #
Get-NetFirewallRule -Name 'WINRM' | select-Object Name #Allowing remote access 															to client #
Enter-PSSession # On client machines #


PS C:\Users\Administrator> ipconfig

Windows IP Configuration

# Server IP #

Ethernet adapter Ethernet0:

   Connection-specific DNS Suffix  . : localdomain
   Link-local IPv6 Address . . . . . : ******
   IPv4 Address. . . . . . . . . . . : 192.168.0.0
   Subnet Mask . . . . . . . . . . . : 255.255.0.0
   Default Gateway . . . . . . . . . : 192.168.0.0

PS C:\Users\Administrator> enable-psremoting
PS C:\Users\Administrator>                      #exited without error#
# Legend #

*IP* - Domain IP

Need to add the server ip to the trustedhosts configuration list so that we could do a ps-remote session from client to server
winrm.cmd

start-service winRM
get-item wsman:\localhost\Client\TrustedHosts
set-item wsman:\localhost\Client\TrustedHosts -value *IP*

New-PSSession -ComputerName *IP* -Credential (Get-Credential)
Enter Domain Credentials

Enter-PSSession (cmdlet number)

# Changing Domain configuration #

sconfig
change computername, network to statis, IP , Default gateway
Check the default gateway is .2 address
changing the IP of DC to 192.168.0.155 , statis, mask 255.0, gateway 192.168.0.2
changing dns server to 192.168.0.155 (Same as DC)



# Installing AD using PS-Session fromm Client to server #

install-windowsfeature AD-Domain-Services -includemanagementtools






