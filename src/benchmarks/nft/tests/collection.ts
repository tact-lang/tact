import type { Address, Cell } from "@ton/core";
import { beginCell, Dictionary } from "@ton/core";
import type {
    SandboxContract,
    TreasuryContract,
    SendMessageResult,
} from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type {
    DeployNFT,
    GetRoyaltyParams,
    BatchDeploy,
    RoyaltyParams,
    InitNFTBody,
    ChangeOwner,
} from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import {
    storeRoyaltyParams,
    type NFTCollection,
} from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import {
    storeInitNFTBody,
    type NFTItem,
} from "@/benchmarks/nft/tact/output/item_NFTItem";
import "@ton/test-utils";
import { step } from "@/test/allure/allure";
import {
    getOwner,
    getNextItemIndex,
    loadGetterTupleNFTData,
    Operations,
    Storage,
    ErrorCodes,
    TestValues,
    dictDeployNFTItem,
} from "@/benchmarks/nft/tests/utils";

type FromInitItem = (
    owner: Address | null,
    content: Cell | null,
    collectionAddress: Address,
    itemIndex: bigint,
) => Promise<NFTItem>;

export type FromInitCollection = (
    owner: Address,
    index: bigint,
    content: Cell,
    royaltyParams: RoyaltyParams,
) => Promise<NFTCollection>;

const globalSetup = async (fromInitCollection: FromInitCollection) => {
    const blockchain = await Blockchain.create();
    const owner = await blockchain.treasury("owner");
    const notOwner = await blockchain.treasury("notOwner");
    const defaultCommonContent = beginCell()
        .storeStringTail("common")
        .endCell();
    const defaultCollectionContent = beginCell()
        .storeStringTail("collectionContent")
        .endCell();
    const defaultNFTContent = beginCell().storeStringTail("1.json").endCell();
    const defaultContent = beginCell()
        .storeRef(defaultCollectionContent)
        .storeRef(defaultCommonContent)
        .endCell();

    const royaltyParams: RoyaltyParams = {
        $$type: "RoyaltyParams",
        nominator: 1n,
        dominator: 100n,
        owner: owner.address,
    };

    const collectionNFT = blockchain.openContract(
        await fromInitCollection(
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
        { value: Storage.DeployAmount },
        deployCollectionMsg,
    );
    await step(
        "Check that deployResult.transactions has correct transaction (collection)",
        () => {
            expect(deployResult.transactions).toHaveTransaction({
                from: owner.address,
                to: collectionNFT.address,
                deploy: true,
                success: true,
            });
        },
    );

    return {
        blockchain,
        owner,
        notOwner,
        defaultContent,
        defaultCommonContent,
        defaultCollectionContent,
        defaultNFTContent,
        royaltyParams,
        collectionNFT,
    };
};

const testEmptyMessages = (fromInitCollection: FromInitCollection) => {
    const setup = async () => {
        return await globalSetup(fromInitCollection);
    };

    describe("Empty messages cases", () => {
        it("should ignore empty messages", async () => {
            const { collectionNFT, owner } = await setup();
            const trxResult = await collectionNFT.send(
                owner.getSender(),
                { value: Storage.DeployAmount },
                null,
            );
            await step(
                "Check that trxResult.transactions has correct transaction (empty messages)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: collectionNFT.address,
                        success: true,
                    });
                },
            );
        });
    });
};

const testDeployItem = (
    fromInitCollection: FromInitCollection,
    fromInitItem: FromInitItem,
) => {
    describe("NFT deploy cases", () => {
        it("should deploy NFTItem correctly", async () => {
            // checking in beforeEach
        });
        const setup = async () => {
            return await globalSetup(fromInitCollection);
        };

        /**
         * Helper function to deploy an NFT item
         * @param itemIndex - Index of the NFT to deploy
         * @param collectionNFT - Collection contract instance
         * @param sender - Sender of the deployment transaction
         * @param owner - Owner of the deployed NFT
         * @returns Promise resolving to the NFT item contract and transaction result
         */
        const deployNFT = async (
            itemIndex: bigint,
            collectionNFT: SandboxContract<NFTCollection>,
            sender: SandboxContract<TreasuryContract>,
            owner: SandboxContract<TreasuryContract>,
            defaultNFTContent: Cell,
            blockchain: Blockchain,
        ): Promise<[SandboxContract<NFTItem>, SendMessageResult]> => {
            const initNFTBody: InitNFTBody = {
                $$type: "InitNFTBody",
                owner: owner.address,
                content: defaultNFTContent,
            };

            const mintMsg: DeployNFT = {
                $$type: "DeployNFT",
                queryId: 1n,
                itemIndex: itemIndex,
                amount: Storage.NftMintAmount,
                initNFTBody: beginCell()
                    .store(storeInitNFTBody(initNFTBody))
                    .endCell(),
            };

            const itemNFT = blockchain.openContract(
                await fromInitItem(
                    null,
                    null,
                    collectionNFT.address,
                    itemIndex,
                ),
            );

            const trxResult = await collectionNFT.send(
                sender.getSender(),
                { value: Storage.DeployAmount },
                mintMsg,
            );
            return [itemNFT, trxResult];
        };

        it("should mint NFTItem correctly", async () => {
            const { collectionNFT, owner, defaultNFTContent, blockchain } =
                await setup();
            const nextItemIndex = await getNextItemIndex(collectionNFT);
            const [itemNFT, _trx] = await deployNFT(
                nextItemIndex,
                collectionNFT,
                owner,
                owner,
                defaultNFTContent,
                blockchain,
            );
            const nftData = await itemNFT.getGetNftData();

            await step(
                "Check that nftData.content equals defaultNFTContent",
                () => {
                    expect(nftData.content).toEqualCell(defaultNFTContent);
                },
            );
            await step("Check that nftData.owner equals owner.address", () => {
                expect(nftData.owner).toEqualAddress(owner.address);
            });
            await step("Check that nftData.itemIndex is nextItemIndex", () => {
                expect(nftData.itemIndex).toBe(nextItemIndex);
            });
            await step(
                "Check that nftData.collectionAddress equals collectionNFT.address",
                () => {
                    expect(nftData.collectionAddress).toEqualAddress(
                        collectionNFT.address,
                    );
                },
            );
        });

        it("should not mint NFTItem if not owner", async () => {
            const { collectionNFT, defaultNFTContent, blockchain, notOwner } =
                await setup();
            const nextItemIndex = await getNextItemIndex(collectionNFT);
            const [_itemNFT, trx] = await deployNFT(
                nextItemIndex,
                collectionNFT,
                notOwner,
                notOwner,
                defaultNFTContent,
                blockchain,
            );
            await step(
                "Check that trx.transactions has correct transaction (not owner mint)",
                () => {
                    expect(trx.transactions).toHaveTransaction({
                        from: notOwner.address,
                        to: collectionNFT.address,
                        success: false,
                        exitCode: ErrorCodes.NotOwner,
                    });
                },
            );
        });

        it("should not deploy previous nft", async () => {
            const { collectionNFT, owner, defaultNFTContent, blockchain } =
                await setup();
            let nextItemIndex: bigint = await getNextItemIndex(collectionNFT);
            for (let i = 0; i < 10; i++) {
                const [_itemNFT, _trx] = await deployNFT(
                    nextItemIndex,
                    collectionNFT,
                    owner,
                    owner,
                    defaultNFTContent,
                    blockchain,
                );
                nextItemIndex++;
            }
            const [_itemNFT, trx] = await deployNFT(
                0n,
                collectionNFT,
                owner,
                owner,
                defaultNFTContent,
                blockchain,
            );
            await step(
                "Check that trx.transactions has correct transaction (should not deploy previous nft)",
                () => {
                    expect(trx.transactions).toHaveTransaction({
                        from: collectionNFT.address,
                        to: _itemNFT.address,
                        deploy: false,
                        success: false,
                        exitCode: ErrorCodes.InvalidData,
                    });
                },
            );
        });

        it("shouldn't mint item itemIndex > nextItemIndex", async () => {
            const { collectionNFT, owner, defaultNFTContent, blockchain } =
                await setup();
            const nextItemIndex = await getNextItemIndex(collectionNFT);
            const [_itemNFT, trx] = await deployNFT(
                nextItemIndex + 1n,
                collectionNFT,
                owner,
                owner,
                defaultNFTContent,
                blockchain,
            );
            await step(
                "Check that trx.transactions has correct transaction (itemIndex > nextItemIndex)",
                () => {
                    expect(trx.transactions).toHaveTransaction({
                        from: owner.address,
                        to: collectionNFT.address,
                        success: false,
                        exitCode: ErrorCodes.IncorrectIndex,
                    });
                },
            );
        });

        it("should get nft by itemIndex correctly", async () => {
            const { collectionNFT, owner, defaultNFTContent, blockchain } =
                await setup();
            const nextItemIndex = await getNextItemIndex(collectionNFT);
            // deploy new nft to get itemIndex
            const [_itemNFT, _trx] = await deployNFT(
                nextItemIndex,
                collectionNFT,
                owner,
                owner,
                defaultNFTContent,
                blockchain,
            );
            const nftAddress =
                await collectionNFT.getGetNftAddressByIndex(nextItemIndex);
            const newNFT = blockchain.getContract(nftAddress);
            const getData = await (await newNFT).get("get_nft_data");
            const dataNFT = loadGetterTupleNFTData(getData.stack);
            await step("Check that dataNFT.itemIndex is nextItemIndex", () => {
                expect(dataNFT.itemIndex).toBe(nextItemIndex);
            });
            await step(
                "Check that dataNFT.collectionAddress equals collectionNFT.address",
                () => {
                    expect(dataNFT.collectionAddress).toEqualAddress(
                        collectionNFT.address,
                    );
                },
            );
        });
    });
};

const testRoyalty = (fromInitCollection: FromInitCollection) => {
    const setup = async () => {
        return await globalSetup(fromInitCollection);
    };

    describe("Royalty cases", () => {
        it("should send royalty msg correctly", async () => {
            const { collectionNFT, owner, royaltyParams } = await setup();
            const queryId = 0n;

            const msg: GetRoyaltyParams = {
                $$type: "GetRoyaltyParams",
                queryId: BigInt(queryId),
            };

            const trxResult = await collectionNFT.send(
                owner.getSender(),
                { value: Storage.DeployAmount },
                msg,
            );

            await step(
                "Check that trxResult.transactions has correct transaction (royalty msg)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: collectionNFT.address,
                        success: true,
                    });
                },
            );

            const exceptedMsg: Cell = beginCell()
                .storeUint(Operations.ReportRoyaltyParams, 32)
                .storeUint(queryId, 64)
                .storeUint(royaltyParams.nominator, 16)
                .storeUint(royaltyParams.dominator, 16)
                .storeAddress(royaltyParams.owner)
                .endCell();
            expect(trxResult.transactions).toHaveTransaction({
                from: collectionNFT.address,
                to: owner.address,
                body: exceptedMsg,
            });
        });

        it("should get royalty params correctly", async () => {
            const { collectionNFT, royaltyParams } = await setup();
            const currRoyaltyParams = await collectionNFT.getRoyaltyParams();
            expect(
                beginCell()
                    .store(storeRoyaltyParams(currRoyaltyParams))
                    .asSlice(),
            ).toEqualSlice(
                beginCell().store(storeRoyaltyParams(royaltyParams)).asSlice(),
            );
        });
    });
};

const testBatchDeploy = (
    fromInitCollection: FromInitCollection,
    fromInitItem: FromInitItem,
) => {
    const setup = async () => {
        return await globalSetup(fromInitCollection);
    };

    describe("Batch mint cases", () => {
        /**
         * Helper function to batch mint NFTs
         * @param collectionNFT - Collection contract instance
         * @param sender - Sender of the batch mint transaction
         * @param owner - Owner of the minted NFTs
         * @param count - Number of NFTs to mint
         * @param extra - Optional extra index to mint
         * @returns Promise resolving to the transaction result
         */
        const batchMintNFTProcess = async (
            collectionNFT: SandboxContract<NFTCollection>,
            sender: SandboxContract<TreasuryContract>,
            owner: SandboxContract<TreasuryContract>,
            defaultNFTContent: Cell,
            count: bigint,
            extra: bigint = -1n,
        ): Promise<SendMessageResult> => {
            const dct = Dictionary.empty(
                Dictionary.Keys.BigUint(64),
                dictDeployNFTItem,
            );
            let i: bigint = 0n;

            const initNFTBody: InitNFTBody = {
                $$type: "InitNFTBody",
                owner: owner.address,
                content: defaultNFTContent,
            };

            while (i < count) {
                dct.set(i, {
                    amount: Storage.NftMintAmount,
                    initNFTBody: initNFTBody,
                });
                i += 1n;
            }

            if (extra != -1n) {
                dct.set(extra, {
                    amount: Storage.NftMintAmount,
                    initNFTBody: initNFTBody,
                });
            }

            const batchMintNFT: BatchDeploy = {
                $$type: "BatchDeploy",
                queryId: 0n,
                deployList: beginCell().storeDictDirect(dct).endCell(),
            };

            return await collectionNFT.send(
                sender.getSender(),
                {
                    value:
                        Storage.BatchDeployAmount *
                        (count + TestValues.ExtraValues.BatchMultiplier),
                },
                batchMintNFT,
            );
        };

        it.skip("test max batch mint", async () => {
            const { collectionNFT, owner, defaultNFTContent } = await setup();
            let L = 1n;
            let R = 1000n;
            while (R - L > 1) {
                const M = (L + R) / 2n;
                const trxResult = await batchMintNFTProcess(
                    collectionNFT,
                    owner,
                    owner,
                    defaultNFTContent,
                    M,
                );
                try {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: collectionNFT.address,
                        success: true,
                    });
                    L = M;
                } catch {
                    R = M;
                }
            }
            console.log("maximum batch amount is", L);
        });

        it("should batch mint correctly", async () => {
            const { collectionNFT, owner, defaultNFTContent, blockchain } =
                await setup();
            const count = 100n;
            const trxResult = await batchMintNFTProcess(
                collectionNFT,
                owner,
                owner,
                defaultNFTContent,
                count,
            );

            await step(
                "Check that trxResult.transactions has correct transaction (batch mint success)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: collectionNFT.address,
                        success: true,
                    });
                },
            );
            const itemNFT = blockchain.openContract(
                await fromInitItem(
                    null,
                    null,
                    collectionNFT.address,
                    count - 1n,
                ),
            );

            // it was deployed, that's why we can get it
            await step(
                "Check that itemNFT.getGetNftData() has property itemIndex",
                async () => {
                    expect(await itemNFT.getGetNftData()).toHaveProperty(
                        "itemIndex",
                        count - 1n,
                    );
                },
            );
        });

        it("shouldn't batch mint more than 250 items", async () => {
            const { collectionNFT, owner, defaultNFTContent } = await setup();
            const trxResult = await batchMintNFTProcess(
                collectionNFT,
                owner,
                owner,
                defaultNFTContent,
                260n,
            );

            await step(
                "Check that trxResult.transactions has correct transaction (should not batch mint more than 250)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: collectionNFT.address,
                        success: false,
                    });
                },
            );
        });

        it("should return error if not owner tries to batch mint", async () => {
            const { collectionNFT, owner, defaultNFTContent, notOwner } =
                await setup();
            const trxResult = await batchMintNFTProcess(
                collectionNFT,
                notOwner,
                owner,
                defaultNFTContent,
                10n,
            );

            await step(
                "Check that trxResult.transactions has correct transaction (not owner batch mint)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: notOwner.address,
                        to: collectionNFT.address,
                        success: false,
                        exitCode: ErrorCodes.NotOwner,
                    });
                },
            );
        });
    });
};

const testChangeOwner = (fromInitCollection: FromInitCollection) => {
    const setup = async () => {
        return await globalSetup(fromInitCollection);
    };

    describe("Change owner cases", () => {
        it("should transfer ownership correctly", async () => {
            const { collectionNFT, owner, notOwner } = await setup();
            const changeOwnerMsg: ChangeOwner = {
                $$type: "ChangeOwner",
                queryId: 1n,
                newOwner: notOwner.address,
            };

            const trxResult = await collectionNFT.send(
                owner.getSender(),
                { value: Storage.ChangeOwnerAmount },
                changeOwnerMsg,
            );

            await step(
                "Check that trxResult.transactions has correct transaction (owner transfer ownership)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: owner.address,
                        to: collectionNFT.address,
                        success: true,
                    });
                },
            );
            await step(
                "Check that collectionNFT.getOwner() equals notOwner.address",
                async () => {
                    expect(await getOwner(collectionNFT)).toEqualAddress(
                        notOwner.address,
                    );
                },
            );
        });

        it("should return error if not owner tries to transfer ownership", async () => {
            const { collectionNFT, owner, notOwner } = await setup();
            const changeOwnerMsg: ChangeOwner = {
                $$type: "ChangeOwner",
                queryId: 1n,
                newOwner: owner.address,
            };

            const trxResult = await collectionNFT.send(
                notOwner.getSender(),
                { value: Storage.ChangeOwnerAmount },
                changeOwnerMsg,
            );

            await step(
                "Check that trxResult.transactions has correct transaction (not owner transfer ownership)",
                () => {
                    expect(trxResult.transactions).toHaveTransaction({
                        from: notOwner.address,
                        to: collectionNFT.address,
                        success: false,
                        exitCode: ErrorCodes.NotOwner,
                    });
                },
            );
        });
    });
};

const testGetCollectionData = (fromInitCollection: FromInitCollection) => {
    const setup = async () => {
        return await globalSetup(fromInitCollection);
    };

    describe("Get collection data cases", () => {
        it("should get collection data correctly", async () => {
            const { collectionNFT, owner, defaultCollectionContent } =
                await setup();
            const staticData = await collectionNFT.getGetCollectionData();
            await step(
                "Check that staticData.owner equals owner.address",
                () => {
                    expect(staticData.owner).toEqualAddress(owner.address);
                },
            );
            await step("Check that staticData.nextItemIndex is 0", () => {
                expect(staticData.nextItemIndex).toBe(0n);
            });
            await step(
                "Check that staticData.collectionContent equals defaultCollectionContent",
                () => {
                    expect(staticData.collectionContent).toEqualCell(
                        defaultCollectionContent,
                    );
                },
            );
        });
    });
};

const testGetNftAddressByIndex = (
    fromInitCollection: FromInitCollection,
    fromInitItem: FromInitItem,
) => {
    const setup = async () => {
        return await globalSetup(fromInitCollection);
    };

    describe("Get nft address by index cases", () => {
        const deployNFT = async (
            itemIndex: bigint,
            collectionNFT: SandboxContract<NFTCollection>,
            sender: SandboxContract<TreasuryContract>,
            owner: SandboxContract<TreasuryContract>,
            defaultNFTContent: Cell,
            blockchain: Blockchain,
        ): Promise<[SandboxContract<NFTItem>, SendMessageResult]> => {
            const initNFTBody: InitNFTBody = {
                $$type: "InitNFTBody",
                owner: owner.address,
                content: defaultNFTContent,
            };

            const mintMsg: DeployNFT = {
                $$type: "DeployNFT",
                queryId: 1n,
                itemIndex: itemIndex,
                amount: Storage.NftMintAmount,
                initNFTBody: beginCell()
                    .store(storeInitNFTBody(initNFTBody))
                    .endCell(),
            };

            const itemNFT = blockchain.openContract(
                await fromInitItem(
                    null,
                    null,
                    collectionNFT.address,
                    itemIndex,
                ),
            );

            const trxResult = await collectionNFT.send(
                sender.getSender(),
                { value: Storage.DeployAmount },
                mintMsg,
            );
            return [itemNFT, trxResult];
        };

        it("should get nft address by index correctly", async () => {
            const { collectionNFT, owner, defaultNFTContent, blockchain } =
                await setup();
            const nftAddress = await collectionNFT.getGetNftAddressByIndex(0n);

            const [_itemNFT, trxDeploy] = await deployNFT(
                0n,
                collectionNFT,
                owner,
                owner,
                defaultNFTContent,
                blockchain,
            );

            await step(
                "Check that trxDeploy.transactions has correct transaction (deploy item)",
                () => {
                    expect(trxDeploy.transactions).toHaveTransaction({
                        from: collectionNFT.address,
                        to: nftAddress,
                        success: true,
                    });
                },
            );
        });
    });
};

const testGetRoyaltyParams = (fromInitCollection: FromInitCollection) => {
    const setup = async () => {
        return await globalSetup(fromInitCollection);
    };

    describe("Get royalty params cases", () => {
        it("should get royalty params correctly", async () => {
            const { collectionNFT, royaltyParams } = await setup();
            const currRoyaltyParams = await collectionNFT.getRoyaltyParams();
            expect(
                beginCell()
                    .store(storeRoyaltyParams(currRoyaltyParams))
                    .asSlice(),
            ).toEqualSlice(
                beginCell().store(storeRoyaltyParams(royaltyParams)).asSlice(),
            );
        });
    });
};

const testGetNftContent = (fromInitCollection: FromInitCollection) => {
    const setup = async () => {
        return await globalSetup(fromInitCollection);
    };

    describe("Get nft content cases", () => {
        it("should get nft content correctly", async () => {
            const { collectionNFT, defaultContent, defaultCommonContent } =
                await setup();
            const content = await collectionNFT.getGetNftContent(
                0n,
                defaultContent,
            );
            const expectedContent = beginCell()
                .storeUint(1, 8)
                .storeSlice(defaultCommonContent.asSlice())
                .storeRef(defaultContent)
                .endCell();
            await step(
                "Check that content equals expectedContent (nft content)",
                () => {
                    expect(content).toEqualCell(expectedContent);
                },
            );
        });
    });
};

export const testCollection = (
    fromInitCollection: FromInitCollection,
    fromInitItem: FromInitItem,
) => {
    describe("NFT Collection Contract", () => {
        testEmptyMessages(fromInitCollection);
        testDeployItem(fromInitCollection, fromInitItem);
        testRoyalty(fromInitCollection);
        testBatchDeploy(fromInitCollection, fromInitItem);
        testChangeOwner(fromInitCollection);
        testGetCollectionData(fromInitCollection);
        testGetNftAddressByIndex(fromInitCollection, fromInitItem);
        testGetRoyaltyParams(fromInitCollection);
        testGetNftContent(fromInitCollection);
    });
};
