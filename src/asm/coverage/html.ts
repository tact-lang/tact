import {
    Coverage,
    CoverageSummary,
    generateCoverageSummary,
    Line,
} from "@/asm/coverage/data";
import {
    MAIN_TEMPLATE,
    SUMMARY_TEMPLATE,
} from "@/asm/coverage/templates/templates";

const templates = {
    main: MAIN_TEMPLATE,
    summary: SUMMARY_TEMPLATE,
};

const renderTemplate = (
    template: string,
    data: Record<string, unknown>,
): string => {
    return template.replaceAll(/{{(\w+)}}/g, (_, key) => {
        // eslint-disable-next-line @typescript-eslint/no-unsafe-member-access
        return data[key]?.toString() ?? "";
    });
};

const formatGasCosts = (gasCosts: readonly number[]): string => {
    if (gasCosts.length === 0) return "";
    if (gasCosts.length === 1) return gasCosts[0]?.toString() ?? "0";

    const gasCount: Map<number, number> = new Map();
    for (const gas of gasCosts) {
        gasCount.set(gas, (gasCount.get(gas) ?? 0) + 1);
    }

    if (gasCount.size === 1) {
        const firstEntry = [...gasCount.entries()][0];
        return firstEntry?.[0]?.toString() ?? "";
    }

    return [...gasCount.entries()]
        .sort(([gas1], [gas2]) => gas1 - gas2)
        .map(([gas, count]) => `${gas} x${count}`)
        .join(", ");
};

export const calculateTotalGas = (gasCosts: readonly number[]): number => {
    return gasCosts.reduce((sum, gas) => sum + gas, 0);
};

const generateLineHtml = (
    line: Line,
    index: number,
    maxGasPerLine: number,
    totalGas: number,
): string => {
    const lineNumber = index + 1;
    const className = line.info.$;

    let gasHtml = `<div class="gas"></div>`;
    let hitsHtml = `<div class="hits"></div>`;
    let gasPercentStyle = "";

    if (line.info.$ === "Covered") {
        const gasInfo = line.info.gasCosts;
        const detailedGasCost = formatGasCosts(gasInfo);
        const totalGasCost = calculateTotalGas(gasInfo);

        const gasPercentage = Math.sqrt(totalGasCost / maxGasPerLine) * 100;
        const totalGasPercentage = (totalGasCost / totalGas) * 100;

        gasPercentStyle = ` style="--gas-percent:${gasPercentage.toFixed(4)}%" data-gas-percent="${totalGasPercentage.toFixed(2)}%"`;

        gasHtml = `<div class="gas">
            <span class="gas-detailed">${detailedGasCost}</span>
            <span class="gas-sum">${totalGasCost}</span>
        </div>`;
        hitsHtml = `<div class="hits" title="Number of times executed">${line.info.hits}</div>`;
    }

    return `<div class="line ${className}" id="L${lineNumber}"${gasPercentStyle} data-line-number="${lineNumber}">
    <div class="line-number">${lineNumber}</div>
    ${gasHtml}
    ${hitsHtml}
    <pre>${line.line.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll('"', "&quot;").replaceAll("'", "&#039;")}</pre>
</div>`;
};

const generateInstructionRowsHtml = (summary: CoverageSummary): string => {
    return summary.instructionStats
        .map((stat) => {
            const percentValue = (stat.totalGas / summary.totalGas) * 100;
            return `<tr>
                <td data-value="${stat.name}"><code>${stat.name}</code></td>
                <td data-value="${stat.totalGas}">${stat.totalGas}</td>
                <td data-value="${stat.totalHits}">${stat.totalHits}</td>
                <td data-value="${stat.avgGas}">${stat.avgGas}</td>
                <td data-value="${percentValue}">
                    <div class="percent-container">
                        <div class="percent-text">${percentValue.toFixed(2)}%</div>
                        <div class="percent-bar">
                            <div class="percent-fill" style="width: ${percentValue}%"></div>
                        </div>
                    </div>
                </td>
            </tr>`;
        })
        .join("\n");
};

export const generateHtml = (coverage: Coverage): string => {
    const summary = generateCoverageSummary(coverage);

    const lines = coverage.lines;
    const maxGas = Math.max(
        ...lines.map((line) =>
            line.info.$ === "Covered"
                ? line.info.gasCosts.reduce((sum, gas) => sum + gas, 0)
                : 0,
        ),
    );

    const htmlLines = lines
        .map((line, index) =>
            generateLineHtml(line, index, maxGas, summary.totalGas),
        )
        .join("\n");

    const templateData = {
        coverage_percentage: summary.coveragePercentage.toFixed(2),
        covered_lines: summary.coveredLines,
        total_lines: summary.totalLines,
        total_gas: summary.totalGas,
        total_hits: summary.totalHits,
        instruction_rows: generateInstructionRowsHtml(summary),
    };

    const summaryHtml = renderTemplate(templates.summary, templateData);

    return renderTemplate(templates.main, {
        SUMMARY_CONTENT: summaryHtml,
        CODE_CONTENT: htmlLines,
    });
};
