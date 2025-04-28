import { afterAll, expect } from "vitest";
import { compareTransactionForTest } from "@ton/test-utils/dist/test/transaction";
import {
    compareAddressForTest,
    compareCellForTest,
    compareSliceForTest,
} from "@ton/test-utils/dist/test/comparisons";
import coverage from "@tact-lang/coverage";
import path from "path";

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

expect.extend({
    toHaveTransaction,
    toEqualCell,
    toEqualAddress,
    toEqualSlice,
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
