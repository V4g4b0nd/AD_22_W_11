


	param( [Parameter(Mandatory=$true)] $Jsonfile)

	

	function CreateADUser ()


								{

									param( [Parameter(Mandatory=$true)] $userobject )


									Echo $userobject



								}




	$json = ( Get-content $Jsonfile | Convertfrom-JSON )

			foreach ( $user in $json.users ) {

					createADuser $user
			} 