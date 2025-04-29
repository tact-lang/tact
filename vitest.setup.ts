import { afterAll, expect } from "vitest";
import { compareTransactionForTest } from "@ton/test-utils/dist/test/transaction";
import {
    compareAddressForTest,
    compareCellForTest,
    compareSliceForTest,
} from "@ton/test-utils/dist/test/comparisons";
import coverage from "@tact-lang/coverage";
import path = require("path");
import fc from "fast-check";

function wrapComparer<T>(
    comparer: (
        subject: any,
        cmp: T,
    ) => { pass: boolean; posMessage: () => string; negMessage: () => string },
) {
    return function (actual: any, cmp: T) {
        const result = comparer(actual, cmp);
        return {
            pass: result.pass,
            message: () =>
                result.pass ? result.negMessage() : result.posMessage(),
        };
    };
}

const toHaveTransaction = wrapComparer(compareTransactionForTest);
const toEqualCell = wrapComparer(compareCellForTest);
const toEqualAddress = wrapComparer(compareAddressForTest);
const toEqualSlice = wrapComparer(compareSliceForTest);

beforeAll(async () => {
    if (process.env.COVERAGE === "true") {
        coverage.beginCoverage();
    }
});

afterAll(async () => {
    if (process.env.COVERAGE === "true") {
        coverage.completeCoverage([
            path.resolve(
                __dirname,
                "src",
                "test",
                "codegen",
                "output",
                "*.boc",
            ),
            path.resolve(
                __dirname,
                "src",
                "test",
                "e2e-emulated",
                "output",
                "*.boc",
            ),
            path.resolve(
                __dirname,
                "src",
                "benchmarks",
                "contracts",
                "output",
                "*.boc",
            ),
        ]);
    }
});

expect.extend({
    toHaveTransaction,
    toEqualCell,
    toEqualAddress,
    toEqualSlice,
});

function sanitizeObject(obj: any, options: any): any {
    const { excludeKeys = [], valueTransformers = {} } = options;

    if (Array.isArray(obj)) {
        return obj.map((item) => sanitizeObject(item as any, options)) as any;
    }

    if (obj !== null && typeof obj === "object") {
        const newObj: any = {};
        for (const [key, value] of Object.entries(obj)) {
            if (!excludeKeys.includes(key)) {
                const transformer = valueTransformers[key as any];
                newObj[key] = transformer
                    ? transformer(value)
                    : sanitizeObject(value as any, options);
            }
        }
        return newObj;
    }

    return obj as any;
}

fc.configureGlobal({
    reporter: (log: any) => {
        if (log.failed) {
            const sanitizedCounterexample = sanitizeObject(log.counterexample, {
                excludeKeys: ["id", "loc"],
                valueTransformers: {
                    value: (val: unknown) =>
                        typeof val === "bigint" ? val.toString() : val,
                } as any,
            });

            const errorMessage = `
        Property failed after ${log.numRuns} tests
        Seed: ${log.seed}
        Path: ${log.counterexamplePath}
        Counterexample: ${JSON.stringify(sanitizedCounterexample, null, 0)}
        Errors: ${log.error ?? "Unknown error"}
      `;
            throw new Error(errorMessage);
        }
    },
});
