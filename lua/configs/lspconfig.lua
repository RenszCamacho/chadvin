-- Cargar configuración por defecto de NvChad
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Lista de servidores básicos
local servers = { "html", "cssls", "ts_ls", "emmet_ls", "eslint", "tailwindcss", "biome" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
