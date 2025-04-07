import type { SendMessageResult } from "@ton/sandbox/dist/blockchain/Blockchain";
import chalk from "chalk";
import Table from "cli-table3";
import type { Blockchain } from "@ton/sandbox";
import type { Address, Cell } from "@ton/core";

export function getUsedGas(
    sendEnough: SendMessageResult,
    kind: "external" | "internal",
): number {
    return kind === "external"
        ? getUsedGasExternal(sendEnough)
        : getUsedGasInternal(sendEnough);
}

function getUsedGasExternal(sendResult: SendMessageResult): number {
    const externalTx = sendResult.transactions[0];

    if (typeof externalTx === "undefined") {
        return 0;
    }

    return externalTx.description.type === "generic" &&
        externalTx.description.computePhase.type === "vm"
        ? Number(externalTx.description.computePhase.gasUsed)
        : 0;
}

function getUsedGasInternal(sendResult: SendMessageResult): number {
    return sendResult.transactions
        .slice(1)
        .map((t) =>
            t.description.type === "generic" &&
            t.description.computePhase.type === "vm"
                ? Number(t.description.computePhase.gasUsed)
                : 0,
        )
        .reduceRight((prev, cur) => prev + cur);
}

type BenchmarkResult = {
    label: string;
    pr: string | undefined;
    gas: Record<string, number>;
};

export type RawBenchmarkResult = {
    results: {
        label: string;
        pr: string | null;
        gas: Record<string, string>;
    }[];
};

export function generateResults(
    benchmarkResults: RawBenchmarkResult,
): BenchmarkResult[] {
    return benchmarkResults.results.map((result) => ({
        label: result.label,
        pr: result.pr ?? undefined,
        gas: Object.fromEntries(
            Object.entries(result.gas).map(([key, value]) => [
                key,
                Number(value),
            ]),
        ),
    }));
}

export type RawCodeSizeResult = {
    results: {
        label: string;
        pr: string | null;
        size: Record<string, string>;
    }[];
};

type CodeSizeResult = {
    label: string;
    pr: string | undefined;
    size: Record<string, number>;
};

export function generateCodeSizeResults(
    benchmarkResults: RawCodeSizeResult,
): CodeSizeResult[] {
    return benchmarkResults.results.map((result) => ({
        label: result.label,
        pr: result.pr ?? undefined,
        size: Object.fromEntries(
            Object.entries(result.size).map(([key, value]) => [
                key,
                Number(value),
            ]),
        ),
    }));
}

const calculateCellsAndBits = (
    root: Cell,
    visited: Set<string> = new Set<string>(),
) => {
    const hash = root.hash().toString("hex");
    if (visited.has(hash)) {
        return { cells: 0, bits: 0 };
    }
    visited.add(hash);

    let cells = 1;
    let bits = root.bits.length;
    for (const ref of root.refs) {
        const childRes = calculateCellsAndBits(ref, visited);
        cells += childRes.cells;
        bits += childRes.bits;
    }
    return { cells, bits };
};

export async function getStateSizeForAccount(
    blockchain: Blockchain,
    address: Address,
): Promise<{ cells: number; bits: number }> {
    const accountState = (await blockchain.getContract(address)).accountState;
    if (!accountState || accountState.type !== "active") {
        throw new Error("Account state not found");
    }
    if (!accountState.state.code || !accountState.state.data) {
        throw new Error("Account state code or data not found");
    }
    const accountCode = accountState.state.code;
    const accountData = accountState.state.data;

    const codeSize = calculateCellsAndBits(accountCode);
    const dataSize = calculateCellsAndBits(accountData);

    return {
        cells: codeSize.cells + dataSize.cells,
        bits: codeSize.bits + dataSize.bits,
    };
}

function calculateChange(prev: number, curr: number): string {
    const change = (((curr - prev) / prev) * 100).toFixed(2);
    const number = parseFloat(change);
    if (number === 0) {
        return chalk.gray(`same`);
    }
    return number >= 0
        ? chalk.redBright(`(+${change}%)`)
        : chalk.green(`(${change}%)`);
}

function calculateChanges<
    T extends { gas?: Record<string, number>; size?: Record<string, number> },
>(results: T[], metrics: readonly string[], type: "gas" | "size"): string[][] {
    return results.reduce<string[][]>((changes, currentResult, index) => {
        if (index === 0) {
            return [metrics.map(() => "")];
        }

        const previousResult = results.at(index - 1);
        const rowChanges =
            typeof previousResult !== "undefined"
                ? metrics.map((metric) =>
                      calculateChange(
                          previousResult[type]![metric]!,
                          currentResult[type]![metric]!,
                      ),
                  )
                : [];

        return [...changes, rowChanges];
    }, []);
}

/**
 * Defines the modes for printing benchmark results:
 * - `"first-last"`: Displays only the first and last benchmark results for comparison.
 * - `"full"`: Displays all benchmark results in detail.
 * - `"last-diff"`: Displays the last three benchmark results to highlight recent changes.
 */
type BenchmarkPrintMode = "first-last" | "full" | "last-diff";

type BenchmarkTableArgs = {
    implementationName: string;
    printMode: BenchmarkPrintMode;
};

function createTable<
    T extends {
        gas?: Record<string, number>;
        size?: Record<string, number>;
        label: string;
        pr?: string;
    },
>(results: T[], metrics: readonly string[], type: "gas" | "size"): string {
    const table = new Table({
        head: ["Run", ...metrics, "PR #"],
        style: {
            head: ["cyan"],
            border: ["gray"],
        },
    });

    const changes = calculateChanges(results, metrics, type);

    results
        .map(({ label, [type]: data, pr: commit }, i) => [
            label,
            ...metrics.map(
                (metric, j) => `${data![metric]} ${changes[i]?.[j]}`,
            ),
            commit
                ? commit.substring(
                      commit.lastIndexOf("/") + 1,
                      commit.lastIndexOf("/") + 8,
                  )
                : "-",
        ])
        .forEach((arr) => {
            table.push(arr);
        });

    return table.toString();
}

const handleTablePrintMode = (
    results: BenchmarkResult[] | CodeSizeResult[],
    printMode: BenchmarkPrintMode,
) => {
    switch (printMode) {
        case "first-last":
            return [results.at(0)!, results.at(-1)!];
        case "last-diff":
            return results.slice(results.length - 3);
        case "full":
            return results;
    }
};

const handlePrintModeEnv = (
    argPrintMode: BenchmarkPrintMode,
): BenchmarkPrintMode => {
    if (typeof process.env.PRINT_MODE === "undefined") {
        return argPrintMode;
    }

    switch (process.env.PRINT_MODE) {
        case "first-last":
        case "full":
        case "last-diff":
            return process.env.PRINT_MODE;
        default:
            return argPrintMode;
    }
};

export function printBenchmarkTable(
    results: BenchmarkResult[],
    codeSizeResults: CodeSizeResult[] | undefined,
    args: BenchmarkTableArgs,
): void {
    if (
        typeof process.env.PRINT_TABLE === "undefined" ||
        process.env.PRINT_TABLE === "false"
    ) {
        return;
    }

    const printMode = handlePrintModeEnv(args.printMode);

    const METRICS: readonly string[] = Object.keys(results[0]!.gas);
    const first = results.at(0)!;
    const last = results.at(-1)!;

    const tableResults = handleTablePrintMode(results, printMode);

    if (tableResults.length === 0) {
        console.log("No benchmark results to display.");
        return;
    }

    const gasTable = createTable(tableResults, METRICS, "gas");

    const output = [];
    output.push(`Gas Usage Results (print mode ${printMode}):`);
    output.push(gasTable);

    if (typeof codeSizeResults !== "undefined") {
        const codeSizeMetrics = Object.keys(codeSizeResults[0]!.size);
        const codeSizeTableResults = handleTablePrintMode(
            codeSizeResults,
            printMode,
        );

        if (codeSizeTableResults.length === 0) {
            console.log("No code size benchmark results to display.");
            return;
        }

        const codeSizeTable = createTable(
            codeSizeTableResults,
            codeSizeMetrics,
            "size",
        );

        output.push(`\nCode size Results (print mode ${printMode}):`);
        output.push(codeSizeTable);
    }

    output.push(`\nComparison with ${args.implementationName} implementation:`);
    output.push(
        ...METRICS.map((metric) => {
            const ratio =
                (Number(last.gas[metric]) / Number(first.gas[metric])) * 100;

            return `${metric.charAt(0).toUpperCase() + metric.slice(1)}: ${
                ratio > 100
                    ? chalk.redBright(`${ratio.toFixed(2)}%`)
                    : chalk.green(`${ratio.toFixed(2)}%`)
            } of ${args.implementationName} gas usage`;
        }),
    );

    console.log(output.join("\n"));
}
