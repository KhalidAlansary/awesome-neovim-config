return {
	"stevearc/overseer.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"akinsho/toggleterm.nvim",
		"nvim-lualine/lualine.nvim",
	},
	opts = {
		templates = { "builtin", "user.cpp_build", "user.run_script" },
		strategy = "toggleterm",
	},
	config = function(_, opts)
		local overseer = require("overseer")
		overseer.setup(opts)

		require("lualine").setup({
			sections = {
				lualine_x = { "overseer" },
			},
		})
	end,
}
