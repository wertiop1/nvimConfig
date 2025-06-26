return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
  opts = {
    disable_filetype = { "TelescopePrompt" }
  }
  --config = function()
  --require("nvim-autopairs").setup({
  --disable.filetype = { "TelescopePrompt", "vim", }
  --})
  --end,
}
