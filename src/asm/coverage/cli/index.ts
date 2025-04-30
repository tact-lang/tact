import { Cell } from "@ton/core";
import { readFileSync, writeFileSync } from "node:fs";
import { generateHtml } from "@/asm/coverage/html";
import * as path from "node:path";
import * as fs from "node:fs";
import { collectAsmCoverage, collectFuncCoverage } from "@/asm/coverage/index";
import { CoverageSummary } from "@/asm/coverage/data";

const USAGE =
    "Usage: coverage <boc-file-path> <log-file-path> [<func-source-path> <func-mapping-path>]";

const main = () => {
    const args = process.argv.slice(2);

    const bocFilePath = args.at(0);
    const logPath = args.at(1);
    const funcSources = args.at(2);
    const funcMappingPath = args.at(3);
    const outputDir = "./";

    if (bocFilePath === undefined || logPath === undefined) {
        console.log(USAGE);
        process.exit(1);
    }

    console.log("⌛ Generating coverage reports...");

    const cell = Cell.fromBoc(readFileSync(bocFilePath))[0];
    if (!cell) {
        console.error("Cannot parse BoC");
        process.exit(1);
    }

    const logs = readFileSync(logPath, "utf8");

    if (funcSources !== undefined && funcMappingPath !== undefined) {
        const { lines, summary } = collectFuncCoverage(
            cell,
            logs,
            funcSources,
            funcMappingPath,
        );

        printSummary("func", summary);

        if (!fs.existsSync(outputDir)) {
            fs.mkdirSync(outputDir, { recursive: true });
        }

        const combinedReportPath = path.join(outputDir, "coverage-func.html");
        writeFileSync(combinedReportPath, generateHtml(lines));
        console.log(`\n✅ Report generated: ${combinedReportPath}`);
    }

    {
        const { lines, summary } = collectAsmCoverage(cell, logs);

        printSummary("asm", summary);

        if (!fs.existsSync(outputDir)) {
            fs.mkdirSync(outputDir, { recursive: true });
        }

        const combinedReportPath = path.join(outputDir, "coverage-asm.html");
        writeFileSync(combinedReportPath, generateHtml(lines));
        console.log(`\n✅ Report generated: ${combinedReportPath}`);
    }
};

const printSummary = (kind: "func" | "asm", summary: CoverageSummary) => {
    const forKind = kind === "func" ? "FUNC CODE" : "ASSEMBLY CODE";
    const linesKind = kind === "func" ? "Lines" : "Instructions";

    console.log(`\n📊 COVERAGE SUMMARY FOR ${forKind}`);
    console.log("==================");
    console.log(`Coverage: ${summary.coveragePercentage.toFixed(2)}%`);
    console.log(`${linesKind}: ${summary.coveredLines}/${summary.totalLines}`);
    console.log(`Total Gas Used: ${summary.totalGas}`);
    console.log(`Executed ${linesKind}: ${summary.totalHits}`);
};

main();
