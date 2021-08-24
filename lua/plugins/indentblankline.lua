-- https://github.com/lukas-reineke/indent-blankline.nvim/
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_filetype_exclude =
  {
    "help",
    "packer",
    "dashboard",
    "NvimTree",
    "man",
    "lspinfo",
    "TelescopePrompt",
  }
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns =
  {
    "class",
    "function",
    "method",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
  }
