$resourceGroups = Get-AzResourceGroup -Name  100-*

foreach ($resourceGroup in $resourceGroups){

    Get-AzResourceGroup -Name $resourceGroup.ResourceGroupName | Remove-AzResourceGroup -Force

}