import type { SendMessageResult } from "@ton/sandbox/dist/blockchain/Blockchain";
import chalk from "chalk";
import Table from "cli-table3";
import type { Blockchain } from "@ton/sandbox";
import type { Address, Cell } from "@ton/core";

export function getUsedGas(
    sendEnough: SendMessageResult,
    isExternal: boolean,
): number {
    return isExternal
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

type BenchmarkTableArgs = {
    implementationName: string;
    isFullTable: boolean;
};

export function printBenchmarkTable(
    codeSizeResults: CodeSizeResult[],
    results: BenchmarkResult[],
    args: BenchmarkTableArgs,
): void {
    const METRICS: readonly string[] = Object.keys(results[0]!.gas);
    const codeSizeMetrics = Object.keys(codeSizeResults[0]!.size);
    const first = results.at(0)!;
    const last = results.at(-1)!;

    const tableResults = args.isFullTable ? results : [first, last];

    if (tableResults.length === 0) {
        console.log("No benchmark results to display.");
        return;
    }

    const table = new Table({
        head: ["Run", ...METRICS, "PR #"],
        style: {
            head: ["cyan"],
            border: ["gray"],
        },
    });
    const changes = calculateChanges(tableResults, METRICS, "gas");

    tableResults

        .map(({ label, gas, pr: commit }, i) => [
            label,
            ...METRICS.map((metric, j) => `${gas[metric]} ${changes[i]?.[j]}`),
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

    const codeSizeTable = new Table({
        head: ["Run", ...codeSizeMetrics, "PR #"],
        style: {
            head: ["cyan"],
            border: ["gray"],
        },
    });

    const codeSizeChanges = calculateChanges(
        codeSizeResults,
        codeSizeMetrics,
        "size",
    );

    codeSizeResults
        .map(({ label, size, pr: commit }, i) => [
            label,
            ...codeSizeMetrics.map(
                (metric, j) => `${size[metric]} ${codeSizeChanges[i]?.[j]}`,
            ),
            commit
                ? commit.substring(
                      commit.lastIndexOf("/") + 1,
                      commit.lastIndexOf("/") + 8,
                  )
                : "-",
        ])
        .forEach((arr) => {
            codeSizeTable.push(arr);
        });

    const output = [];
    output.push(table.toString());
    output.push("\nCode Size Results:");
    output.push(codeSizeTable.toString());

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
