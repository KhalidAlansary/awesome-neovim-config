return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		vim.keymap.set(
			"n",
			"<leader>md",
			vim.cmd.MarkdownPreviewToggle,
			{ noremap = true, silent = true, desc = "Toggle Markdown Preview" }
		)
	end,
}
