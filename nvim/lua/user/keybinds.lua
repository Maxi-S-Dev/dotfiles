local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

local M = {}
--- Telescope
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").find_files, {desc = "Find Files"})
vim.keymap.set("n", "<leader>f/", require("telescope.builtin").live_grep, {desc = "Live Grep"})
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles, {desc = "Find recently opened files"})
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {desc = "Find Buffers"})
vim.keymap.set("n", "<leader>/", require("telescope.builtin").current_buffer_fuzzy_find, {desc = "Fuzzy find current buffer"})
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {desc = "Find Help"})

vim.keymap.set("n", "<leader>fc", function()
  require("telescope.builtin").commands(
  require("telescope.themes").get_dropdown(
  {previewer =false,}))
end,
{ desc = "Find Commands"})

vim.keymap.set("n", "<leader>cs", function()
  require("telescope.builtin").spell_suggest(
  require("telescope.themes").get_dropdown(
  {previewer =false,}))
end,
{ desc = "Search spelling suggestions"})

--- Oil
vim.keymap.set("n", "<leader>e", require("oil").toggle_float, {desc = "Filesystem"})


--- LSP
M.lsp_keybinds = function(buffer_number)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Documentation" , buffer = buffer_number})
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = " Documentation ", buffer = buffer_number})
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = " Code Action ", buffer = buffer_number})
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = " Format Document ", buffer = buffer_number})
end


--Save, Quit & Savequit with leader keymap
vim.keymap.set('n', "w", ":wa<CR>", { desc = "save"})
vim.keymap.set('n', "q", ":q<CR>", { desc = "quit neovim"})
vim.keymap.set('n', "z", ":wqa<CR>", { desc = "save and quit neovim"})

--Map jj to <ESC>
vim.keymap.set('i', "jj", "<ESC>", { desc = "escape"})

--clear search highlights
vim.keymap.set('n', "<leader>no", ":noh<CR>", {desc = "Clear search highlights"})

--Harpoon keybinds
vim.keymap.set('n', "<leader>ho", function()
  harpoon_ui.toggle_quick_menu()
end, {desc = "Toggle Harpoon Menu"})

vim.keymap.set('n', "<leader>ha", function()
  harpoon_mark.add_file()
end, {desc = "Add file to harpoon"})

vim.keymap.set('n', "<leader>hr", function()
  harpoon_mark.remove_file()
end, {desc = "Remove file from harpoon"})

vim.keymap.set('n', "<leader>hc", function()
  harpoon_mark.clear_all()
end, {desc = "Clear all harpoon marks"})

vim.keymap.set('n', "<leader>1", function()
  harpoon_ui.nav_file(1)
end, {desc = "Go to harpoon mark 1"})

vim.keymap.set('n', "<leader>2", function()
  harpoon_ui.nav_file(2)
end, {desc = "Go to harpoon mark 2"})

vim.keymap.set('n', "<leader>3", function()
  harpoon_ui.nav_file(3)
end, {desc = "Go to harpoon mark 3"})

vim.keymap.set('n', "<leader>4", function()
  harpoon_ui.nav_file(4)
end, {desc = "Go to harpoon mark 4"})

vim.keymap.set('n', "<leader>5", function()
  harpoon_ui.nav_file(5)
end, {desc = "Go to harpoon mark 5"})



--Git keybinds
vim.keymap.set('n', '<leader>gl', ':LazyGit<CR>', {desc = 'Open LazyGit'})
vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>', {desc = 'Toggle Git Blame'})

return M
