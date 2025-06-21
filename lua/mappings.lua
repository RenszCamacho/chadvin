require "nvchad.mappings"

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jj", "<ESC>", { desc = "Escape", remap = true })

map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

map({ "n", "i", "v" }, "<leader>ww", "<CMD>w<CR>", { desc = "Save", remap = true })

map("n", "<leader>|", "<CMD>vertical split<CR>", { desc = "Toggle Vertical Split", remap = true })

map("n", "<leader>cn", [[:!node %<CR>]], { desc = "Execute node code" })

map("n", "<leader>ct", [[:!npx ts-node %<CR>]], { desc = "Execute ts node code" })

-- GIT KEYMAPS
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit", noremap = true })

map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Blame Inline", noremap = true })

map("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk Inline", noremap = true })

map(
  "n",
  "<leader>co",
  '<cmd>lua vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) } })<CR>',
  { desc = "Organize Imports", noremap = true, silent = true }
)
