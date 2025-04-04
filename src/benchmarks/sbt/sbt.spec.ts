import "@ton/test-utils";
import { Cell, beginCell, toNano, contractAddress, SendMode } from "@ton/core";

import type { Sender } from "@ton/core";
import { Blockchain, BlockchainSnapshot } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import {
    generateResults,
    getStateSizeForAccount,
    generateCodeSizeResults,
    getUsedGas,
    printBenchmarkTable,
} from "@/benchmarks/utils/gas";
import { join, resolve } from "path";
import { readFileSync } from "fs";
import { posixNormalize } from "@/utils/filePath";
import { type Step, writeLog } from "@/test/utils/write-vm-log";
import {
    SBTItem,
    type RequestOwner,
    type ProveOwnership,
    type GetStaticData,
    type Destroy,
    type Revoke,
    type TakeExcess,
} from "@/benchmarks/contracts/sbt/output/sbt-item_SBTItem";

import benchmarkResults from "@/benchmarks/sbt/results_gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/sbt/results_code_size.json";

const loadFunCSBTBoc = () => {
    const bocItem = readFileSync(
        posixNormalize(
            resolve(__dirname, "../contracts/func/output/sbt-item.boc"),
        ),
    );

    return { bocItem };
};

const deployFuncSBTItem = async (
    blockchain: Blockchain,
    via: SandboxContract<TreasuryContract>,
) => {
    const sbtData = loadFunCSBTBoc();
    const itemCode = Cell.fromBoc(sbtData.bocItem)[0]!;

    const initData = beginCell()
        .storeUint(0, 64) // itemIndex
        .storeAddress(via.address) // collectionAddress
        .endCell();

    const init = { code: itemCode, data: initData };

    const itemAddress = contractAddress(0, init);
    const itemSBTScope: SandboxContract<SBTItem> = blockchain.openContract(
        await SBTItem.fromAddress(itemAddress),
    );

    return {
        itemSBTScope,
        result: await via.send({
            to: itemAddress,
            value: toNano("1"),
            init,
            body: beginCell()
                .storeAddress(via.address) // owner
                .storeRef(beginCell().endCell()) // content
                .storeAddress(via.address) // authority
                .endCell(),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        }),
    };
};

describe("itemSBT", () => {
    let blockchain: Blockchain;

    let owner: SandboxContract<TreasuryContract>;
    
    let snapshot: BlockchainSnapshot

    let itemSBT: SandboxContract<SBTItem>;
    let funcItemSBT: SandboxContract<SBTItem>;

    let defaultContent: Cell;

    let step: Step;
    const results = generateResults(benchmarkResults);
    const codeSizeResults = generateCodeSizeResults(benchmarkCodeSizeResults);
    const expectedCodeSize = codeSizeResults.at(-1)!;
    const funcCodeSize = codeSizeResults.at(0)!;

    const expectedResult = results.at(-1)!;
    const funcResult = results.at(0)!;

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        owner = await blockchain.treasury("owner");

        defaultContent = beginCell().endCell(); // just some content ( doesn't matter )

        step = writeLog({
            path: join(__dirname, "output", "log.yaml"),
            blockchain,
        });

        // ITEM
        {
            itemSBT = blockchain.openContract(
                await SBTItem.fromInit({
                    $$type: "InitNFTData",
                    itemIndex: 0n,
                    collectionAddress: owner.address,
                }),
            );

            const deployResult = await itemSBT.send(
                owner.getSender(),
                { value: toNano("0.1") },
                beginCell()
                    .storeAddress(owner.address) // owner
                    .storeRef(defaultContent) // content
                    .storeAddress(owner.address) // authority
                    .storeUint(0, 64) // revokedAt
                    .asSlice(),
            );

            expect(deployResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemSBT.address,
                deploy: true,
                success: true,
            });

            expect((await itemSBT.getGetNftData()).owner).toEqualAddress(
                owner.address,
            );
            // deploy func
            const { result: deployFuncItem, itemSBTScope } =
                await deployFuncSBTItem(blockchain, owner);
            funcItemSBT = itemSBTScope;
            expect(deployFuncItem.transactions).toHaveTransaction({
                from: owner.address,
                to: funcItemSBT.address,
                success: true,
                deploy: true,
            });

            expect(await funcItemSBT.getGetAuthorityAddress()).toEqualAddress(
                owner.address,
            );
        }
        snapshot = blockchain.snapshot()
    })

    beforeEach(async () => {
        await blockchain.loadFrom(snapshot)
    })

    afterAll(() => {
        printBenchmarkTable(results, codeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
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
            const sendResult = await step("request owner", async () =>
                sendRequestOwner(scopeItemSBT, owner.getSender(), toNano(1)),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const requestOwnerGasUsedTact = await runRequestOwnerTest(itemSBT);
        const requestOwnerGasUsedFunC = await runRequestOwnerTest(funcItemSBT);

        expect(requestOwnerGasUsedTact).toEqual(
            expectedResult.gas["request owner"],
        );
        expect(requestOwnerGasUsedFunC).toEqual(
            funcResult.gas["request owner"],
        );
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
            const sendResult = await step("prove ownership", async () =>
                sendProveOwnership(scopeItemSBT, owner.getSender(), toNano(1)),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const proveOwnershipGasUsedTact = await runProveOwnershipTest(itemSBT);
        const proveOwnershipGasUsedFunC =
            await runProveOwnershipTest(funcItemSBT);

        expect(proveOwnershipGasUsedTact).toEqual(
            expectedResult.gas["prove ownership"],
        );
        expect(proveOwnershipGasUsedFunC).toEqual(
            funcResult.gas["prove ownership"],
        );
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
            const sendResult = await step("get static data", async () =>
                sendGetStaticData(scopeItemSBT, owner.getSender(), toNano(1)),
            );

            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });

            return getUsedGas(sendResult, "internal");
        };

        const getStaticGasUsedTact = await runGetStaticTest(itemSBT);
        const getStaticGasUsedFunC = await runGetStaticTest(funcItemSBT);

        expect(getStaticGasUsedTact).toEqual(
            expectedResult.gas["get static data"],
        );
        expect(getStaticGasUsedFunC).toEqual(funcResult.gas["get static data"]);
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
            const sendResult = await step("revoke", async () =>
                sendRevoke(scopeItemSBT, owner.getSender(), toNano(1)),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const revokeGasUsedTact = await runRevokeTest(itemSBT);
        const revokeGasUsedFunC = await runRevokeTest(funcItemSBT);

        expect(revokeGasUsedTact).toEqual(expectedResult.gas["revoke"]);
        expect(revokeGasUsedFunC).toEqual(funcResult.gas["revoke"]);
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
            const sendResult = await step("take excess", async () =>
                sendTakeExcess(scopeItemSBT, owner.getSender(), toNano(1)),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const takeExcessGasUsedTact = await runTakeExcessTest(itemSBT);
        const takeExcessGasUsedFunC = await runTakeExcessTest(funcItemSBT);

        expect(takeExcessGasUsedTact).toEqual(
            expectedResult.gas["take excess"],
        );
        expect(takeExcessGasUsedFunC).toEqual(funcResult.gas["take excess"]);
    });

    it("item cells", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, itemSBT.address)).cells,
        ).toEqual(expectedCodeSize.size["item cells"]);
        expect(
            (await getStateSizeForAccount(blockchain, funcItemSBT.address))
                .cells,
        ).toEqual(funcCodeSize.size["item cells"]);
    });

    it("item bits", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, itemSBT.address)).bits,
        ).toEqual(expectedCodeSize.size["item bits"]);
        expect(
            (await getStateSizeForAccount(blockchain, funcItemSBT.address))
                .bits,
        ).toEqual(funcCodeSize.size["item bits"]);
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
            const sendResult = await step("destroy", async () =>
                sendDestroy(scopeItemSBT, owner.getSender(), toNano(1)),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const destroyGasUsedTact = await runDestroyTest(itemSBT);
        const destroyGasUsedFunC = await runDestroyTest(funcItemSBT);

        expect(destroyGasUsedTact).toEqual(expectedResult.gas["destroy"]);
        expect(destroyGasUsedFunC).toEqual(funcResult.gas["destroy"]);
    });
});
