vim.api.nvim_exec("filetype plugin indent on", true)
vim.api.nvim_exec("syntax enable", true)

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

vim.g.mapleader = _G.Settings.mapleader
vim.g.maplocalleader = _G.Settings.localleader

vim.opt.clipboard = "unnamedplus"

vim.opt.shortmess:append("I")

vim.opt.title = true
vim.opt.titlestring = "%t - nvim"

vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5

vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.background = _G.Settings.background

vim.opt.laststatus = 3

vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = "tab:→ ,trail:·,eol:↲" -- ↵↲⏎

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2"
vim.opt.showbreak = "> "
vim.opt.whichwrap:append("<>hl")

vim.opt.tabstop = _G.Settings.indent
vim.opt.softtabstop = _G.Settings.indent
vim.opt.shiftwidth = _G.Settings.indent
vim.opt.smartindent = true
vim.opt.copyindent = false
if _G.Settings.indent_style == "spaces" then
	vim.opt.expandtab = true
end

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 100

vim.opt.backspace = "indent,eol,start"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hidden = true

vim.opt.shortmess:append("c")

vim.opt.guifont = "FiraCode NF:h14"

vim.cmd("let &fcs='eob: '")

vim.api.nvim_create_autocmd("BufWritePost", {
	desc = [[Make files with shebang lines user executable.]],
	callback = function(table)
		local first_line = vim.api.nvim_buf_get_lines(table.buf, 0, 1, false)[1] or ""
		if string.find(first_line, "^#!%s*[^%s]") then
			local perms = vim.fn.getfperm(table.file)
			-- replace the third character with an x
			perms = ("%s%s%s"):format(perms:sub(1, 2), "x", perms:sub(4))
			vim.fn.setfperm(table.file, perms)
		end
	end,
})
