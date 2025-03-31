import "@ton/test-utils";
import type { Address } from "@ton/core";
import {
    Cell,
    beginCell,
    toNano,
    contractAddress,
    SendMode,
    Dictionary,
} from "@ton/core";

import type { Slice, Sender, Builder } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
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
    NFTCollection,
    loadInitNFTBody,
} from "@/benchmarks/contracts/output/nft-collection_NFTCollection";
import type {
    DeployNFT,
    GetRoyaltyParams,
    GetStaticData,
    BatchDeploy,
    RoyaltyParams,
    InitNFTBody,
    InitNFTData,
} from "@/benchmarks/contracts/output/nft-collection_NFTCollection";
import {
    NFTItem,
    type Transfer,
    storeInitNFTBody,
} from "@/benchmarks/contracts/output/nft-collection_NFTItem";

import benchmarkResults from "@/benchmarks/nft/results_gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/nft/results_code_size.json";

type dictDeployNFT = {
    amount: bigint;
    initNFTBody: InitNFTBody;
};
// for correct work with dictionary
const dictDeployNFTItem = {
    serialize: (src: dictDeployNFT, builder: Builder) => {
        builder
            .storeCoins(src.amount)
            .storeRef(
                beginCell().store(storeInitNFTBody(src.initNFTBody)).endCell(),
            );
    },
    parse: (src: Slice) => {
        return {
            amount: src.loadCoins(),
            initNFTBody: loadInitNFTBody(src.loadRef().asSlice()),
        };
    },
};

const loadFunCNFTBoc = () => {
    const bocCollection = readFileSync(
        posixNormalize(
            resolve(__dirname, "../contracts/func/output/nft-collection.boc"),
        ),
    );

    const bocItem = readFileSync(
        posixNormalize(
            resolve(__dirname, "../contracts/func/output/nft-item.boc"),
        ),
    );

    return { bocCollection, bocItem };
};

const deployFuncNFTCollection = async (
    blockchain: Blockchain,
    via: SandboxContract<TreasuryContract>,
) => {
    const nftData = loadFunCNFTBoc();
    const collectionCode = Cell.fromBoc(nftData.bocCollection)[0]!;
    const itemCode = Cell.fromBoc(nftData.bocItem)[0]!;

    const royaltyDataCell = beginCell()
        .storeUint(1, 16) // nominator
        .storeUint(100, 16) // dominator
        .storeAddress(via.address) // owner
        .endCell();

    const initData = beginCell()
        .storeAddress(via.address) // owner
        .storeUint(0, 64) // nextItemIndex
        .storeRef(beginCell().endCell()) // content
        .storeRef(itemCode) // nftItemCode
        .storeRef(royaltyDataCell)
        .endCell();

    const init = { code: collectionCode, data: initData };

    const collectionAddress = contractAddress(0, init);
    const collectionNFTScope: SandboxContract<NFTCollection> =
        blockchain.openContract(
            await NFTCollection.fromAddress(collectionAddress),
        );

    return {
        collectionNFTScope,
        result: await via.send({
            to: collectionAddress,
            value: toNano("0.1"),
            init,
            body: beginCell().endCell(),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        }),
    };
};

const deployFuncNFTItem = async (
    blockchain: Blockchain,
    via: SandboxContract<TreasuryContract>,
) => {
    const nftData = loadFunCNFTBoc();
    const itemCode = Cell.fromBoc(nftData.bocItem)[0]!;

    const initData = beginCell()
        .storeUint(0, 64) // itemIndex
        .storeAddress(via.address) // collectionAddress
        .endCell();

    const init = { code: itemCode, data: initData };

    const itemAddress = contractAddress(0, init);
    const itemNFTScope: SandboxContract<NFTItem> = blockchain.openContract(
        await NFTItem.fromAddress(itemAddress),
    );

    return {
        itemNFTScope,
        result: await via.send({
            to: itemAddress,
            value: toNano("0.1"),
            init,
            body: beginCell()
                .storeAddress(via.address) // owner
                .storeRef(beginCell().endCell()) // content
                .endCell(),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        }),
    };
};

describe("itemNFT", () => {
    let blockchain: Blockchain;

    let owner: SandboxContract<TreasuryContract>;
    let notOwner: SandboxContract<TreasuryContract>;

    let itemNFT: SandboxContract<NFTItem>;
    let funcItemNFT: SandboxContract<NFTItem>;

    let collectionNFT: SandboxContract<NFTCollection>;
    let funcCollectionNFT: SandboxContract<NFTCollection>;

    let defaultContent: Cell;
    let defaultCommonContent: Cell;
    let defaultCollectionContent: Cell;
    let defaultNFTContent: Cell;
    let royaltyParams: RoyaltyParams;

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
        notOwner = await blockchain.treasury("notOwner");

        defaultContent = beginCell().endCell(); // just some content ( doesn't matter )

        step = writeLog({
            path: join(__dirname, "output", "log.yaml"),
            blockchain,
        });

        // ITEM
        {
            const initNFTData: InitNFTData = {
                $$type: "InitNFTData",
                itemIndex: 0n,
                collectionAddress: owner.address,
            };

            itemNFT = blockchain.openContract(
                await NFTItem.fromInit(initNFTData),
            );

            const deployItemMsg: InitNFTBody = {
                $$type: "InitNFTBody",
                owner: owner.address,
                content: defaultContent,
            };

            const deployResult = await itemNFT.send(
                owner.getSender(),
                { value: toNano("0.1") },
                beginCell().store(storeInitNFTBody(deployItemMsg)).asSlice(),
            );

            expect(deployResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                deploy: true,
                success: true,
            });

            // deploy func
            const { result: deployFuncItem, itemNFTScope } =
                await deployFuncNFTItem(blockchain, owner);
            funcItemNFT = itemNFTScope;
            expect(deployFuncItem.transactions).toHaveTransaction({
                from: owner.address,
                to: funcItemNFT.address,
                success: true,
                deploy: true,
            });
        }
        // COLLECTION
        {
            defaultCommonContent = beginCell()
                .storeStringTail("common")
                .endCell();
            defaultCollectionContent = beginCell()
                .storeStringTail("collectionContent")
                .endCell();

            defaultNFTContent = beginCell().storeStringTail("1.json").endCell();

            defaultContent = beginCell()
                .storeRef(defaultCollectionContent)
                .storeRef(defaultCommonContent)
                .endCell();

            royaltyParams = {
                $$type: "RoyaltyParams",
                nominator: 1n,
                dominator: 100n,
                owner: owner.address,
            };

            collectionNFT = blockchain.openContract(
                await NFTCollection.fromInit(
                    owner.address,
                    0n,
                    defaultContent,
                    royaltyParams,
                ),
            );
            const deployCollectionMsg: GetRoyaltyParams = {
                $$type: "GetRoyaltyParams",
                queryId: 0n,
            };

            const deployResult = await collectionNFT.send(
                owner.getSender(),
                { value: toNano("0.1") },
                deployCollectionMsg,
            );
            expect(deployResult.transactions).toHaveTransaction({
                from: owner.address,
                to: collectionNFT.address,
                deploy: true,
                success: true,
            });
            // deploy func
            const { result: deployFuncCollection, collectionNFTScope } =
                await deployFuncNFTCollection(blockchain, owner);
            funcCollectionNFT = collectionNFTScope;
            expect(deployFuncCollection.transactions).toHaveTransaction({
                from: owner.address,
                to: funcCollectionNFT.address,
                success: true,
                deploy: true,
            });
        }
    });

    afterAll(() => {
        printBenchmarkTable(results, codeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });
    });

    it("transfer", async () => {
        const sendTransfer = async (
            itemNFT: SandboxContract<NFTItem>,
            from: Sender,
            value: bigint,
            newOwner: Address,
            responseDestination: Address | null,
            forwardAmount: bigint,
            forwardPayload: Slice = beginCell().storeUint(0, 1).asSlice(),
        ) => {
            const msg: Transfer = {
                $$type: "Transfer",
                queryId: 0n,
                newOwner: newOwner,
                responseDestination: responseDestination,
                customPayload: null, // we don't use it in contract
                forwardAmount: forwardAmount,
                forwardPayload: forwardPayload,
            };

            return await itemNFT.send(from, { value }, msg);
        };
        const runTransferTest = async (
            scopeItemNFT: SandboxContract<NFTItem>,
        ) => {
            const sendResult = await step("transfer", async () =>
                sendTransfer(
                    scopeItemNFT,
                    owner.getSender(),
                    toNano(1),
                    notOwner.address,
                    owner.address,
                    0n,
                ),
            );
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
            return getUsedGas(sendResult, "internal");
        };

        const transferGasUsedTact = await runTransferTest(itemNFT);
        const transferGasUsedFunC = await runTransferTest(funcItemNFT);

        expect(transferGasUsedTact).toEqual(expectedResult.gas["transfer"]);

        expect(transferGasUsedFunC).toEqual(funcResult.gas["transfer"]);
    });

    it("get static data", async () => {
        const sendGetStaticData = async (
            itemNFT: SandboxContract<NFTItem>,
            from: Sender,
            value: bigint,
        ) => {
            const msg: GetStaticData = {
                $$type: "GetStaticData",
                queryId: 0n,
            };

            return await itemNFT.send(from, { value }, msg);
        };

        const runGetStaticTest = async (
            scopeItemNFT: SandboxContract<NFTItem>,
        ) => {
            const sendResult = await step("get static data", async () =>
                sendGetStaticData(scopeItemNFT, owner.getSender(), toNano(1)),
            );

            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });

            return getUsedGas(sendResult, "internal");
        };

        const getStaticGasUsedTact = await runGetStaticTest(itemNFT);
        const getStaticGasUsedFunC = await runGetStaticTest(funcItemNFT);

        expect(getStaticGasUsedTact).toEqual(
            expectedResult.gas["get static data"],
        );
        expect(getStaticGasUsedFunC).toEqual(funcResult.gas["get static data"]);
    });

    it("deploy nft", async () => {
        const sendDeployNFT = async (
            collectionNFT: SandboxContract<NFTCollection>,
            from: Sender,
            value: bigint,
        ) => {
            const initNFTBody: InitNFTBody = {
                $$type: "InitNFTBody",
                owner: owner.address,
                content: defaultNFTContent,
            };

            const msg: DeployNFT = {
                $$type: "DeployNFT",
                queryId: 1n,
                itemIndex: 0n,
                amount: 10000000n,
                initNFTBody: beginCell()
                    .store(storeInitNFTBody(initNFTBody))
                    .endCell(),
            };

            return await collectionNFT.send(from, { value }, msg);
        };

        const runDeployTest = async (
            scopeCollectionNFT: SandboxContract<NFTCollection>,
        ) => {
            const sendResult = await step("deploy nft", async () =>
                sendDeployNFT(scopeCollectionNFT, owner.getSender(), toNano(1)),
            );

            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });

            // at least 1 deploy
            expect(sendResult.transactions).not.toHaveTransaction({
                from: scopeCollectionNFT.address,
                deploy: false,
            });

            expect(sendResult.transactions).toHaveTransaction({
                from: scopeCollectionNFT.address,
                deploy: true,
            });

            return getUsedGas(sendResult, "internal");
        };

        const deployNFTGasUsedTact = await runDeployTest(collectionNFT);
        const deployNFTGasUsedFunC = await runDeployTest(funcCollectionNFT);

        expect(deployNFTGasUsedTact).toEqual(expectedResult.gas["deploy nft"]);
        expect(deployNFTGasUsedFunC).toEqual(funcResult.gas["deploy nft"]);
    });

    it("batch deploy nft", async () => {
        const batchMintNFTProcess = async (
            collectionNFT: SandboxContract<NFTCollection>,
            sender: SandboxContract<TreasuryContract>,
            owner: SandboxContract<TreasuryContract>,
            count: bigint,
        ) => {
            const dct = Dictionary.empty(
                Dictionary.Keys.BigUint(64),
                dictDeployNFTItem,
            );
            // we deployed 1 ngt before
            let i: bigint = 1n;
            count += i;

            const initNFTBody: InitNFTBody = {
                $$type: "InitNFTBody",
                owner: owner.address,
                content: defaultNFTContent,
            };

            while (i < count) {
                dct.set(i, {
                    amount: 10000000n,
                    initNFTBody: initNFTBody,
                });
                i += 1n;
            }

            const batchMintNFT: BatchDeploy = {
                $$type: "BatchDeploy",
                queryId: 0n,
                deployList: beginCell().storeDictDirect(dct).endCell(),
            };

            return await collectionNFT.send(
                sender.getSender(),
                { value: toNano("100") * (count + 10n) },
                batchMintNFT,
            );
        };

        const runBatchDeployTest = async (
            scopeCollectionNFT: SandboxContract<NFTCollection>,
        ) => {
            const sendResult = await step("batch deploy nft", async () =>
                batchMintNFTProcess(
                    scopeCollectionNFT,
                    owner,
                    owner,
                    100n, // just big test
                ),
            );

            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });

            // at least 1 deploy
            expect(sendResult.transactions).not.toHaveTransaction({
                from: scopeCollectionNFT.address,
                deploy: false,
            });

            expect(sendResult.transactions).toHaveTransaction({
                from: scopeCollectionNFT.address,
                deploy: true,
            });

            return getUsedGas(sendResult, "internal");
        };

        const batchDeployNFTGasUsedTact =
            await runBatchDeployTest(collectionNFT);
        const batchDeployNFTGasUsedFunC =
            await runBatchDeployTest(funcCollectionNFT);

        expect(batchDeployNFTGasUsedTact).toEqual(
            expectedResult.gas["batch deploy nft"],
        );
        expect(batchDeployNFTGasUsedFunC).toEqual(
            funcResult.gas["batch deploy nft"],
        );
    });

    it("collection cells", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, collectionNFT.address))
                .cells,
        ).toEqual(expectedCodeSize.size["collection cells"]);
        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    funcCollectionNFT.address,
                )
            ).cells,
        ).toEqual(funcCodeSize.size["collection cells"]);
    });

    it("collection bits", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, collectionNFT.address))
                .bits,
        ).toEqual(expectedCodeSize.size["collection bits"]);
        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    funcCollectionNFT.address,
                )
            ).bits,
        ).toEqual(funcCodeSize.size["collection bits"]);
    });

    it("item cells", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, itemNFT.address)).cells,
        ).toEqual(expectedCodeSize.size["item cells"]);
        expect(
            (await getStateSizeForAccount(blockchain, funcItemNFT.address))
                .cells,
        ).toEqual(funcCodeSize.size["item cells"]);
    });

    it("item bits", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, itemNFT.address)).bits,
        ).toEqual(expectedCodeSize.size["item bits"]);
        expect(
            (await getStateSizeForAccount(blockchain, funcItemNFT.address))
                .bits,
        ).toEqual(funcCodeSize.size["item bits"]);
    });
});
