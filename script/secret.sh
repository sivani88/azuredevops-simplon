#!/bin/bash

# Variables - remplacez ces valeurs par les vôtres
VAULT_NAME="kv"  # Nom de votre Key Vault
SP_PASSWORD=""
SP_CLIENT_ID=""
SP_TENANT_ID=""


# Ajouter le mot de passe du principal de service
az keyvault secret set --vault-name $VAULT_NAME --name "spPassword" --value $SP_PASSWORD

# Ajouter l'ID client du principal de service
az keyvault secret set --vault-name $VAULT_NAME --name "spClientId" --value $SP_CLIENT_ID

# Ajouter l'ID du locataire du principal de service
az keyvault secret set --vault-name $VAULT_NAME --name "spTenantId" --value $SP_TENANT_ID

echo "Secrets added to Key Vault successfully."

