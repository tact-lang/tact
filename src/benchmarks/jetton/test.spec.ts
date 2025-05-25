import type { BenchmarkResult, CodeSizeResult } from "@/benchmarks/utils/gas";
import { run } from "@/benchmarks/jetton/run";
import { testMinter } from "@/benchmarks/jetton/tests/minter";
import { testWallet, testBounces } from "@/benchmarks/jetton/tests/wallet";
import type {
    FromInitMinter,
    FromInitWallet,
} from "@/benchmarks/jetton/tests/utils";

const testJetton = (
    _benchmarkResults: BenchmarkResult,
    _codeSizeResults: CodeSizeResult,
    fromInitMinter: FromInitMinter,
    fromInitWallet: FromInitWallet,
) => {
    testMinter(fromInitMinter, fromInitWallet);
    testWallet(fromInitMinter, fromInitWallet);
    testBounces(fromInitMinter, fromInitWallet);
};

describe("jetton", () => {
    run(testJetton);
});
