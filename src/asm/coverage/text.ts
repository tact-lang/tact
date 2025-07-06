import { CoverageSummary, InstructionStat, Line } from "@/asm/coverage/data";
import { calculateTotalGas } from "@/asm/coverage/html";

export const generateShortSummary = (summary: CoverageSummary): string => {
    return [
        "Coverage Summary:",
        `Lines: ${summary.coveredLines}/${summary.totalLines} (${summary.coveragePercentage.toFixed(2)}%)`,
        `Total Gas: ${summary.totalGas}`,
        `Total Hits: ${summary.totalHits}`,
    ].join("\n");
};

export const generateTextReport = (
    lines: readonly Line[],
    summary: CoverageSummary,
): string => {
    const maxLineNumberWidth = lines.length.toString().length;

    const annotatedLines = lines
        .map((line, index) => {
            const { gasInfo, hitsInfo, status } = lineInfo(line);

            const lineNumber = index + 1;
            const lineNumberPres = lineNumber
                .toString()
                .padStart(maxLineNumberWidth);

            return `${lineNumberPres} ${status}| ${line.line.padEnd(40)} |${gasInfo.padEnd(10)} |${hitsInfo}`;
        })
        .join("\n");

    const summaryText = [
        "Coverage Summary:",
        `Lines: ${summary.coveredLines}/${summary.totalLines} (${summary.coveragePercentage.toFixed(2)}%)`,
        `Total Gas: ${summary.totalGas}`,
        `Total Hits: ${summary.totalHits}`,
        "",
        "Instruction Stats:",
        ...instructionsStats(summary),
    ].join("\n");

    return `${summaryText}\n\nAnnotated Code:\n${annotatedLines}`;
};

type LineInfo = {
    readonly gasInfo: string;
    readonly hitsInfo: string;
    readonly status: string;
};

const lineInfo = (line: Line): LineInfo => {
    if (line.info.$ === "Covered") {
        const totalGas = calculateTotalGas(line.info.gasCosts);
        const gasInfo = ` gas:${totalGas}`;
        const hitInfo = ` hits:${line.info.hits}`;
        return { gasInfo, hitsInfo: hitInfo, status: "✓ " };
    }

    if (line.info.$ === "Uncovered") {
        return { gasInfo: "", hitsInfo: "", status: "✗ " };
    }

    return { gasInfo: "", hitsInfo: "", status: "  " };
};

const instructionsStats = (summary: CoverageSummary) =>
    summary.instructionStats.map((stat) =>
        formatInstructionStat(stat, summary.totalGas),
    );

const formatInstructionStat = (stat: InstructionStat, totalGas: number) => {
    const name = stat.name.padEnd(15);
    const totalGasStr = stat.totalGas.toString().padEnd(3, "");
    const percent = ((stat.totalGas / totalGas) * 100).toFixed(2);
    return `  ${name} | ${totalGasStr} gas | ${stat.totalHits} hits | ${stat.avgGas} avg gas | ${percent}%`;
};
