import type { Address, Cell } from "@ton/core";

import type { NFTItem } from "@/benchmarks/nft/tact/output/collection_NFTItem";
import type {
    NFTCollection,
    RoyaltyParams,
} from "@/benchmarks/nft/tact/output/collection_NFTCollection";

import { testItem } from "@/benchmarks/nft/tests/item";
import {
    testTransferFee,
    testTransferForwardFeeDouble,
} from "@/benchmarks/nft/tests/transfer-fee";
import {
    testCollection,
    testDeploy,
    testRoyalty,
    testBatchDeploy,
} from "@/benchmarks/nft/tests/collection";

import type { BenchmarkResult, CodeSizeResult } from "@/benchmarks/utils/gas";

type FromInitItem = (
    owner: Address | null,
    content: Cell | null,
    collectionAddress: Address,
    itemIndex: bigint,
) => Promise<NFTItem>;
type FromInitCollection = (
    owner: Address,
    index: bigint,
    content: Cell,
    royaltyParams: RoyaltyParams,
) => Promise<NFTCollection>;

const testNFTItem = (fromInitItem: FromInitItem) => {
    testItem(fromInitItem);
    testTransferFee(fromInitItem);
    testTransferForwardFeeDouble(fromInitItem);
};

const testNFTCollection = (
    fromInitCollection: FromInitCollection,
    fromInitItem: FromInitItem,
) => {
    testCollection(fromInitCollection);
    testRoyalty(fromInitCollection);
    testDeploy(fromInitCollection, fromInitItem);
    testBatchDeploy(fromInitCollection, fromInitItem);
};

export const testNFT = (
    _benchmarkResults: BenchmarkResult,
    _codeSizeResults: CodeSizeResult,
    fromInitCollection: FromInitCollection,
    fromInitItem: FromInitItem,
) => {
    testNFTItem(fromInitItem);
    testNFTCollection(fromInitCollection, fromInitItem);
};

import { run } from "@/benchmarks/nft/run";

run(testNFT);
