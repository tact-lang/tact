async function renderDiagrams(graphs) {
	console.log('HEY!');
	const { default: mermaid } = await import("mermaid");
	mermaid.initialize({
		startOnLoad: false,
		fontFamily: "var(--sans-font)",
		theme: window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "default",
	});

	for (const graph of graphs) {
		console.log(graphs);
		const content = graph.getAttribute("data-content");
		if (!content) continue;

		let svg = document.createElement("svg");
		const id = (svg.id = "mermaid-" + Math.round(Math.random() * 10000000));

		graph.appendChild(svg);
		mermaid.render(id, content).then(result => {
			graph.innerHTML = result.svg;
		});
	}
}

const graphs = document.getElementsByClassName("mermaid");
console.log(graphs);
if (graphs.length > 0) {
	void renderDiagrams(graphs);
}


