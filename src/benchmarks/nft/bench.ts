import "@ton/test-utils";
import type { Address } from "@ton/core";
import type { Cell } from "@ton/core";
import { beginCell, toNano, Dictionary } from "@ton/core";

import type { Slice, Sender, Builder } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import type { BenchmarkResult, CodeSizeResult } from "@/benchmarks/utils/gas";
import { getStateSizeForAccount, getUsedGas } from "@/benchmarks/utils/gas";
import { join } from "path";
import type { Step } from "@/test/utils/write-vm-log";
import { writeLog } from "@/test/utils/write-vm-log";
import type { NFTCollection } from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import {
    ReportStaticData,
    loadInitNFTBody,
} from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import type {
    DeployNFT,
    GetStaticData,
    BatchDeploy,
    RoyaltyParams,
    InitNFTBody,
} from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import type {
    NFTItem,
    Transfer,
} from "@/benchmarks/nft/tact/output/collection_NFTItem";
import { storeInitNFTBody } from "@/benchmarks/nft/tact/output/collection_NFTItem";

type dictDeployNFT = {
    amount: bigint;
    initNFTBody: InitNFTBody;
};

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

export function bench(
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
) {
    let blockchain: Blockchain;
    let owner: SandboxContract<TreasuryContract>;
    let notOwner: SandboxContract<TreasuryContract>;
    let itemNFT: SandboxContract<NFTItem>;
    let collectionNFT: SandboxContract<NFTCollection>;

    let defaultContent: Cell;
    let defaultCommonContent: Cell;
    let defaultCollectionContent: Cell;
    let defaultNFTContent: Cell;
    let royaltyParams: RoyaltyParams;

    let step: Step;

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        owner = await blockchain.treasury("owner");
        notOwner = await blockchain.treasury("notOwner");

        defaultCommonContent = beginCell().storeStringTail("common").endCell();
        defaultCollectionContent = beginCell()
            .storeStringTail("collectionContent")
            .endCell();
        defaultNFTContent = beginCell().endCell();
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

        step = writeLog({
            path: join(__dirname, "output", "log.yaml"),
            blockchain,
        });

        // Deploy Collection
        collectionNFT = blockchain.openContract(
            await fromInitCollection(
                owner.address,
                0n,
                defaultContent,
                royaltyParams,
            ),
        );

        const deployResult = await collectionNFT.send(
            owner.getSender(),
            { value: toNano("0.1") },
            {
                $$type: "GetRoyaltyParams",
                queryId: 0n,
            },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: owner.address,
            to: collectionNFT.address,
            deploy: true,
            success: true,
        });

        // Deploy Item
        itemNFT = blockchain.openContract(
            await fromInitItem(null, null, owner.address, 0n),
        );

        const deployItemMsg: InitNFTBody = {
            $$type: "InitNFTBody",
            owner: owner.address,
            content: defaultNFTContent,
        };

        const deployItemResult = await itemNFT.send(
            owner.getSender(),
            { value: toNano("0.1") },
            beginCell().store(storeInitNFTBody(deployItemMsg)).asSlice(),
        );

        expect(deployItemResult.transactions).toHaveTransaction({
            from: owner.address,
            to: itemNFT.address,
            deploy: true,
            success: true,
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

        const sendResult = await step("transfer", async () =>
            sendTransfer(
                itemNFT,
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

        const gasUsed = getUsedGas(sendResult, "internal");
        expect(gasUsed).toEqual(benchmarkResults.gas["transfer"]);
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

        const sendResult = await step("get static data", async () =>
            sendGetStaticData(itemNFT, owner.getSender(), toNano(1)),
        );

        expect(sendResult.transactions).toHaveTransaction({
            from: itemNFT.address,
            to: owner.address,
            body: beginCell()
                .storeUint(ReportStaticData, 32)
                .storeUint(0n, 64)
                .storeUint(0n, 256)
                .storeAddress(owner.address)
                .endCell(),
            success: true,
        });

        expect(sendResult.transactions).not.toHaveTransaction({
            success: false,
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        expect(gasUsed).toEqual(benchmarkResults.gas["get static data"]);
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

        const sendResult = await step("deploy nft", async () =>
            sendDeployNFT(collectionNFT, owner.getSender(), toNano(1)),
        );

        expect(sendResult.transactions).not.toHaveTransaction({
            success: false,
        });

        expect(sendResult.transactions).toHaveTransaction({
            from: collectionNFT.address,
            deploy: true,
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        expect(gasUsed).toEqual(benchmarkResults.gas["deploy nft"]);
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

        const sendResult = await step("batch deploy nft", async () =>
            batchMintNFTProcess(collectionNFT, owner, owner, 100n),
        );

        expect(sendResult.transactions).not.toHaveTransaction({
            success: false,
        });

        expect(sendResult.transactions).toHaveTransaction({
            from: collectionNFT.address,
            deploy: true,
        });

        const gasUsed = getUsedGas(sendResult, "internal");
        expect(gasUsed).toEqual(benchmarkResults.gas["batch deploy nft"]);
    });

    it("collection cells", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, collectionNFT.address))
                .cells,
        ).toEqual(codeSizeResults.size["collection cells"]);
    });

    it("collection bits", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, collectionNFT.address))
                .bits,
        ).toEqual(codeSizeResults.size["collection bits"]);
    });

    it("item cells", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, itemNFT.address)).cells,
        ).toEqual(codeSizeResults.size["item cells"]);
    });

    it("item bits", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, itemNFT.address)).bits,
        ).toEqual(codeSizeResults.size["item bits"]);
    });
}
