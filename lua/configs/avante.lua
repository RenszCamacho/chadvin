-- ~/.config/nvim/lua/configs/avante.lua
-- Configuración de avante.nvim para NvChad

local M = {}

M.setup = function()
  require("avante").setup {
    -- NUEVA CONFIGURACIÓN: providers en lugar de provider directo
    provider = "openai", -- GitHub Models usa la API compatible con OpenAI
    providers = {
      openai = {
        endpoint = "https://models.inference.ai.azure.com",
        model = "gpt-4o-mini", -- Modelo gratuito recomendado
        timeout = 30000,
        max_tokens = 2048, -- Reducido para evitar límites
        ["local"] = false,
        -- Especifica que use GITHUB_TOKEN en lugar de OPENAI_API_KEY
        api_key_name = "GITHUB_TOKEN",
        -- Nueva estructura para parámetros del request
        extra_request_body = {
          temperature = 0,
          -- Limita el contexto enviado
          max_context_length = 6000,
        },
      },
    },
    -- Configuración de comportamiento
    behaviour = {
      auto_suggestions = false, -- Evita consumir límites automáticamente
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    -- Mapeos de teclado personalizados
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = true },
    windows = {
      position = "right", -- "right", "left", "top", "bottom"
      wrap = true,
      width = 30, -- % de la pantalla
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      debug = false,
      list_opener = "copen",
    },
  }
end

return M
