import { exec } from "child_process";
import { readFile, writeFile } from "fs/promises";
import { join } from "path";
import { z } from "zod";
import type { RawBenchmarkResult, RawCodeSizeResult } from "./util";

const runBenchmark = (specPath: string): Promise<string> => {
    return new Promise((resolve) => {
        exec(`yarn jest --json ${specPath}`, (_, stdout) => {
            resolve(stdout);
        });
    });
};

const JestStatusStringEnum = z.enum(["passed", "failed"]);

const JestOutputSchema = z.object({
    success: z.literal(false), // if this is true, we don't need to update benchmark results
    testResults: z
        .array(
            z.object({
                assertionResults: z.array(
                    z.object({
                        status: JestStatusStringEnum,
                        title: z.string(),
                        failureDetails: z.array(
                            z.object({
                                matcherResult: z.object({
                                    actual: z.number(),
                                    expected: z.number(),
                                }),
                            }),
                        ),
                    }),
                ),
            }),
        )
        .nonempty(),
});

type BenchmarkDiff = {
    label: string;
    diff: Record<string, number>;
};

const parseBenchmarkOutput = (output: string): BenchmarkDiff | undefined => {
    const jestOutput = output.split("\n")[1];
    if (typeof jestOutput === "undefined") {
        return;
    }

    const jestParseResult = JestOutputSchema.safeParse(JSON.parse(jestOutput));
    if (!jestParseResult.success) {
        return;
    }

    const jestData = jestParseResult.data;

    const gasUpdates: Record<string, number> = {};

    jestData.testResults[0].assertionResults
        .filter(
            (assertion) =>
                assertion.status === "failed" &&
                typeof assertion.failureDetails[0] !== "undefined",
        )
        .forEach((assertion) => {
            gasUpdates[assertion.title] =
                assertion.failureDetails[0]!.matcherResult.actual;
        });

    return {
        label: `Benchmark ${new Date().toISOString().split("T")[0]}`,
        diff: gasUpdates,
    };
};

const updateGasResultsFile = async (
    filePath: string,
    newResult: BenchmarkDiff,
) => {
    const fileContent = await readFile(filePath, "utf-8");
    const benchmarkResults: RawBenchmarkResult = JSON.parse(fileContent);

    const lastResult = benchmarkResults.results.at(-1);
    if (typeof lastResult === "undefined") {
        return;
    }

    const changedKeys = Object.keys(newResult.diff).filter(
        (key) => typeof lastResult.gas[key] !== "undefined",
    );

    if (changedKeys.length === 0) {
        return;
    }

    benchmarkResults.results.push({
        label: newResult.label,
        pr: null,
        gas: Object.fromEntries(
            Object.entries(lastResult.gas).map(([key, value]) => [
                key,
                newResult.diff[key] ? newResult.diff[key].toString() : value,
            ]),
        ),
    });

    await writeFile(filePath, JSON.stringify(benchmarkResults, null, 2) + '\n');
};

const updateCodeSizeResultsFile = async (
    filePath: string,
    newResult: BenchmarkDiff,
) => {
    const fileContent = await readFile(filePath, "utf-8");
    const benchmarkResults: RawCodeSizeResult = JSON.parse(fileContent);

    const lastResult = benchmarkResults.results.at(-1);
    if (typeof lastResult === "undefined") {
        return;
    }

    const changedKeys = Object.keys(newResult.diff).filter(
        (key) => typeof lastResult.size[key] !== "undefined",
    );

    if (changedKeys.length === 0) {
        return;
    }

    benchmarkResults.results.push({
        label: newResult.label,
        pr: null,
        size: Object.fromEntries(
            Object.entries(lastResult.size).map(([key, value]) => [
                key,
                newResult.diff[key] ? newResult.diff[key].toString() : value,
            ]),
        ),
    });

    await writeFile(filePath, JSON.stringify(benchmarkResults, null, 2) + '\n');
};

const updateBenchmarkResults = async (
    filePath: string,
    newResult: BenchmarkDiff,
    type: "gas" | "code_size",
) => {
    if (type === "gas") {
        await updateGasResultsFile(filePath, newResult);
    } else {
        await updateCodeSizeResultsFile(filePath, newResult);
    }
};

const main = async () => {
    try {
        const benchmarkPaths = [
            join(__dirname, "jetton", "jetton.spec.ts"),
            join(__dirname, "escrow", "escrow.spec.ts"),
        ];

        const fetchBenchmarkResults = async (specPath: string) => {
            console.log(`Running benchmark: ${specPath}`);

            const output = await runBenchmark(specPath);
            const newResult = parseBenchmarkOutput(output);

            if (typeof newResult === "undefined") {
                return;
            }

            const resultsGas = join(specPath, "..", "results_gas.json");
            const resultsCodeSize = join(
                specPath,
                "..",
                "results_code_size.json",
            );

            await updateBenchmarkResults(resultsGas, newResult, "gas");
            await updateBenchmarkResults(
                resultsCodeSize,
                newResult,
                "code_size",
            );
            console.log(`Updated benchmarks for ${resultsGas}`);
        };

        await Promise.all(benchmarkPaths.map(fetchBenchmarkResults));
    } catch (error) {
        console.error(error);
    }
};

void main();
