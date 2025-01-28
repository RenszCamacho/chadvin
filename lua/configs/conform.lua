local options = {
  -- Configuración específica para cada tipo de archivo
  formatters_by_ft = {
    lua = { "stylua" }, -- ya configurado
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    markdown = { "prettier" },
    astro = { "prettier" },
  },

  -- Habilitar formato automático al guardar
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
