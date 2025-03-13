import { exec } from "child_process";
import { readFile, writeFile } from "fs/promises";
import { join } from "path";
import { z } from "zod";
import {
    generateCodeSizeResults,
    generateResults,
    printBenchmarkTable,
    type RawBenchmarkResult,
    type RawCodeSizeResult,
} from "./utils/gas";
import { createInterface } from "readline/promises";
import { globSync } from "../test/utils/all-in-folder.build";

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

const readline = createInterface({
    input: process.stdin,
    output: process.stdout,
});

type BenchmarkDiff = {
    label: string;
    pr: string | null;
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
        pr: null,
    };
};

const readBenchInfo = async (): Promise<{
    label: string;
    pr: string | null;
}> => {
    const data = await readFile(join(__dirname, `output`, `prompt.json`));

    return JSON.parse(data.toString());
};

const tryReadFile = async (path: string): Promise<string | undefined> => {
    try {
        return await readFile(path, "utf-8");
    } catch {
        return undefined;
    }
};

const updateGasResultsFile = async (
    filePath: string,
    newResult: BenchmarkDiff,
    isUpdate: boolean,
) => {
    const fileContent = await tryReadFile(filePath);
    if (typeof fileContent === "undefined") {
        return;
    }

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

    if (!isUpdate) {
        lastResult.gas = Object.fromEntries(
            Object.entries(lastResult.gas).map(([key, value]) => [
                key,
                newResult.diff[key] ? newResult.diff[key].toString() : value,
            ]),
        );
    } else {
        benchmarkResults.results.push({
            label: newResult.label,
            pr: newResult.pr,
            gas: Object.fromEntries(
                Object.entries(lastResult.gas).map(([key, value]) => [
                    key,
                    newResult.diff[key]
                        ? newResult.diff[key].toString()
                        : value,
                ]),
            ),
        });
    }

    await writeFile(filePath, JSON.stringify(benchmarkResults, null, 2) + "\n");
    return generateResults(benchmarkResults);
};

const updateCodeSizeResultsFile = async (
    filePath: string,
    newResult: BenchmarkDiff,
    isUpdate: boolean,
) => {
    const fileContent = await tryReadFile(filePath);
    if (typeof fileContent === "undefined") {
        return;
    }

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

    if (!isUpdate) {
        lastResult.size = Object.fromEntries(
            Object.entries(lastResult.size).map(([key, value]) => [
                key,
                newResult.diff[key] ? newResult.diff[key].toString() : value,
            ]),
        );
    } else {
        benchmarkResults.results.push({
            label: newResult.label,
            pr: newResult.pr,
            size: Object.fromEntries(
                Object.entries(lastResult.size).map(([key, value]) => [
                    key,
                    newResult.diff[key]
                        ? newResult.diff[key].toString()
                        : value,
                ]),
            ),
        });
    }

    await writeFile(filePath, JSON.stringify(benchmarkResults, null, 2) + "\n");
    return generateCodeSizeResults(benchmarkResults);
};

const main = async () => {
    try {
        const benchmarkPaths = globSync(["**/*.spec.ts"], {
            cwd: __dirname,
        });

        const benchmarkName = process.argv[2];

        const actualBenchmarkPaths =
            typeof benchmarkName === "undefined"
                ? benchmarkPaths
                : benchmarkPaths.filter((path) => path.includes(benchmarkName));

        const fetchBenchmarkResults = async (specPath: string) => {
            console.log(`\nRunning benchmark: ${specPath}`);

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

            const isUpdate = typeof process.env.ADD !== "undefined";

            if (isUpdate) {
                const { label, pr } = await readBenchInfo();

                newResult.label = label;
                newResult.pr = pr;
            }

            const gasResult = await updateGasResultsFile(
                resultsGas,
                newResult,
                isUpdate,
            );
            const sizeResult = await updateCodeSizeResultsFile(
                resultsCodeSize,
                newResult,
                isUpdate,
            );

            if (typeof gasResult === "undefined") {
                return;
            }

            console.log(`\nUpdated benchmarks for ${resultsGas}\n`);

            printBenchmarkTable(gasResult, sizeResult, {
                implementationName: "FunC",
                printMode: "last-diff",
            });
        };

        for (const path of actualBenchmarkPaths) {
            await fetchBenchmarkResults(join(__dirname, path));
        }

        readline.close();
    } catch (error) {
        console.error(error);
    }
};

void main();
