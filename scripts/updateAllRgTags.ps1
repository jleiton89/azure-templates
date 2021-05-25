


$newTags = @{}

# reading tags value 
$an  = "appname_value"     
$bf  = "firewall_value"
$bu  = "unit_value"
$cc  = "commpliance_value"

#adding values to the temp  newTags array object

$newTags['appname'] = $an
$newTags['businessfirewall'] = $bf
$newTags['businessunit'] = $bu
$newTags['compliancecategory'] = $cc

$newTags #checking tags 

$subId = "@@-@@-@@-@@"  #subscriptionId


$rgTarget =  "testrg"   #read resource group column 


$resourceGroups = Get-AzResourceGroup   #get all resource groups


foreach ($resourceGroup in $resourceGroups){

    
    if ($resourceGroup.ResourceGroupName -eq $rgTarget){

        $uri = "/subscriptions/"+$subId+"/resourceGroups/"+$resourceGroup.ResourceGroupName

        $tagsRg = (Get-AzTag -ResourceId $uri).Properties.TagsProperty  #existing tags
        
        if( $newTags -ne 0){
          
            Update-AzTag -ResourceId $uri -Tag $newTags -operation Merge  #merge existing RG tags with $newTags . If replacement use Replace instead of merge
        }
        
    }
}


