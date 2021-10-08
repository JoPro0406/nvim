local h = require("helpful")
local wk = require("which-key")

local function cmd(c) return "<cmd>" .. c .. "<cr>" end

wk.setup {
  plugins = { spelling = { enabled = true } },
  window = { border = "single" },
}

wk.register(
  {
    b = {
      name = "buffers",
      h = { cmd "bprevious", "previous buffer" },
      l = { cmd "bnext", "next buffer" },
      w = { cmd "bwipeout", "wipeout open buffer" },
      f = { cmd "Telescope buffers show_all_buffers=true",
            "open buffer browser" },
    },
    m = {
      name = "code/lsp actions",
      c = { vim.lsp.buf.code_action, "code actions" },
      h = { vim.lsp.buf.hover, "show documentation" },
      r = { cmd "Trouble lsp_references", "show references" },
      s = { vim.lsp.buf.signature_help, "signature help" },
      e = { cmd "Trouble lsp_document_diagnostics", "list diagnostics" },
      E = { cmd "Trouble lsp_workspace_diagnostics", "show diagnostics" },
      g = { vim.lsp.buf.definition, "go to definition" },
      i = { vim.lsp.buf.implementation, "show implementation" },
      F = { vim.lsp.buf.formatting, "format file with lsp formatter" },
    },
    f = {
      name = "files",
      a = { cmd "Telescope live_grep", "grep files" },
      b = { cmd "Telescope file_browser", "file browser" },
      f = { cmd "Telescope find_files", "file finder" },
      h = { cmd "Telescope oldfiles", "file hsitory" },
      n = { cmd "enew", "new file" },
    },
  }, { prefix = "<leader>" }
)

h.noremap("", "<M-r>", ":nohl<CR><C-l>")

h.noremap("t", "<Esc>", "<C-\\><C-n>")

h.noremap("n", "<M-F>", ":Format<CR>", { silent = false })
