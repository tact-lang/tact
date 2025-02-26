import { exec } from "child_process";
import { readFile, writeFile } from "fs/promises";
import { join } from "path";
import { z } from "zod";
import type {
    BenchmarkResult,
    CodeSizeResult,
    RawBenchmarkResult,
    RawCodeSizeResult,
} from "./util";

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
    gas: Record<string, number>;
};

const parseBenchmarkOutput = (output: string): BenchmarkDiff | undefined => {
    const jestOutput = output.split("\n")[2];
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
        gas: gasUpdates,
    };
};

const updateResultsFile = async (
    filePaths: string[],
    newResult: BenchmarkDiff,
) => {
    for (const filePath of filePaths) {
        try {
            const fileContent = await readFile(filePath, "utf-8");
            const benchmarkResults: RawBenchmarkResult | RawCodeSizeResult =
                JSON.parse(fileContent);

            const lastResult = benchmarkResults.results.at(-1);

            if (typeof lastResult === "undefined") {
                return;
            }

            const handleGasBenchmark = (diff: RawCodeSizeResult, results: ) => {

            }

            const benchmarkRecords =
                "gas" in lastResult ? lastResult.gas : lastResult.size;

            benchmarkResults.results.push({
                label: newResult.label,
                pr: null,
                ["gas" in lastResult ? "gas" : "size"]: {},
            });

            await writeFile(
                filePath,
                JSON.stringify(benchmarkResults, null, 2),
            );
        } catch (_) {
            return;
        }
    }
    const benchmarkResults: RawBenchmarkResult = JSON.parse(fileContent);

    const lastResult = benchmarkResults.results.at(-1);
    if (typeof lastResult === "undefined") {
        return;
    }

    benchmarkResults.results.push({
        label: newResult.label,
        pr: newResult.pr ?? null,
        gas: Object.fromEntries(
            Object.entries(lastResult.gas).map(([key, value]) => [
                key,
                newResult.gas[key] ? newResult.gas[key].toString() : value,
            ]),
        ),
    });

    await writeFile(filePath, JSON.stringify(benchmarkResults, null, 2));
};

const updateCodeSizeResultsFile = async (
    filePath: string,
    newResult: CodeSizeResult,
) => {
    const fileContent = await readFile(filePath, "utf-8");
    const benchmarkResults: RawCodeSizeResult = JSON.parse(fileContent);

    const lastResult = benchmarkResults.results.at(-1);
    if (typeof lastResult === "undefined") {
        return;
    }

    benchmarkResults.results.push({
        label: newResult.label,
        pr: newResult.pr ?? null,
        size: Object.fromEntries(
            Object.entries(lastResult.size).map(([key, value]) => [
                key,
                newResult.size[key] ? newResult.size[key].toString() : value,
            ]),
        ),
    });

    await writeFile(filePath, JSON.stringify(benchmarkResults, null, 2));
};

const main = async () => {
    try {
        const benchmarkPaths = [
            join(__dirname, "jetton", "jetton.spec.ts"),
            // join(__dirname, "escrow", "escrow.spec.ts"),
        ];

        const fetchBenchmarkResults = async (specPath: string) => {
            console.log(`Running benchmark: ${specPath}`);

            const output = await runBenchmark(specPath);
            const newResult = parseBenchmarkOutput(output);

            if (typeof newResult === "undefined") {
                return;
            }

            console.log(newResult);

            const resultsGas = join(specPath, "..", "results_gas.json");
            const resultsCodeSize = join(
                specPath,
                "..",
                "results_code_size.json",
            );

            // await updateResultsFile(resultsGas, newResult);
            // await updateCodeSizeResultsFile(resultsCodeSize, newResult);
            console.log(`Updated benchmarks for ${resultsGas}`);
        };

        await Promise.all(benchmarkPaths.map(fetchBenchmarkResults));
    } catch (error) {
        console.error(error);
    }
};

void main();
