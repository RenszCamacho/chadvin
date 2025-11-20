require "nvchad.mappings"

local map = vim.keymap.set

-- BASE MAPPINGS
map("i", "jj", "<ESC>", { desc = "Escape", remap = true })

map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

map({ "n", "i", "v" }, "<leader>ww", "<CMD>w<CR>", { desc = "Save", remap = true })

map("n", "<leader>|", "<CMD>vertical split<CR>", { desc = "Toggle Vertical Split", remap = true })

-- Toggle between wrap window or not

map("n", "<leader>;", function()
  vim.o.wrap = not vim.o.wrap
  print("wrap = " .. tostring(vim.o.wrap))
end, { desc = "Toggle Wrap" })

-- GIT KEYMAPS
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit", noremap = true })

map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Blame Inline", noremap = true })

map("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk Inline", noremap = true })

-- LSP
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions", noremap = true, silent = true }) -- Code actions

map(
  "n",
  "<leader>co",
  '<cmd>lua vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) } })<CR>',
  { desc = "Organize Imports", noremap = true, silent = true }
)

-- OVERRIDE TERM BY DEFAULT; IN MACOS OPTION KEY DOES NOT MAP TO M
map({ "n", "t" }, "<leader>v", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<leader>h", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

-- map({ "n", "t" }, "<leader>i", function()
--   require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
-- end, { desc = "terminal toggle floating term" })
