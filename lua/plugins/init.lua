return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      local opts = require "nvchad.configs.telescope"
      opts.defaults.file_ignore_patterns = { "node_modules" }
      return opts
    end,
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false,
  --   opts = {
  --     provider = "claude",
  --     providers = {
  --       claude = {
  --         endpoint = "https://api.anthropic.com",
  --         model = "claude-3-5-sonnet-20241022",
  --         api_key_name = "ANTHROPIC_API_KEY",
  --         extra_request_body = {
  --           temperature = 0,
  --           max_tokens = 4096,
  --         },
  --       },
  --     },
  --     mappings = {
  --       submit = {
  --         normal = "<CR>",
  --         insert = "<C-s>",
  --       },
  --     },
  --   },
  --   build = "make",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     {
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --         },
  --       },
  --     },
  --     {
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     "HakonHarnes/img-clip.nvim",
  --   },
  --   config = function()
  --     require("configs.avante").setup()
  --   end,
  -- },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- o mini.icons si prefieres mini.nvim
    },
    ft = { "markdown" },
    opts = {
      -- Configuración opcional, puedes dejarlo vacío o añadir ajustes más adelante
    },
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>zz", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
    opts = {
      window = {
        width = 0.75, -- 75% del ancho
        height = 0.9, -- 90% del alto
      },
      plugins = {
        options = {
          laststatus = 0, -- ocultar barra de estado
        },
        tmux = { enabled = false }, -- si usas tmux, pon true si quieres integración
      },
    },
  },
}
