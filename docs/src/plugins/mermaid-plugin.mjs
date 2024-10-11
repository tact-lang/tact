import { visit } from "unist-util-visit";

const escapeMap = {
	"&": "&amp;",
	"<": "&lt;",
	">": "&gt;",
	'"': "&quot;",
	"'": "&#39;",
};

const escapeHtml = (str) => str.replace(/[&<>"']/g, c => escapeMap[c]);

/**
 * @type {import('@astrojs/markdown-remark').RemarkPlugin}
 */
export const mermaidPlugin = () => tree => {
	visit(tree, "code", node => {
		if (node.lang !== "mermaid") return;

		node.type = "html";
		node.value = `
      <div class="mermaid" data-content="${escapeHtml(node.value)}">
        <p>Loading graph...</p>
      </div>
      <script>

			</script>
    `;
	});
};
