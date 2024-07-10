RESOURCE_GROUP="az-rg-deployment-03"
PUBLIC_IP_NAME="myPublicIP"
DNS_LABEL="simplondeployment"
LOCATION="northeurope"

az network public-ip create \
  --resource-group $RESOURCE_GROUP \
  --name $PUBLIC_IP_NAME \
  --dns-name $DNS_LABEL \
  --location $LOCATION \
  --allocation-method Static


