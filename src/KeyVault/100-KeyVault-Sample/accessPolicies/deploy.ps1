

$_deployment_name = Split-Path -Path (Get-Location) -Leaf  #Get current folder 

$_location = "East Us"

$datetime = Get-Date -Format "MM_dd_yyyy-HH_mm"

$resourceGroupName =  $_deployment_name + "-" + $datetime 

$location = $_location

New-AzResourceGroup -Name $resourceGroupName -Location $location

New-AzResourceGroupDeployment -Name $_deployment_name -ResourceGroupName $resourceGroupName -TemplateFile template.json -TemplateParameterFile parameters.json -debug