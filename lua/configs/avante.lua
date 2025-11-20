-- ~/.config/nvim/lua/configs/avante.lua
-- Configuración de avante.nvim para usar Claude (Anthropic)
local M = {}
M.setup = function()
  require("avante").setup {
    provider = "anthropic",
    providers = {
      anthropic = {
        __inherited_from = "openai",
        endpoint = "https://api.anthropic.com/v1/messages",
        model = "claude-3-5-sonnet-20241022",
        api_key_name = "ANTHROPIC_API_KEY",
        max_tokens = 2048,
        timeout = 30000,
        ["local"] = false,
        extra_request_body = {
          temperature = 0.2,
        },
        parse_curl_args = function(opts, body)
          -- Limpiar el body de funciones y campos no serializables
          local clean_body = vim.deepcopy(body)

          -- Remover campos que contienen funciones
          if clean_body.tools then
            for i, tool in ipairs(clean_body.tools) do
              if tool.on_render then
                clean_body.tools[i].on_render = nil
              end
            end
          end

          return {
            url = opts.endpoint,
            headers = {
              "Content-Type: application/json",
              "x-api-key: " .. os.getenv(opts.api_key_name),
              "anthropic-version: 2023-06-01",
            },
            body = vim.fn.json_encode(clean_body),
          }
        end,
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    mappings = {
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
    windows = {
      position = "right",
      wrap = true,
      width = 30,
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
    diff = {
      autojump = true,
      debug = false,
      list_opener = "copen",
    },
  }
end
return M
