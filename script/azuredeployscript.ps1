#
# Connectez-vous à votre compte Azure
Connect-AzAccount

# Récupérez la liste des abonnements et sélectionnez l'abonnement souhaité
#Get-AzSubscription | Select-Object Name, Id

# Sélectionnez l'abonnement où vous voulez créer le groupe de ressources
Set-AzContext -SubscriptionId ""

# Définissez le nom du groupe de ressources et la région
$resourceGroupName = "rg-ressourceaffival05"
$location = "northeurope" 

# Vérifiez si le groupe de ressources existe déjà
$group = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-Not $group) {
    # Si le groupe de ressources n'existe pas, créez-le
    Write-Host "Création du groupe de ressources '$resourceGroupName' dans la région '$location'."
    $group = New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Emplacement des fichiers de modèle ARM et de paramètres



# Vérifiez que les fichiers du modèle et des paramètres existent
if (-Not (Test-Path -Path $templateFilePath -PathType Leaf)) {
    Write-Error "Le fichier modèle '$templateFilePath' n'existe pas."
    exit
}

if (-Not (Test-Path -Path $templateParameterPath -PathType Leaf)) {
    Write-Error "Le fichier de paramètres '$templateParameterPath' n'existe pas."
    exit
}

# Exécutez la simulation What-If
$whatIfResult = New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFilePath `
    -TemplateParameterFile $templateParameterPath `
    -WhatIf

# Affichez les résultats
$whatIfResult

