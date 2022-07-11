Active_directory_lab_setup

Booting up a windows server 22 vm
Install a windows 11 vm 
To bypass the TPM check of W11
go to cmd (Shift+F10)
regedit
hkey local machine>system>setup>create a new key "LabConfig"
Inside LabConfig> create Dword32 > "BypassTPMCheck" > value 1
create Dword32 > "BypassRAMCheck" > value 1
create Dword32 > "BypassSecureBootCheck" > value 1
go back to installer and try to install


Server 22
Install updates using s config and restart
To stop s config from boootingup everytime,
go to powershell
set-sconfig -Autolaunch $False
shutdown /r /t 0  #Restart

Create a snapshot of the VMServer22 and W11Client
Go to > Options>Advanced>Enable template mode to use for cloning 

Name the DC as Server22-a and W11 as Client11-a