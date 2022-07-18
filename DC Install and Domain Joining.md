DC Install and Domain Joining



      # Legend #

         *IP* - Domain IP


# Windows server enable PS remote #
 Enabled by default in servers
      PS C:\Users\Administrator> enable-psremoting
      PS C:\Users\Administrator>                      #exited without error#
 

# Server IP #

            PS C:\Users\Administrator> ipconfig
            Windows IP Configuration


# Changing Domain configuration #

            sconfig
            change computername, network to statis, IP , Default gateway
            Check the default gateway is .2 address
            changing the IP of DC to 192.168.0.155 , statis, mask 255.0, gateway 192.168.0.2
            changing dns server to 192.168.0.155 (Same as DC)

            Changing configuration without using Sconfig



\\\# Need to add the server ip to the trustedhosts configuration list so that we could do a ps-remote session from client to server \\\\# 


      winrm.cmd
      start-service winRM
      get-item wsman:\localhost\Client\TrustedHosts
      set-item wsman:\localhost\Client\TrustedHosts -value *IP*
# To enable PS Remoting on client #

            Enable-PSRemoting #Enabling#
            Enable-PSRemoting -Force # configuring #
            Get-NetFirewallRule -Name 'WINRM' | select-Object Name #Allowing remote access                                             to client #
            Enter-PSSession # On client machines #


      New-PSSession -ComputerName *IP* -Credential (Get-Credential)
      Enter Domain Credentials

      Enter-PSSession (cmdlet number)



# Installing AD using PS-Session from Client to server #

      install-windowsfeature AD-Domain-Services -includemanagementtools
      import-Module ADDSDeployment
      Install-ADDSForest
      abc.com (Domain name)
      set password for safe mode

      Get-NetIpAddress -IpAddress*IP*
      Get-DNSClientServerAddress
      Check interface index
      Set-DNSClientServerAddress -InterfaceIndex -*number* -serveraddress *DNS IP*

# Changing the DNS server of clients or workstation to make it join a Domain #

      Get-DNSClientServerAddress
      Check interface index
      Set-DNSClientServerAddress -InterfaceIndex -*number* -serveraddress *DNS IP*

# Joining Computer to Domain #

      Add-Computer -DomainName abc.com -Credential abc\Administrator -Force -restart







