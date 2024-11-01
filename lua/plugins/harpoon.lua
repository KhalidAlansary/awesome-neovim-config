return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon" })
		vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu, { desc = "Toggle harpoon menu" })

		vim.keymap.set("n", "<C-1>", function()
			ui.nav_file(1)
		end, { desc = "Go to haroon 1" })
		vim.keymap.set("n", "<C-2>", function()
			ui.nav_file(2)
		end, { desc = "Go to haroon 2" })
		vim.keymap.set("n", "<C-3>", function()
			ui.nav_file(3)
		end, { desc = "Go to haroon 3" })
		vim.keymap.set("n", "<C-4>", function()
			ui.nav_file(4)
		end, { desc = "Go to haroon 4" })
	end,
}
