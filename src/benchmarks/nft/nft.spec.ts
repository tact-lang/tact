import "@ton/test-utils";
import type {
    Address,
} from "@ton/core";
import {
    Cell,
    beginCell,
    toNano,
    contractAddress,
    SendMode,
    Dictionary,
} from "@ton/core";

import type {
    Slice, Sender,
    Builder
} from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import "@ton/test-utils";
import {
    generateResults,
    getStateSizeForAccount,
    generateCodeSizeResults,
    getUsedGas,
    printBenchmarkTable,
    type RawBenchmarkResult,
    RawCodeSizeResult
} from "../utils/gas";
import { join, resolve } from "path";
import { readFileSync, writeFileSync } from "fs";
import { posixNormalize } from "../../utils/filePath";
import { type Step, writeLog } from "../../test/utils/write-vm-log";
import {
    NFTCollection,
    type DeployNFT,
    type GetRoyaltyParams,
    type GetStaticData,
    type BatchDeploy,
    type RoyaltyParams,
    type InitNFTBody,
    loadInitNFTBody,
} from "../contracts/output/nft-collection_NFTCollection";
import {
    NFTItem,
    type Transfer,
    storeInitNFTBody,  
} from "../contracts/output/nft-collection_NFTItem";

export type dictDeployNFT = {
    amount: bigint;
    initNFTBody: InitNFTBody;
};
// for correct work with dictionary 
export const dictDeployNFTItem = {
    serialize: (src: dictDeployNFT, builder: Builder) => {
        builder.storeCoins(src.amount).storeRef(beginCell().store(storeInitNFTBody(src.initNFTBody)).endCell());
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
            resolve(
                __dirname,
                "../contracts/func/output/nft-collection.boc",
            ),
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
    const itemCode  = Cell.fromBoc(nftData.bocItem)[0]!;

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
    const collectionNFTScope: SandboxContract<NFTCollection> = blockchain.openContract(await NFTCollection.fromAddress(collectionAddress));

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
    const itemCode  = Cell.fromBoc(nftData.bocItem)[0]!;

    const initData = beginCell() 
        .storeUint(0, 64) // itemIndex
        .storeAddress(via.address) // collectionAddress
        .endCell();

    const init = { code: itemCode, data: initData };

    const itemAddress = contractAddress(0, init);
    const itemNFTScope: SandboxContract<NFTItem> = blockchain.openContract(await NFTItem.fromAddress(itemAddress));

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

type GasResults = {
    "transfer"?: string;
    "get static data"?: string;
    "deploy nft"?: string;
    "batch deploy nft"?: string;
};

const results: RawBenchmarkResult = {
    results: [
        {
            label: "FunC",
            gas: {} as GasResults,
            pr: "1111"
        },
        {
            label: "Tact",
            gas: {} as GasResults,
            pr: "1111"
        }
    ]
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

    
    beforeAll(async () => {
        blockchain = await Blockchain.create();
        owner = await blockchain.treasury("owner");
        notOwner = await blockchain.treasury('notOwner');

        defaultContent = Cell.fromBase64("te6ccgEBAQEAAgAAAA=="); // just some content ( doesn't matter )

        step = writeLog({
            path: join(__dirname, "output", "log.yaml"),
            blockchain,
        });

        
        // ITEM 
        {
            itemNFT = blockchain.openContract(await NFTItem.fromInit(owner.address, 0n));
            const deployItemMsg: InitNFTBody = {
                $$type: 'InitNFTBody',
                owner: owner.address,
                content: defaultContent
            }

            const deployResult = await itemNFT.send(owner.getSender(), {value: toNano("0.1")}, beginCell().store(storeInitNFTBody(deployItemMsg)).asSlice());

            expect(deployResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                deploy: true,
                success: true,
            });

            // deploy func
            const { result: deployFuncItem, itemNFTScope } = await deployFuncNFTItem(blockchain, owner);
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
            defaultCommonContent = beginCell().storeStringTail("common").endCell();
            defaultCollectionContent = beginCell().storeStringTail("collectioncontent").endCell();

            defaultNFTContent = beginCell().storeStringTail("1.json").endCell();

            defaultContent = beginCell().storeRef(defaultCollectionContent).storeRef(defaultCommonContent).endCell();
                
            royaltyParams = {
                $$type: 'RoyaltyParams',
                nominator: 1n,
                dominator: 100n,
                owner: owner.address,
            } 

            collectionNFT = blockchain.openContract(await NFTCollection.fromInit(owner.address, 0n, defaultContent, royaltyParams));
            const deployCollectionMsg: GetRoyaltyParams = {
                $$type: 'GetRoyaltyParams',
                queryId: 0n
            };

            const deployResult = await collectionNFT.send(owner.getSender(), {value: toNano("0.1")}, deployCollectionMsg);
            expect(deployResult.transactions).toHaveTransaction({
                from: owner.address,
                to: collectionNFT.address,
                deploy: true,
                success: true,
            });
            // deploy func
            const { result: deployFuncCollection, collectionNFTScope } = await deployFuncNFTCollection(blockchain, owner);
            funcCollectionNFT = collectionNFTScope;
            expect(deployFuncCollection.transactions).toHaveTransaction({
                from: owner.address,
                to: funcCollectionNFT.address,
                success: true,
                deploy: true,
            });
        }

    });

    afterAll(async () => {
        const collectionSize = await getStateSizeForAccount(blockchain, collectionNFT.address);
        const funcCollectionSize = await getStateSizeForAccount(blockchain, funcCollectionNFT.address);
        const itemSize = await getStateSizeForAccount(blockchain, itemNFT.address);
        const funcItemSize = await getStateSizeForAccount(blockchain, funcItemNFT.address);

        const codeSizeResults: RawCodeSizeResult = {
            results: [
                {
                    label: "FunC",
                    size: {
                        "collection cells": funcCollectionSize.cells.toString(),
                        "collection bits": funcCollectionSize.bits.toString(),
                        "item cells": funcItemSize.cells.toString(),
                        "item bits": funcItemSize.bits.toString()
                    },
                    pr: "1111"
                },
                {
                    label: "Tact",
                    size: {
                        "collection cells": collectionSize.cells.toString(),
                        "collection bits": collectionSize.bits.toString(),
                        "item cells": itemSize.cells.toString(),
                        "item bits": itemSize.bits.toString()
                    },
                    pr: "1111"
                }
            ]
        };

        writeFileSync(
            join(__dirname, "results_gas.json"),
            JSON.stringify(results, null, 2)
        );
        writeFileSync(
            join(__dirname, "results_code_size.json"),
            JSON.stringify(codeSizeResults, null, 2)
        );

        const benchmarkResults = generateResults(results);
        const codeResults = generateCodeSizeResults(codeSizeResults);
        printBenchmarkTable(benchmarkResults, codeResults, {
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
                $$type: 'Transfer',
                queryId: 0n,
                newOwner: newOwner,
                responseDestination: responseDestination,
                customPayload: null, // we don't use it in contract 
                forwardAmount: forwardAmount,
                forwardPayload: forwardPayload,
            };
        
            return await itemNFT.send(from, { value }, msg);
        };
        const runTransferTest = async (scopeItemNFT: SandboxContract<NFTItem>) => {
            const sendResult = await step("transfer", async ()  =>
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
        
        results.results[0]!.gas["transfer"] = transferGasUsedFunC.toString();
        results.results[1]!.gas["transfer"] = transferGasUsedTact.toString();
    });

    it("getStaticData", async () => {
        const sendGetStaticData = async (
            itemNFT: SandboxContract<NFTItem>,
            from: Sender,
            value: bigint,
        ) => {
            const msg: GetStaticData = { 
                $$type: 'GetStaticData',
                queryId: 0n,
            }
            
            return await itemNFT.send(from, { value }, msg);
        };

        const runGetStaticTest = async (scopeItemNFT: SandboxContract<NFTItem>) => {
            const sendResult = await step("get static data", async ()  =>
                sendGetStaticData(
                    scopeItemNFT, 
                    owner.getSender(),
                    toNano(1)
                ),
            );

            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });

            return getUsedGas(sendResult, "internal");
        };

        const getStaticGasUsedTact = await runGetStaticTest(itemNFT);
        const getStaticGasUsedFunC = await runGetStaticTest(funcItemNFT);
        
        results.results[0]!.gas["get static data"] = getStaticGasUsedFunC.toString();
        results.results[1]!.gas["get static data"] = getStaticGasUsedTact.toString();
    });

    it("deployNFT", async () => {
        const sendDeployNFT = async (
            collectionNFT: SandboxContract<NFTCollection>,
            from: Sender,
            value: bigint,
        ) => {
            const initNFTBody: InitNFTBody = {
                $$type: 'InitNFTBody',
                owner: owner.address,
                content: defaultNFTContent
            }
    
            const msg: DeployNFT = {
                $$type: 'DeployNFT',
                queryId: 1n, 
                itemIndex: 0n,
                amount: 10000000n,
                initNFTBody: beginCell().store(storeInitNFTBody(initNFTBody)).endCell(),
            };
            
            return await collectionNFT.send(from, { value }, msg);
        };

        const runDeployTest = async (scopeCollectionNFT: SandboxContract<NFTCollection>) => {
            const sendResult = await step("deploy nft", async ()  =>
                sendDeployNFT(
                    scopeCollectionNFT, 
                    owner.getSender(),
                    toNano(1)
                ),
            );

            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });

            return getUsedGas(sendResult, "internal");
        };

        const deployNFTGasUsedTact = await runDeployTest(collectionNFT);
        const deployNFTGasUsedFunC = await runDeployTest(funcCollectionNFT);
        
        results.results[0]!.gas["deploy nft"] = deployNFTGasUsedFunC.toString();
        results.results[1]!.gas["deploy nft"] = deployNFTGasUsedTact.toString();
    });

    it("batchDeployNFT", async () => {
        const batchMintNFTProcess = async (collectionNFT: SandboxContract<NFTCollection>, sender: SandboxContract<TreasuryContract>, owner: SandboxContract<TreasuryContract>, count: bigint) => {
            const dct = Dictionary.empty(Dictionary.Keys.BigUint(64), dictDeployNFTItem);
            // we deployed 1 ngt before
            let i: bigint = 1n;
            count += i;

            const initNFTBody: InitNFTBody = {
                $$type: 'InitNFTBody',
                owner: owner.address,
                content: defaultNFTContent,
            }
    
            while (i < count) {
                dct.set(i, {
                        amount: 10000000n,
                        initNFTBody: initNFTBody
                    }
                );
                i += 1n;
            }
    
            const batchMintNFT: BatchDeploy = {
                $$type: 'BatchDeploy',
                queryId: 0n,
                deployList: beginCell().storeDictDirect(dct).endCell(),
            }
            
            return await collectionNFT.send(sender.getSender(), {value: toNano("100") * (count + 10n) }, batchMintNFT);;
        };

        const runBatchDeployTest = async (scopeCollectionNFT: SandboxContract<NFTCollection>) => {
            const sendResult = await step("batch deploy nft", async ()  =>
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

            return getUsedGas(sendResult, "internal");
        };

        const batchDeployNFTGasUsedTact = await runBatchDeployTest(collectionNFT);
        const batchDeployNFTGasUsedFunC = await runBatchDeployTest(funcCollectionNFT);
        
        results.results[0]!.gas["batch deploy nft"] = batchDeployNFTGasUsedFunC.toString();
        results.results[1]!.gas["batch deploy nft"] = batchDeployNFTGasUsedTact.toString();
    });
    

});
