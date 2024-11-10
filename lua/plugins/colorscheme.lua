return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent_background = false,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
