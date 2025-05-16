import "@ton/test-utils";
import { Cell, beginCell, toNano, contractAddress } from "@ton/core";
import type { Address } from "@ton/core";
import type { Sender } from "@ton/core";
import { Blockchain, type BlockchainSnapshot } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import {
    generateResults,
    getStateSizeForAccount,
    generateCodeSizeResults,
    getUsedGas,
    printBenchmarkTable,
    type CodeSizeResult,
    type BenchmarkResult,
} from "@/benchmarks/utils/gas";
import { resolve } from "path";
import { readFileSync } from "fs";
import { posixNormalize } from "@/utils/filePath";
import {
    SBTItem,
    storeReportStaticData,
    storeRequestOwnerOut,
    storeProveOwnershipOut,
    storeExcessOut,
} from "@/benchmarks/sbt/tact/output/item_SBTItem";

import type {
    ReportStaticData,
    RequestOwner,
    ProveOwnership,
    ProveOwnershipOut,
    GetStaticData,
    Destroy,
    Revoke,
    TakeExcess,
    RequestOwnerOut,
    ExcessOut,
} from "@/benchmarks/sbt/tact/output/item_SBTItem";

import benchmarkResults from "@/benchmarks/sbt/results_gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/sbt/results_code_size.json";
import { parameter, step } from "@/test/allure/allure";

const loadFunCSBTBoc = () => {
    const bocItem = readFileSync(
        posixNormalize(resolve(__dirname, "./func/output/sbt-item.boc")),
    );

    return { bocItem };
};

function testSBT(
    benchmarkResults: BenchmarkResult,
    codeSizeResults: CodeSizeResult,
    fromInitItem: (
        itemIndex: bigint,
        collectionAddress: Address,
        owner: Address | null,
        content: Cell | null,
        authorityAddress: Address | null,
        revokedAt: bigint,
    ) => Promise<SBTItem>,
) {
    let blockchain: Blockchain;
    let owner: SandboxContract<TreasuryContract>;
    let itemSBT: SandboxContract<SBTItem>;

    let snapshot: BlockchainSnapshot;

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        owner = await blockchain.treasury("owner");

        await parameter("owner", owner.address.toString());

        itemSBT = blockchain.openContract(
            await step("Initialize SBT item contract", async () =>
                fromInitItem(0n, owner.address, null, null, null, 0n),
            ),
        );

        const deployItemResult = await step("Deploy SBT item", () =>
            itemSBT.send(
                owner.getSender(),
                { value: toNano("0.1") },
                beginCell()
                    .storeAddress(owner.address)
                    .storeRef(beginCell().endCell())
                    .storeAddress(owner.address)
                    .storeUint(0n, 64)
                    .asSlice(),
            ),
        );

        await step("Should deploy SBT item", () => {
            expect(deployItemResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemSBT.address,
                deploy: true,
                success: true,
            });
        });

        snapshot = blockchain.snapshot();
    });

    beforeEach(async () => {
        await blockchain.loadFrom(snapshot);
    });

    it("deploy", async () => {
        const runDeployTest = async () => {
            const newItemSBT = blockchain.openContract(
                await step("Initialize new SBT item contract", async () =>
                    fromInitItem(1n, owner.address, null, null, null, 0n),
                ),
            );

            const sendDeploy = async (
                itemSBT: SandboxContract<SBTItem>,
                from: Sender,
                value: bigint,
            ) => {
                return await itemSBT.send(
                    from,
                    { value },
                    beginCell()
                        .storeAddress(owner.address)
                        .storeRef(beginCell().endCell())
                        .storeAddress(owner.address)
                        .storeUint(0n, 64)
                        .asSlice(),
                );
            };

            const sendResult = await step(
                "Send deploy for new SBT item",
                async () =>
                    sendDeploy(newItemSBT, owner.getSender(), toNano(1)),
            );

            await step("Should return expected deploy transaction", () => {
                expect(sendResult.transactions).toHaveTransaction({
                    deploy: true,
                });
            });
            await step("Should not fail transaction", () => {
                expect(sendResult.transactions).not.toHaveTransaction({
                    success: false,
                });
            });
            return await step("Get used gas", () =>
                getUsedGas(sendResult, "internal"),
            );
        };

        const deployGasUsed = await runDeployTest();
        await step("Should match deploy gas benchmark", () => {
            expect(deployGasUsed).toEqual(benchmarkResults.gas["deploy"]);
        });
    });
    it("request owner", async () => {
        const sendRequestOwner = async (
            itemSBT: SandboxContract<SBTItem>,
            from: Sender,
            value: bigint,
        ) => {
            const msg: RequestOwner = {
                $$type: "RequestOwner",
                queryId: 0n,
                destination: owner.address,
                body: beginCell().endCell(),
                withContent: true,
            };

            return await itemSBT.send(from, { value }, msg);
        };

        const runRequestOwnerTest = async (
            scopeItemSBT: SandboxContract<SBTItem>,
        ) => {
            const sendResult = await step("Send request owner", async () =>
                sendRequestOwner(scopeItemSBT, owner.getSender(), toNano(1)),
            );

            const expectedBody: RequestOwnerOut = {
                $$type: "RequestOwnerOut",
                queryId: 0n,
                index: 0n,
                senderAddress: owner.address,
                ownerAddress: owner.address,
                body: beginCell().endCell(),
                revokedAt: 0n,
                content: beginCell().endCell(),
            };

            await step("Should return expected RequestOwnerOut", () => {
                expect(sendResult.transactions).toHaveTransaction({
                    from: scopeItemSBT.address,
                    to: owner.address,
                    body: beginCell()
                        .store(storeRequestOwnerOut(expectedBody))
                        .endCell(),
                    inMessageBounceable: true,
                });
            });

            await step("Should not fail transaction", () => {
                expect(sendResult.transactions).not.toHaveTransaction({
                    success: false,
                });
            });

            return await step("Get used gas", () =>
                getUsedGas(sendResult, "internal"),
            );
        };

        const requestOwnerGasUsedTact = await runRequestOwnerTest(itemSBT);

        await step("Should match request owner gas benchmark", () => {
            expect(requestOwnerGasUsedTact).toEqual(
                benchmarkResults.gas["request owner"],
            );
        });
    });

    it("prove ownership", async () => {
        const sendProveOwnership = async (
            itemSBT: SandboxContract<SBTItem>,
            from: Sender,
            value: bigint,
        ) => {
            const msg: ProveOwnership = {
                $$type: "ProveOwnership",
                queryId: 0n,
                destination: owner.address,
                body: beginCell().endCell(),
                withContent: true,
            };

            return await itemSBT.send(from, { value }, msg);
        };

        const runProveOwnershipTest = async (
            scopeItemSBT: SandboxContract<SBTItem>,
        ) => {
            const sendResult = await step("Send prove ownership", async () =>
                sendProveOwnership(scopeItemSBT, owner.getSender(), toNano(1)),
            );

            const expectedBody: ProveOwnershipOut = {
                $$type: "ProveOwnershipOut",
                queryId: 0n,
                index: 0n,
                ownerAddress: owner.address,
                body: beginCell().endCell(),
                revokedAt: 0n,
                content: beginCell().endCell(),
            };

            await step("Should return expected ProveOwnershipOut", () => {
                expect(sendResult.transactions).toHaveTransaction({
                    from: scopeItemSBT.address,
                    to: owner.address,
                    body: beginCell()
                        .store(storeProveOwnershipOut(expectedBody))
                        .endCell(),
                    inMessageBounceable: true,
                });
            });

            await step("Should not fail transaction", () => {
                expect(sendResult.transactions).not.toHaveTransaction({
                    success: false,
                });
            });
            return await step("Get used gas", () =>
                getUsedGas(sendResult, "internal"),
            );
        };

        const proveOwnershipGasUsedTact = await runProveOwnershipTest(itemSBT);

        await step("Should match prove ownership gas benchmark", () => {
            expect(proveOwnershipGasUsedTact).toEqual(
                benchmarkResults.gas["prove ownership"],
            );
        });
    });

    it("get static data", async () => {
        const sendGetStaticData = async (
            itemSBT: SandboxContract<SBTItem>,
            from: Sender,
            value: bigint,
        ) => {
            const msg: GetStaticData = {
                $$type: "GetStaticData",
                queryId: 0n,
            };

            return await itemSBT.send(from, { value }, msg);
        };

        const runGetStaticTest = async (
            scopeItemSBT: SandboxContract<SBTItem>,
        ) => {
            const sendResult = await step("Send get static data", async () =>
                sendGetStaticData(scopeItemSBT, owner.getSender(), toNano(1)),
            );

            const expectedBody: ReportStaticData = {
                $$type: "ReportStaticData",
                queryId: 0n,
                index: 0n,
                collectionAddress: owner.address,
            };

            await step("Should return expected ReportStaticData", () => {
                expect(sendResult.transactions).toHaveTransaction({
                    from: scopeItemSBT.address,
                    to: owner.address,
                    body: beginCell()
                        .store(storeReportStaticData(expectedBody))
                        .endCell(),
                    inMessageBounceable: false,
                });
            });

            await step("Should not fail transaction", () => {
                expect(sendResult.transactions).not.toHaveTransaction({
                    success: false,
                });
            });

            return await step("Get used gas", () =>
                getUsedGas(sendResult, "internal"),
            );
        };

        const getStaticGasUsedTact = await runGetStaticTest(itemSBT);

        await step("Should match get static data gas benchmark", () => {
            expect(getStaticGasUsedTact).toEqual(
                benchmarkResults.gas["get static data"],
            );
        });
    });

    it("take excess", async () => {
        const sendTakeExcess = async (
            itemSBT: SandboxContract<SBTItem>,
            from: Sender,
            value: bigint,
        ) => {
            const msg: TakeExcess = {
                $$type: "TakeExcess",
                queryId: 0n,
            };

            return await itemSBT.send(from, { value }, msg);
        };

        const runTakeExcessTest = async (
            scopeItemSBT: SandboxContract<SBTItem>,
        ) => {
            const sendResult = await step("Send take excess", async () =>
                sendTakeExcess(scopeItemSBT, owner.getSender(), toNano(1)),
            );

            const expectedBody: ExcessOut = {
                $$type: "ExcessOut",
                queryId: 0n,
            };

            await step("Should return expected ExcessOut", () => {
                expect(sendResult.transactions).toHaveTransaction({
                    from: scopeItemSBT.address,
                    to: owner.address,
                    body: beginCell()
                        .store(storeExcessOut(expectedBody))
                        .endCell(),
                    inMessageBounceable: false,
                });
            });

            await step("Should not fail transaction", () => {
                expect(sendResult.transactions).not.toHaveTransaction({
                    success: false,
                });
            });
            return await step("Get used gas", () =>
                getUsedGas(sendResult, "internal"),
            );
        };

        const takeExcessGasUsedTact = await runTakeExcessTest(itemSBT);

        await step("Should match take excess gas benchmark", () => {
            expect(takeExcessGasUsedTact).toEqual(
                benchmarkResults.gas["take excess"],
            );
        });
    });

    it("destroy", async () => {
        const sendDestroy = async (
            itemSBT: SandboxContract<SBTItem>,
            from: Sender,
            value: bigint,
        ) => {
            const msg: Destroy = {
                $$type: "Destroy",
                queryId: 0n,
            };

            return await itemSBT.send(from, { value }, msg);
        };

        const runDestroyTest = async (
            scopeItemSBT: SandboxContract<SBTItem>,
        ) => {
            const sendResult = await step("Send destroy", async () =>
                sendDestroy(scopeItemSBT, owner.getSender(), toNano(1)),
            );

            const expectedBody: ExcessOut = {
                $$type: "ExcessOut",
                queryId: 0n,
            };

            await step("Should return expected ExcessOut", () => {
                expect(sendResult.transactions).toHaveTransaction({
                    from: scopeItemSBT.address,
                    to: owner.address,
                    body: beginCell()
                        .store(storeExcessOut(expectedBody))
                        .endCell(),
                    inMessageBounceable: false,
                });
            });

            await step("Should not fail transaction", () => {
                expect(sendResult.transactions).not.toHaveTransaction({
                    success: false,
                });
            });
            return await step("Get used gas", () =>
                getUsedGas(sendResult, "internal"),
            );
        };

        const destroyGasUsedTact = await runDestroyTest(itemSBT);

        await step("Should match destroy gas benchmark", () => {
            expect(destroyGasUsedTact).toEqual(benchmarkResults.gas["destroy"]);
        });
    });

    it("revoke", async () => {
        const sendRevoke = async (
            itemSBT: SandboxContract<SBTItem>,
            from: Sender,
            value: bigint,
        ) => {
            const msg: Revoke = {
                $$type: "Revoke",
                queryId: 0n,
            };

            return await itemSBT.send(from, { value }, msg);
        };

        const runRevokeTest = async (
            scopeItemSBT: SandboxContract<SBTItem>,
        ) => {
            const sendResult = await step("Send revoke", async () =>
                sendRevoke(scopeItemSBT, owner.getSender(), toNano(1)),
            );

            await step("Should not send transaction from SBT item", () => {
                expect(sendResult.transactions).not.toHaveTransaction({
                    from: scopeItemSBT.address,
                });
            });

            await step("Should not fail transaction", () => {
                expect(sendResult.transactions).not.toHaveTransaction({
                    success: false,
                });
            });

            return await step("Get used gas", () =>
                getUsedGas(sendResult, "internal"),
            );
        };

        const revokeGasUsedTact = await runRevokeTest(itemSBT);

        await step("Should match revoke gas benchmark", () => {
            expect(revokeGasUsedTact).toEqual(benchmarkResults.gas["revoke"]);
        });
    });

    it("item cells", async () => {
        await step("Item cells should match benchmark", async () => {
            expect(
                (await getStateSizeForAccount(blockchain, itemSBT.address))
                    .cells,
            ).toEqual(codeSizeResults.size["item cells"]);
        });
    });

    it("item bits", async () => {
        await step("Item bits should match benchmark", async () => {
            expect(
                (await getStateSizeForAccount(blockchain, itemSBT.address))
                    .bits,
            ).toEqual(codeSizeResults.size["item bits"]);
        });
    });
}

describe("SBT Gas Tests", () => {
    const fullResults = generateResults(benchmarkResults);
    const fullCodeSizeResults = generateCodeSizeResults(
        benchmarkCodeSizeResults,
    );

    describe("func", () => {
        const funcCodeSize = fullCodeSizeResults.at(0)!;
        const funcResult = fullResults.at(0)!;

        function fromInitItem(
            itemIndex: bigint,
            collectionAddress: Address,
            _owner: Address | null,
            _content: Cell | null,
            _authorityAddress: Address | null,
            _revokedAt: bigint,
        ) {
            const sbtData = loadFunCSBTBoc();
            const __code = Cell.fromBoc(sbtData.bocItem)[0]!;

            const __data = beginCell()
                .storeUint(itemIndex, 64)
                .storeAddress(collectionAddress)
                .endCell();

            const __gen_init = { code: __code, data: __data };
            const address = contractAddress(0, __gen_init);
            return Promise.resolve(new SBTItem(address, __gen_init));
        }

        testSBT(funcResult, funcCodeSize, fromInitItem);
    });

    describe("tact", () => {
        const tactCodeSize = fullCodeSizeResults.at(-1)!;
        const tactResult = fullResults.at(-1)!;
        testSBT(tactResult, tactCodeSize, SBTItem.fromInit.bind(SBTItem));
    });

    afterAll(() => {
        printBenchmarkTable(fullResults, fullCodeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });
    });
});
