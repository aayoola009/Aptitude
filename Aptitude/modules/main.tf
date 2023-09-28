resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.location
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.sku
  retention_in_days   = 30
}

resource "azurerm_service_plan" "asp" {
  name                = var.asp
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = var.sku_name
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "as" {
  name                = var.as
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.asp.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on                               = var.always_on_enabled
    ftps_state                              = var.ftps_state
    http2_enabled                           = var.http2_enabled
    websockets_enabled                      = var.websockets_enabled
    health_check_path                       = var.health_check_path
  }
}

##CREATE MONNITOR
resource "azurerm_monitor_diagnostic_setting" "web_app_diagnostics" {
    depends_on = [azurerm_windows_web_app.as]
    name = "neblus-monitor"
    target_resource_id = azurerm_windows_web_app.as.id
    log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
    log_analytics_destination_type = "Dedicated"

    enabled_log {
        category="AppServiceHTTPLogs"
#        retention_policy {
#          enabled = true
#          days = 30
#        }
    }

    enabled_log {
        category="AppServiceConsoleLogs"
#        retention_policy {
#          enabled = true
#          days = 30
#        }
    }

    enabled_log {
        category="AppServiceAppLogs"
#        retention_policy {
#          enabled = true
#          days = 30
#        }
    }

    enabled_log {
        category="AppServiceAuditLogs"
#        retention_policy {
#          enabled = true
#          days = 30
#        }
    }

    enabled_log {
        category="AppServiceIPSecAuditLogs"
#        retention_policy {
#          enabled = true
#          days = 30
#        }
    }

    enabled_log {
        category="AppServicePlatformLogs"
#        retention_policy {
#          enabled = true
#          days = 30
#        }
    }

    metric {
        category = "AllMetrics"
        enabled = true
#        retention_policy {
#          enabled = true
#          days = 30
#        }
    }
}