import "@ton/test-utils";
import { Cell, beginCell, toNano, contractAddress, SendMode } from "@ton/core";

import type { Sender } from "@ton/core";
import { Blockchain, type BlockchainSnapshot } from "@ton/sandbox";
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
    storeReportStaticData,
    storeRequestOwnerOut,
    storeProveOwnershipOut,
    storeExcessOut,
} from "@/benchmarks/contracts/sbt/output/sbt-item_SBTItem";

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
} from "@/benchmarks/contracts/sbt/output/sbt-item_SBTItem";

import benchmarkResults from "@/benchmarks/sbt/results_gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/sbt/results_code_size.json";
import { calculateCoverage } from "@/asm/coverage/integrations";

const loadFunCSBTBoc = () => {
    const bocItem = readFileSync(
        posixNormalize(
            resolve(__dirname, "../contracts/func/output/sbt-item.boc"),
        ),
    );

    return { bocItem };
};

describe("itemSBT", () => {
    let blockchain: Blockchain;

    let owner: SandboxContract<TreasuryContract>;

    let snapshot: BlockchainSnapshot;

    let itemSBT: SandboxContract<SBTItem>;
    let funcItemSBT: SandboxContract<SBTItem>;

    let step: Step;
    const results = generateResults(benchmarkResults);
    const codeSizeResults = generateCodeSizeResults(benchmarkCodeSizeResults);
    const expectedCodeSize = codeSizeResults.at(-1)!;
    const funcCodeSize = codeSizeResults.at(0)!;

    const expectedResult = results.at(-1)!;
    const funcResult = results.at(0)!;

    let funcInit: { code: Cell; data: Cell };

    const sendDeploy = async (
        via: SandboxContract<TreasuryContract>,
        itemSBT: SandboxContract<SBTItem>,
        init: { code: Cell; data: Cell } | null,
    ) => {
        return await via.send({
            to: itemSBT.address,
            value: toNano("1"),
            init,
            body: beginCell()
                .storeAddress(via.address) // owner
                .storeRef(beginCell().endCell()) // content
                .storeAddress(via.address) // authority
                .storeUint(0, 64) // revoke
                .endCell(),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        });
    };

    const deployFuncSBTItem = async (
        blockchain: Blockchain,
        via: SandboxContract<TreasuryContract>,
        index: bigint = 0n,
    ) => {
        const sbtData = loadFunCSBTBoc();
        const itemCode = Cell.fromBoc(sbtData.bocItem)[0]!;

        const initData = beginCell()
            .storeUint(index, 64) // itemIndex
            .storeAddress(via.address) // collectionAddress
            .endCell();

        const init = { code: itemCode, data: initData };

        const itemAddress = contractAddress(0, init);
        const itemSBTScope: SandboxContract<SBTItem> = blockchain.openContract(
            await SBTItem.fromAddress(itemAddress),
        );

        return { itemSBTScope, init };
    };

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        owner = await blockchain.treasury("owner");

        step = writeLog({
            path: join(__dirname, "output", "log.yaml"),
            blockchain,
        });

        // ITEM
        {
            itemSBT = blockchain.openContract(
                await SBTItem.fromInit(0n, owner.address, null, null, null, 0n),
            );

            const deployResult = await sendDeploy(
                owner,
                itemSBT,
                itemSBT.init!,
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
            const funcResult = await deployFuncSBTItem(blockchain, owner);
            funcItemSBT = funcResult.itemSBTScope;
            funcInit = funcResult.init;

            const deployFuncItem = await sendDeploy(
                owner,
                funcItemSBT,
                funcInit,
            );
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
        snapshot = blockchain.snapshot();
    });

    beforeEach(async () => {
        await blockchain.loadFrom(snapshot);
    });

    afterAll(async () => {
        printBenchmarkTable(results, codeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });

        await calculateCoverage(__dirname, itemSBT);
    });

    it("deploy", async () => {
        const runDeployTactTest = async () => {
            const newItemSBT = blockchain.openContract(
                await SBTItem.fromInit(1n, owner.address, null, null, null, 0n),
            );
            const sendResult = await step("request owner", async () =>
                sendDeploy(owner, newItemSBT, newItemSBT.init!),
            );

            expect(sendResult.transactions).toHaveTransaction({
                deploy: true,
            });
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const runDeployFuncTest = async () => {
            const funcResult = await deployFuncSBTItem(blockchain, owner, 1n);
            const newFuncItemSBT = funcResult.itemSBTScope;
            const newFuncInit = funcResult.init;

            const sendResult = await step("deploy", async () =>
                sendDeploy(owner, newFuncItemSBT, newFuncInit),
            );

            expect(sendResult.transactions).toHaveTransaction({
                deploy: true,
            });

            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const deployGasUsedTact = await runDeployTactTest();
        const deployGasUsedFunC = await runDeployFuncTest();

        expect(deployGasUsedTact).toEqual(expectedResult.gas["deploy"]);
        expect(deployGasUsedFunC).toEqual(funcResult.gas["deploy"]);
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

            expect(sendResult.transactions).toHaveTransaction({
                from: scopeItemSBT.address,
                to: owner.address,
                body: beginCell()
                    .store(storeRequestOwnerOut(expectedBody))
                    .endCell(),
                inMessageBounceable: true,
            });

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

            const expectedBody: ProveOwnershipOut = {
                $$type: "ProveOwnershipOut",
                queryId: 0n,
                index: 0n,
                ownerAddress: owner.address,
                body: beginCell().endCell(),
                revokedAt: 0n,
                content: beginCell().endCell(),
            };

            expect(sendResult.transactions).toHaveTransaction({
                from: scopeItemSBT.address,
                to: owner.address,
                body: beginCell()
                    .store(storeProveOwnershipOut(expectedBody))
                    .endCell(),
                inMessageBounceable: true,
            });

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

            const expectedBody: ReportStaticData = {
                $$type: "ReportStaticData",
                queryId: 0n,
                index: 0n,
                collectionAddress: owner.address,
            };

            expect(sendResult.transactions).toHaveTransaction({
                from: scopeItemSBT.address,
                to: owner.address,
                body: beginCell()
                    .store(storeReportStaticData(expectedBody))
                    .endCell(),
                inMessageBounceable: false,
            });

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

            const expectedBody: ExcessOut = {
                $$type: "ExcessOut",
                queryId: 0n,
            };

            expect(sendResult.transactions).toHaveTransaction({
                from: scopeItemSBT.address,
                to: owner.address,
                body: beginCell().store(storeExcessOut(expectedBody)).endCell(),
                inMessageBounceable: false,
            });

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

            const expectedBody: ExcessOut = {
                $$type: "ExcessOut",
                queryId: 0n,
            };

            expect(sendResult.transactions).toHaveTransaction({
                from: scopeItemSBT.address,
                to: owner.address,
                body: beginCell().store(storeExcessOut(expectedBody)).endCell(),
                inMessageBounceable: false,
            });

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
                from: scopeItemSBT.address,
            });

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
});
