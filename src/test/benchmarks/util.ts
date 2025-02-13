import { SendMessageResult } from "@ton/sandbox/dist/blockchain/Blockchain";
import chalk from "chalk";
import Table from "cli-table3";

export function getUsedGas(sendEnough: SendMessageResult): number {
    return sendEnough.transactions
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
    commit: string | null;
    gas: Record<string, number>;
};

type RawBenchmarkResult = {
    results: {
        label: string;
        commit?: string;
        gas: Record<string, string>;
    }[];
};

export function generateResults(
    benchmarkResults: RawBenchmarkResult,
): BenchmarkResult[] {
    return benchmarkResults.results.map((result) => ({
        label: result.label,
        commit: result.commit ?? null,
        gas: Object.fromEntries(
            Object.entries(result.gas).map(([key, value]) => [
                key,
                Number(value),
            ]),
        ),
    }));
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

function calculateChanges(
    results: BenchmarkResult[],
    METRICS: readonly string[],
): string[][] {
    return results.reduce<string[][]>((changes, currentResult, index) => {
        if (index === 0) {
            return [METRICS.map(() => "")];
        }

        const previousResult = results.at(index - 1);
        const rowChanges =
            typeof previousResult !== "undefined"
                ? METRICS.map((metric) =>
                      calculateChange(
                          previousResult.gas[metric]!,
                          currentResult.gas[metric]!,
                      ),
                  )
                : [];

        return [...changes, rowChanges];
    }, []);
}

export function printBenchmarkTable(results: BenchmarkResult[]): void {
    const METRICS: readonly string[] = Object.keys(results[0]!.gas);

    if (results.length === 0) {
        console.log("No benchmark results to display.");
        return;
    }

    const table = new Table({
        head: ["Run", ...METRICS, "Commit"],
        style: {
            head: ["cyan"],
            border: ["gray"],
        },
    });

    const changes = calculateChanges(results, METRICS);

    results
        .map(({ label, gas, commit }, i) => [
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

    const output = [];
    output.push(table.toString());

    const first = results[0]!;
    const last = results[results.length - 1]!;

    output.push("\nComparison with FunC implementation:");
    output.push(
        ...METRICS.map((metric) => {
            const ratio =
                (Number(last.gas[metric]) / Number(first.gas[metric])) * 100;

            return `${metric.charAt(0).toUpperCase() + metric.slice(1)}: ${
                ratio > 100
                    ? chalk.redBright(`${ratio.toFixed(2)}%`)
                    : chalk.green(`${ratio.toFixed(2)}%`)
            } of FunC gas usage`;
        }),
    );

    console.log(output.join("\n"));
}
