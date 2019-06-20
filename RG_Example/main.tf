provider "azurerm" {
    version         = "~> 1.30"
    client_id       = "8000009f-198a-4234-8536-962dd0000"
    client_secret   = "a3e4GwVz]=12e5+RoU+H345g?=bw3e4_0"
    tenant_id       = "q123ef86-2256-0000-b89b-77777fb7j767"
    subscription_id = "01000492-43e5-4d90-cer5-a2d43a880000"
}

resource "azurerm_resource_group" "TFrg" {
    name     = "myTFrg"
    location = "eastus"
}
