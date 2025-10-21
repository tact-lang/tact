import "@ton/test-utils";
import type { Address } from "@ton/core";
import { Cell, beginCell, contractAddress } from "@ton/core";

import {
    generateResults,
    generateCodeSizeResults,
    printBenchmarkTable,
    type BenchmarkResult,
    type CodeSizeResult,
} from "@/benchmarks/utils/gas";
import { resolve } from "path";
import { readFileSync } from "fs";
import { posixNormalize } from "@/utils/filePath";

import { NFTCollection } from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import type { RoyaltyParams } from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import { NFTItem } from "@/benchmarks/nft/tact/output/collection_NFTItem";

import benchmarkResults from "@/benchmarks/nft/gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/nft/size.json";

const loadFunCNFTBoc = () => {
    const bocCollection = readFileSync(
        posixNormalize(resolve(__dirname, "./func/output/nft-collection.boc")),
    );

    const bocItem = readFileSync(
        posixNormalize(resolve(__dirname, "./func/output/nft-item.boc")),
    );

    return { bocCollection, bocItem };
};

const fromInitCollection = (
    owner: Address,
    index: bigint,
    content: Cell,
    royaltyParams: RoyaltyParams,
) => {
    const nftData = loadFunCNFTBoc();
    const __code = Cell.fromBoc(nftData.bocCollection)[0]!;

    const royaltyCell = beginCell()
        .storeUint(royaltyParams.nominator, 16)
        .storeUint(royaltyParams.dominator, 16)
        .storeAddress(royaltyParams.owner)
        .endCell();

    const __data = beginCell()
        .storeAddress(owner)
        .storeUint(index, 64)
        .storeRef(content)
        .storeRef(Cell.fromBoc(nftData.bocItem)[0]!)
        .storeRef(royaltyCell)
        .endCell();

    const __gen_init = { code: __code, data: __data };
    const address = contractAddress(0, __gen_init);
    return Promise.resolve(new NFTCollection(address, __gen_init));
};

const fromInitItem = (
    _owner: Address | null,
    _content: Cell | null,
    collectionAddress: Address,
    itemIndex: bigint,
) => {
    const nftData = loadFunCNFTBoc();
    const code = Cell.fromBoc(nftData.bocItem)[0]!;

    const data = beginCell()
        .storeUint(itemIndex, 64)
        .storeAddress(collectionAddress)
        .endCell();

    const init = { code, data };
    const address = contractAddress(0, init);
    return Promise.resolve(new NFTItem(address, init));
};

export const run = (
    testNFT: (
        benchmarkResults: BenchmarkResult,
        codeSizeResults: CodeSizeResult,
        fromInitCollection: (
            owner: Address,
            index: bigint,
            content: Cell,
            royaltyParams: RoyaltyParams,
        ) => Promise<NFTCollection>,
        fromInitItem: (
            owner: Address | null,
            content: Cell | null,
            collectionAddress: Address,
            itemIndex: bigint,
        ) => Promise<NFTItem>,
    ) => void,
) => {
    describe("NFT Gas Tests", () => {
        const fullResults = generateResults(benchmarkResults);
        const fullCodeSizeResults = generateCodeSizeResults(
            benchmarkCodeSizeResults,
        );

        describe("func", () => {
            const funcCodeSize = fullCodeSizeResults.at(0)!;
            const funcResult = fullResults.at(0)!;

            testNFT(funcResult, funcCodeSize, fromInitCollection, fromInitItem);
        });

        describe("tact", () => {
            const tactCodeSize = fullCodeSizeResults.at(-1)!;
            const tactResult = fullResults.at(-1)!;
            testNFT(
                tactResult,
                tactCodeSize,
                NFTCollection.fromInit.bind(NFTCollection),
                NFTItem.fromInit.bind(NFTItem),
            );
        });

        afterAll(() => {
            printBenchmarkTable(fullResults, fullCodeSizeResults, {
                implementationName: "FunC",
                printMode: "full",
            });
        });
    });
};
