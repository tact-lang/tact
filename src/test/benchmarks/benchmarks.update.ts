import { exec } from "child_process";
import { readFile, writeFile } from "fs/promises";
import { join } from "path";
import { execSync } from "child_process";
import { z } from "zod";
import type { BenchmarkResult, RawBenchmarkResult } from "./util";

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

const parseBenchmarkOutput = (output: string): BenchmarkResult | undefined => {
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

    // Get current git commit
    const commitHash = execSync("git rev-parse HEAD").toString().trim();

    return {
        label: `Benchmark ${new Date().toISOString().split("T")[0]}`,
        commit: `https://github.com/tact-lang/tact/commit/${commitHash}`,
        gas: gasUpdates,
    };
};

const updateResultsFile = async (
    filePath: string,
    newResult: BenchmarkResult,
) => {
    const fileContent = await readFile(filePath, "utf-8");
    const benchmarkResults: RawBenchmarkResult = JSON.parse(fileContent);

    const lastResult = benchmarkResults.results.at(-1);
    if (typeof lastResult === "undefined") {
        return;
    }

    benchmarkResults.results.push({
        label: newResult.label,
        commit: newResult.commit ?? null,
        gas: Object.fromEntries(
            Object.entries(lastResult.gas).map(([key, value]) => [
                key,
                newResult.gas[key] ? newResult.gas[key].toString() : value,
            ]),
        ),
    });

    await writeFile(filePath, JSON.stringify(benchmarkResults, null, 2));
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

            const resultsFilePath = join(specPath, "..", "results.json");
            await updateResultsFile(resultsFilePath, newResult);

            console.log(`Updated benchmarks for ${resultsFilePath}`);
        };

        await Promise.all(benchmarkPaths.map(fetchBenchmarkResults));
    } catch (error) {
        console.error(error);
    }
};

void main();
