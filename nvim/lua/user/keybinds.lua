
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


return M
