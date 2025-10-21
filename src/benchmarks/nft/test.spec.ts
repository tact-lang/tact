import { type FromInitItem, testItem } from "@/benchmarks/nft/tests/item";
import {
    type FromInitCollection,
    testCollection,
} from "@/benchmarks/nft/tests/collection";

import type { BenchmarkResult, CodeSizeResult } from "@/benchmarks/utils/gas";

export const testNFT = (
    _benchmarkResults: BenchmarkResult,
    _codeSizeResults: CodeSizeResult,
    fromInitCollection: FromInitCollection,
    fromInitItem: FromInitItem,
) => {
    testItem(fromInitItem);
    testCollection(fromInitCollection, fromInitItem);
};

import { run } from "@/benchmarks/nft/run";

run(testNFT);
