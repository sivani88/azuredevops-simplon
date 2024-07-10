# Connectez-vous à votre compte Azure
#az login

# Définissez l'ID de l'abonnement
subscriptionId=""
az account set --subscription $subscriptionId

# Définissez le nom du groupe de ressources et la région
resourceGroupName="rg-sivani-deploy-sans-pip-01"
location="northeurope"



# Emplacement des fichiers de modèle ARM et de paramètres

# Vérifiez que les fichiers du modèle et des paramètres existent
if [ ! -f "$templateFilePath" ]; then
    echo "Le fichier modèle '$templateFilePath' n'existe pas."
    exit 1
fi

if [ ! -f "$templateParameterPath" ]; then
    echo "Le fichier de paramètres '$templateParameterPath' n'existe pas."
    exit 1
fi

# Exécutez la simulation What-If
az deployment group what-if --resource-group $resourceGroupName \
                            --template-file $templateFilePath \
                            --parameters @$templateParameterPath
