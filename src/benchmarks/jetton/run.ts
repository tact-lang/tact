import "@ton/test-utils";
import { type Address, Cell, beginCell, contractAddress } from "@ton/core";

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
import { JettonMinter } from "@/benchmarks/jetton/tact/output/minter_JettonMinter";
import { JettonWallet } from "@/benchmarks/jetton/tact/output/minter_JettonWallet";

import benchmarkResults from "@/benchmarks/jetton/gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/jetton/size.json";
import type {
    FromInitMinter,
    FromInitWallet,
} from "@/benchmarks/jetton/tests/utils";

const loadFunCJettonsBoc = () => {
    const bocMinter = readFileSync(
        posixNormalize(
            resolve(__dirname, "./func/output/jetton-minter-discoverable.boc"),
        ),
    );

    const bocWallet = readFileSync(
        posixNormalize(resolve(__dirname, "./func/output/jetton-wallet.boc")),
    );

    return { bocMinter, bocWallet };
};
export const run = (
    testJetton: (
        benchmarkResults: BenchmarkResult,
        codeSizeResults: CodeSizeResult,
        fromInitMinter: FromInitMinter,
        fromInitWallet: FromInitWallet,
    ) => void,
) => {
    describe("Jetton Gas Tests", () => {
        const fullResults = generateResults(benchmarkResults);
        const fullCodeSizeResults = generateCodeSizeResults(
            benchmarkCodeSizeResults,
        );

        describe("func", () => {
            const funcCodeSize = fullCodeSizeResults.at(0)!;
            const funcResult = fullResults.at(0)!;

            const fromInitMinter = (
                salt: bigint,
                admin: Address,
                _content: Cell,
            ) => {
                const jettonData = loadFunCJettonsBoc();
                const minterCell = Cell.fromBoc(jettonData.bocMinter)[0]!;
                const walletCell = Cell.fromBoc(jettonData.bocWallet)[0]!;

                const stateInitMinter = beginCell()
                    .storeCoins(0)
                    .storeAddress(admin)
                    .storeRef(beginCell().storeUint(1, 1).endCell()) // as salt
                    .storeRef(walletCell)
                    .endCell();

                const init = { code: minterCell, data: stateInitMinter };
                const address = contractAddress(0, init);
                return Promise.resolve(new JettonMinter(address, init));
            };

            const fromInitWallet = (
                owner: Address,
                jettonMinter: Address,
                jettonAmount: bigint,
            ) => {
                const __code = Cell.fromBoc(loadFunCJettonsBoc().bocWallet)[0]!;
                const __data = beginCell()
                    .storeCoins(jettonAmount)
                    .storeAddress(owner)
                    .storeAddress(jettonMinter)
                    .storeRef(__code)
                    .endCell();

                const __gen_init = { code: __code, data: __data };
                const address = contractAddress(0, __gen_init);
                return Promise.resolve(new JettonWallet(address, __gen_init));
            };

            testJetton(
                funcResult,
                funcCodeSize,
                fromInitMinter,
                fromInitWallet,
            );
        });

        describe("tact", () => {
            const tactCodeSize = fullCodeSizeResults.at(-1)!;
            const tactResult = fullResults.at(-1)!;
            testJetton(
                tactResult,
                tactCodeSize,
                JettonMinter.fromInit.bind(JettonMinter),
                JettonWallet.fromInit.bind(JettonWallet),
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
