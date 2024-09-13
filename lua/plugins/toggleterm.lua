return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	config = function(_, opts)
		local toggleterm = require("toggleterm")
		toggleterm.setup(opts)

		function _G.set_terminal_keymaps()
			local options = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], options)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], options)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], options)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], options)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], options)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], options)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], options)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		vim.keymap.set("n", "<leader>tt", toggleterm.toggle, { noremap = true })
	end,
}
