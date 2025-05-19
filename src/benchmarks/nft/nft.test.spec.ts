// Type imports
import type {
    Address,
    Slice,
    ContractProvider,
    Cell,
    Sender,
    Builder,
    TupleItem,
    TupleItemInt,
    TupleItemSlice,
    TupleItemCell,
} from "@ton/core";
// Value imports
import { beginCell, toNano, Dictionary } from "@ton/core";

import type {
    SandboxContract,
    TreasuryContract,
    SendMessageResult,
} from "@ton/sandbox";

import { Blockchain } from "@ton/sandbox";

// NFT Collection imports
import type {
    DeployNFT,
    GetRoyaltyParams,
    GetStaticData,
    BatchDeploy,
    RoyaltyParams,
    InitNFTBody,
    ChangeOwner,
} from "./output/collection_NFTCollection";
import {
    storeRoyaltyParams,
    loadInitNFTBody,
    NFTCollection,
} from "./output/collection_NFTCollection";

// NFT Item imports
import type { Transfer, NFTData } from "./output/item_NFTItem";
import { storeInitNFTBody, NFTItem } from "./output/item_NFTItem";

import "@ton/test-utils";
import { randomInt } from "crypto";

import { setStoragePrices } from "@/test/utils/gasUtils";

/** Operation codes for NFT contract messages */
const Operations = {
    TransferNft: 0x5fcc3d14,
    OwnershipAssignment: 0x05138d91,
    Excess: 0xd53276db,
    GetStaticData: 0x2fcb26a2,
    ReportStaticData: 0x8b771735,
    GetRoyaltyParams: 0x693d3950,
    ReportRoyaltyParams: 0xa8cb00ad,
    EditContent: 0x1a0b9d51,
    TransferEditorship: 0x1c04412a,
    EditorshipAssigned: 0x511a4463,
} as const;

/** Storage and transaction related constants */
const Storage = {
    /** Minimum amount of TONs required for storage */
    MinTons: 50000000n,
    /** Amount of TONs for deployment operations */
    DeployAmount: toNano("0.1"),
    /** Amount of TONs for transfer operations */
    TransferAmount: toNano("1"),
    /** Amount of TONs for batch deployment */
    BatchDeployAmount: toNano("100"),
    /** Amount of TONs for ownership change */
    ChangeOwnerAmount: 100000000n,
    /** Amount of TONs for NFT minting */
    NftMintAmount: 10000000n,
    /** Forward fee values */
    ForwardFee: {
        /** Base forward fee for single message */
        Base: 623605n,
        /** Forward fee for double message */
        Double: 729606n,
    },
} as const;

/** Error codes */
const ErrorCodes = {
    /** Error code for not initialized contract */
    NotInit: 9,
    /** Error code for not owner */
    NotOwner: 401,
    /** Error code for invalid fees */
    InvalidFees: 402,
    /** Error code for incorrect index */
    IncorrectIndex: 402,
    /** Error code for invalid data */
    InvalidData: 65535,
} as const;

/** Test related constants */
const TestValues = {
    /** Default item index used in tests */
    ItemIndex: 100n,
    /** Batch operation sizes */
    BatchSize: {
        Min: 1n,
        Max: 250n,
        Default: 50n,
        OverLimit: 260n,
        Small: 10n,
    },
    /** Range for random number generation */
    RandomRange: 1337,
    /** Royalty parameters */
    Royalty: {
        Nominator: 1n,
        Dominator: 100n,
    },
    /** Bit sizes for different data types */
    BitSizes: {
        Uint1: 1,
        Uint8: 8,
        Uint16: 16,
        Uint32: 32,
        Uint64: 64,
    },
    /** Additional test values */
    ExtraValues: {
        BatchMultiplier: 10n,
    },
} as const;

/** Dictionary type for NFT deployment data */
export type dictDeployNFT = {
    amount: bigint;
    initNFTBody: InitNFTBody;
};

/** Dictionary value parser for NFT deployment */
export const dictDeployNFTItem = {
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

const minTonsForStorage = Storage.MinTons;

/**
 * Sends a transfer message to an NFT item contract
 * @param itemNFT - The NFT item contract instance
 * @param from - The sender of the transfer
 * @param value - Amount of TONs to send
 * @param newOwner - Address of the new owner
 * @param responseDestination - Address to send the response to
 * @param forwardAmount - Amount of TONs to forward
 * @param forwardPayload - Optional payload to forward
 * @returns Promise resolving to the transaction result
 */
const sendTransfer = async (
    itemNFT: SandboxContract<NFTItem>,
    from: Sender,
    value: bigint,
    newOwner: Address,
    responseDestination: Address | null,
    forwardAmount: bigint,
    forwardPayload: Slice = beginCell().storeUint(0, 1).asSlice(),
): Promise<SendMessageResult> => {
    const msg: Transfer = {
        $$type: "Transfer",
        queryId: 0n,
        newOwner: newOwner,
        responseDestination: responseDestination,
        customPayload: null,
        forwardAmount: forwardAmount,
        forwardPayload: forwardPayload,
    };

    return await itemNFT.send(from, { value }, msg);
};

/**
 * Helper function to load NFT data from a tuple of contract getter results
 * @param source - Array of tuple items containing NFT data
 * @returns Parsed NFT data object
 */
function loadGetterTupleNFTData(source: TupleItem[]): NFTData {
    const _init = (source[0] as TupleItemInt).value;
    const _index = (source[1] as TupleItemInt).value;
    const _collectionAddress = (source[2] as TupleItemSlice).cell
        .asSlice()
        .loadAddress();
    const _owner = (source[3] as TupleItemSlice).cell.asSlice().loadAddress();
    const _content = (source[4] as TupleItemCell).cell;
    return {
        $$type: "NFTData" as const,
        init: _init,
        itemIndex: _index,
        collectionAddress: _collectionAddress,
        owner: _owner,
        content: _content,
    };
}

/**
 * Extends NFTItem interface with owner getter functionality
 */
declare module "./output/item_NFTItem" {
    interface NFTItem {
        /**
         * Gets the current owner of the NFT
         * @param provider - Contract provider instance
         * @returns Promise resolving to owner's address or null if not initialized
         */
        getOwner(provider: ContractProvider): Promise<Address | null>;
    }
}

/**
 * Extends NFTCollection interface with additional getter functionality
 */
declare module "./output/collection_NFTCollection" {
    interface NFTCollection {
        /**
         * Gets the next available item index for minting
         * @param provider - Contract provider instance
         * @returns Promise resolving to the next item index
         */
        getNextItemIndex(provider: ContractProvider): Promise<bigint>;

        /**
         * Gets the current owner of the collection
         * @param provider - Contract provider instance
         * @returns Promise resolving to owner's address
         */
        getOwner(provider: ContractProvider): Promise<Address>;
    }
}

NFTItem.prototype.getOwner = async function (
    this: NFTItem,
    provider: ContractProvider,
): Promise<Address | null> {
    const res = await this.getGetNftData(provider);
    return res.owner;
};

describe("NFT Item Contract", () => {
    let blockchain: Blockchain;
    let itemNFT: SandboxContract<NFTItem>;
    let owner: SandboxContract<TreasuryContract>;
    let notOwner: SandboxContract<TreasuryContract>;
    let defaultContent: Cell;
    let emptyAddress: Address | null;

    beforeEach(async () => {
        blockchain = await Blockchain.create();

        const config = blockchain.config;
        blockchain.setConfig(
            setStoragePrices(config, {
                unixTimeSince: 0,
                bitPricePerSecond: 0n,
                cellPricePerSecond: 0n,
                masterChainBitPricePerSecond: 0n,
                masterChainCellPricePerSecond: 0n,
            }),
        );

        owner = await blockchain.treasury("owner");
        notOwner = await blockchain.treasury("notOwner");

        emptyAddress = null;
        defaultContent = beginCell().endCell(); // just some content ( doesn't matter )

        itemNFT = blockchain.openContract(
            await NFTItem.fromInit(null, null, owner.address, 0n),
        );
        const deployItemMsg: InitNFTBody = {
            $$type: "InitNFTBody",
            owner: owner.address,
            content: defaultContent,
        };

        const deployResult = await itemNFT.send(
            owner.getSender(),
            { value: Storage.DeployAmount },
            beginCell().store(storeInitNFTBody(deployItemMsg)).asSlice(),
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: owner.address,
            to: itemNFT.address,
            deploy: true,
            success: true,
        });
    });

    const messageGetStaticData = async (
        sender: SandboxContract<TreasuryContract>,
        itemNFT: SandboxContract<NFTItem>,
    ) => {
        const msg: GetStaticData = {
            $$type: "GetStaticData",
            queryId: 1n,
        };

        const trxResult = await itemNFT.send(
            sender.getSender(),
            { value: Storage.DeployAmount },
            msg,
        );
        return trxResult;
    };

    it("should deploy correctly", async () => {
        // checking in beforeEach
    });

    it("should get nft data correctly", async () => {
        const staticData = await itemNFT.getGetNftData();

        expect(staticData.init).toBe(-1n);
        expect(staticData.itemIndex).toBe(0n);
        expect(staticData.collectionAddress).toEqualAddress(owner.address);
        expect(staticData.owner).toEqualAddress(owner.address);
        expect(staticData.content).toEqualCell(defaultContent);
    });

    it("should get static data correctly", async () => {
        const trxResult = await messageGetStaticData(owner, itemNFT);
        expect(trxResult.transactions).toHaveTransaction({
            from: owner.address,
            to: itemNFT.address,
            success: true,
        });
    });

    describe("Transfer ownership Fee cases", () => {
        let balance: bigint;
        let fwdFee: bigint;

        beforeEach(async () => {
            balance = await (
                await blockchain.getContract(itemNFT.address)
            ).balance;
            fwdFee = Storage.ForwardFee.Base;
        });

        it("Transfer forward amount too much", async () => {
            // NFT should reject transfer if balance lower than forward_amount + message forward fee + minimal storage fee
            // Sending message with forward_amount of 1 TON and balance 0.1 TON

            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.DeployAmount,
                notOwner.address,
                emptyAddress,
                Storage.TransferAmount,
            );
            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: false,
                exitCode: ErrorCodes.InvalidFees,
            });
        });

        it("test transfer storage fee", async () => {
            //     Now let's try forward_amount exactly equal to balance and fwd_fee 0
            //  1 TON Balance forward_amount:1 TON fwd_fee:0 (just add to transfer value) verifying that minimal storage comes into play
            //  Should fail with no actions

            // [] and {} just kinds of () for more understandable description

            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.TransferAmount + fwdFee,
                notOwner.address,
                emptyAddress,
                Storage.TransferAmount + balance,
            ); // balance + 1ton + fwd - (1ton + balance) = [0] + {fwdFee} and [0] < [minTonsForStorage]
            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: false,
                exitCode: ErrorCodes.InvalidFees,
            });
        });
        it("test transfer forward fee 2.0", async () => {
            // Let's verify that storage fee was an error trigger by increasing balance by min_storage
            // Expect success

            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.TransferAmount + minTonsForStorage + fwdFee,
                notOwner.address,
                emptyAddress,
                Storage.TransferAmount + balance,
            ); // balance + 1ton + minTonsForStorage + fwdFee - (1ton + balance) = [minTonsForStorage] + {fwdFee}

            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: true,
            });
        });

        it("test transfer forward fee single", async () => {
            // If transfer is successful NFT supposed to send up to 2 messages
            // 1)To the owner_address with forward_amount of coins
            // 2)To the response_addr with forward_payload if response_addr is not addr_none
            // Each of those messages costs fwd_fee
            // In this case we test scenario where only single message required to be sent;
            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.TransferAmount + Storage.ForwardFee.Base,
                notOwner.address,
                emptyAddress,
                Storage.TransferAmount + balance - minTonsForStorage,
                beginCell()
                    .storeUint(1, 1)
                    .storeStringTail("testing")
                    .asSlice(),
            ); // balance + 1ton + fwdFee - (1ton + balance - minTonsForStorage) = [minTonsForStorage]  + {fwdFee}

            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: true,
            });
        });

        describe("test transfer forward fee double", function () {
            beforeEach(() => {
                fwdFee = Storage.ForwardFee.Double;
            });
            it("should false with only one fwd fee on balance", async () => {
                // If transfer is successful NFT supposed to send up to 2 messages
                // 1)To the owner_address with forward_amount of coins
                // 2)To the response_addr with forward_payload if response_addr is not addr_none
                // Each of those messages costs fwd_fee
                // In this case we test scenario where both messages required to be sent but balance has funs only for single message
                // To do so resp_dst has be a valid address not equal to addr_none

                const trxResult = await sendTransfer(
                    itemNFT,
                    owner.getSender(),
                    Storage.TransferAmount + fwdFee,
                    notOwner.address,
                    owner.address,
                    Storage.TransferAmount + balance - Storage.MinTons,
                    beginCell()
                        .storeUint(1, 1)
                        .storeStringTail("testing")
                        .asSlice(),
                );

                // 1ton + fwdFee - (1ton + balance - minTonsForStorage) = [minTonsForStorage] + {fwdFee} and {fwdFee} < {2 * fwdFee}
                expect(trxResult.transactions).toHaveTransaction({
                    from: owner.address,
                    to: itemNFT.address,
                    success: false,
                    exitCode: ErrorCodes.InvalidFees,
                });
            });

            // let now check if we have 2 fwdFees on balance
            it("should work with 2 fwdFee on balance", async () => {
                const trxResult = await sendTransfer(
                    itemNFT,
                    owner.getSender(),
                    Storage.TransferAmount + 2n * fwdFee,
                    notOwner.address,
                    owner.address,
                    Storage.TransferAmount + balance - minTonsForStorage,
                    beginCell()
                        .storeUint(1, 1)
                        .storeStringTail("testing")
                        .asSlice(),
                );
                // 1ton + 2 * fwdFee - (1ton + balance - minTonsForStorage) = [minTonsForStorage] + {2 * fwdFee}
                expect(trxResult.transactions).toHaveTransaction({
                    from: owner.address,
                    to: itemNFT.address,
                    success: true,
                });
                balance = await (
                    await blockchain.getContract(itemNFT.address)
                ).balance;
                expect(balance).toBeLessThan(minTonsForStorage);
            });
        });
        // int __test_transfer_success_forward_no_response testing in next test suite
    });

    describe("Transfer Ownership Tests", () => {
        it("Test ownership assigned", async () => {
            const oldOwner = await itemNFT.getOwner();
            expect(oldOwner).toEqualAddress(owner.address);
            const trxRes = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.DeployAmount,
                notOwner.address,
                owner.address,
                1n,
            );

            const newOwner = await itemNFT.getOwner();
            expect(newOwner).toEqualAddress(notOwner.address);
            expect(trxRes.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: true,
            });
        });

        it("Test transfer ownership without any messages", async () => {
            const trxRes = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.DeployAmount,
                notOwner.address,
                emptyAddress,
                0n,
            );
            const newOwner = await itemNFT.getOwner();
            expect(newOwner).toEqualAddress(notOwner.address);
            expect(trxRes.transactions).not.toHaveTransaction({
                from: itemNFT.address,
            });
        });

        it("Not owner should not be able to transfer ownership", async () => {
            const trxResult = await sendTransfer(
                itemNFT,
                notOwner.getSender(),
                Storage.DeployAmount,
                notOwner.address,
                emptyAddress,
                0n,
            );
            expect(trxResult.transactions).toHaveTransaction({
                from: notOwner.address,
                to: itemNFT.address,
                success: false,
                exitCode: ErrorCodes.NotOwner,
            });
        });
    });

    describe("NOT INITIALIZED TESTS", () => {
        const itemIndex: bigint = 100n;
        beforeEach(async () => {
            itemNFT = blockchain.openContract(
                await NFTItem.fromInit(null, null, owner.address, itemIndex),
            );
            const _deployResult = await itemNFT.send(
                owner.getSender(),
                { value: Storage.DeployAmount },
                beginCell().asSlice(),
            );
        });

        it("should not get static data", async () => {
            const staticData = await itemNFT.getGetNftData();
            expect(staticData.init).toBe(0n);
            expect(staticData.collectionAddress).toEqualAddress(owner.address);
            expect(staticData.owner).toBeNull();
            expect(staticData.itemIndex).toBe(itemIndex);
            expect(staticData.content).toBeNull();
        });

        it("should not transfer ownership", async () => {
            const trxResult = await sendTransfer(
                itemNFT,
                owner.getSender(),
                Storage.DeployAmount,
                notOwner.address,
                owner.address,
                0n,
            );
            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: false,
                exitCode: ErrorCodes.NotInit,
            });
        });

        it("should not get static data message", async () => {
            const trxResult = await messageGetStaticData(owner, itemNFT);
            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: itemNFT.address,
                success: false,
                exitCode: ErrorCodes.NotInit,
            });
        });
    });
});

NFTCollection.prototype.getNextItemIndex = async function (
    this: NFTCollection,
    provider: ContractProvider,
): Promise<bigint> {
    const res = await this.getGetCollectionData(provider);
    return res.nextItemIndex;
};

NFTCollection.prototype.getOwner = async function (
    this: NFTCollection,
    provider: ContractProvider,
): Promise<Address> {
    const res = await this.getGetCollectionData(provider);
    return res.owner;
};

describe("NFT Collection Contract", () => {
    let blockchain: Blockchain;
    let collectionNFT: SandboxContract<NFTCollection>;
    let itemNFT: SandboxContract<NFTItem>;

    let owner: SandboxContract<TreasuryContract>;
    let notOwner: SandboxContract<TreasuryContract>;

    let defaultContent: Cell;
    let defaultCommonContent: Cell;
    let defaultCollectionContent: Cell;
    let defaultNFTContent: Cell;
    let royaltyParams: RoyaltyParams;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        owner = await blockchain.treasury("owner");
        notOwner = await blockchain.treasury("notOwner");

        defaultCommonContent = beginCell().storeStringTail("common").endCell();
        defaultCollectionContent = beginCell()
            .storeStringTail("collectioncontent")
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
            { value: Storage.DeployAmount },
            deployCollectionMsg,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: owner.address,
            to: collectionNFT.address,
            deploy: true,
            success: true,
        });
    });

    it("should deploy correctly", async () => {
        // checking in beforeEach
    });

    it("should get static data correctly", async () => {
        const staticData = await collectionNFT.getGetCollectionData();
        expect(staticData.owner).toEqualAddress(owner.address);
        expect(staticData.nextItemIndex).toBe(0n);
        expect(staticData.collectionContent).toEqualCell(
            defaultCollectionContent,
        );
    });

    it("should get nft content correctly", async () => {
        const content = await collectionNFT.getGetNftContent(
            0n,
            defaultContent,
        );
        const expectedContent = beginCell()
            .storeUint(1, 8)
            .storeSlice(defaultCommonContent.asSlice())
            .storeRef(defaultContent)
            .endCell();
        expect(content).toEqualCell(expectedContent);
    });

    describe("ROYALTY TESTS", () => {
        it("test royalty msg", async () => {
            const queryId = randomInt(TestValues.RandomRange) + 1;

            const msg: GetRoyaltyParams = {
                $$type: "GetRoyaltyParams",
                queryId: BigInt(queryId),
            };

            const trxResult = await collectionNFT.send(
                owner.getSender(),
                { value: Storage.DeployAmount },
                msg,
            );

            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: collectionNFT.address,
                success: true,
            });

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

        it("test royalty getter", async () => {
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

    describe("NFT DEPLOY TESTS", () => {
        it("should deploy NFTItem correctly", async () => {
            // checking in beforeEach
        });

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
                await NFTItem.fromInit(
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
            const nextItemIndex = await collectionNFT.getNextItemIndex();
            const [itemNFT, _trx] = await deployNFT(
                nextItemIndex,
                collectionNFT,
                owner,
                owner,
            );
            const nftData = await itemNFT.getGetNftData();

            expect(nftData.content).toEqualCell(defaultNFTContent);
            expect(nftData.owner).toEqualAddress(owner.address);
            expect(nftData.itemIndex).toBe(nextItemIndex);
            expect(nftData.collectionAddress).toEqualAddress(
                collectionNFT.address,
            );
        });

        it("should not mint NFTItem if not owner", async () => {
            const nextItemIndex = await collectionNFT.getNextItemIndex();
            const [_itemNFT, _trx] = await deployNFT(
                nextItemIndex,
                collectionNFT,
                notOwner,
                notOwner,
            );
            expect(
                (_trx as { transactions: unknown }).transactions,
            ).toHaveTransaction({
                from: notOwner.address,
                to: collectionNFT.address,
                success: false,
                exitCode: ErrorCodes.NotOwner,
            });
        });

        it("should not deploy previous nft", async () => {
            let nextItemIndex: bigint = await collectionNFT.getNextItemIndex();
            for (let i = 0; i < 10; i++) {
                const [_itemNFT, _trx] = await deployNFT(
                    nextItemIndex,
                    collectionNFT,
                    owner,
                    owner,
                );
                nextItemIndex++;
            }
            const [_itemNFT, _trx] = await deployNFT(
                0n,
                collectionNFT,
                owner,
                owner,
            );
            expect(
                (_trx as { transactions: unknown }).transactions,
            ).toHaveTransaction({
                from: collectionNFT.address,
                to: _itemNFT.address,
                deploy: false,
                success: false,
                exitCode: ErrorCodes.InvalidData,
            });
        });

        it("shouldn't mint item itemIndex > nextItemIndex", async () => {
            const nextItemIndex = await collectionNFT.getNextItemIndex();
            const [_itemNFT, _trx] = await deployNFT(
                nextItemIndex + 1n,
                collectionNFT,
                owner,
                owner,
            );
            expect(
                (_trx as { transactions: unknown }).transactions,
            ).toHaveTransaction({
                from: owner.address,
                to: collectionNFT.address,
                success: false,
                exitCode: ErrorCodes.IncorrectIndex,
            });
        });

        it("test get nft by itemIndex", async () => {
            const nextItemIndex = await collectionNFT.getNextItemIndex();
            // deploy new nft to get itemIndex
            const [_itemNFT, _trx] = await deployNFT(
                nextItemIndex,
                collectionNFT,
                owner,
                owner,
            );
            const nftAddress =
                await collectionNFT.getGetNftAddressByIndex(nextItemIndex);
            const newNFT = blockchain.getContract(nftAddress);
            const getData = await (await newNFT).get("get_nft_data");
            const dataNFT = loadGetterTupleNFTData(getData.stack);
            expect(dataNFT.itemIndex).toBe(nextItemIndex);
            expect(dataNFT.collectionAddress).toEqualAddress(
                collectionNFT.address,
            );
        });
    });

    describe("BATCH MINT TESTS", () => {
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
        beforeEach(async () => {});

        it.skip("test max batch mint", async () => {
            let L = 1n;
            let R = 1000n;
            while (R - L > 1) {
                const M = (L + R) / 2n;
                const trxResult = await batchMintNFTProcess(
                    collectionNFT,
                    owner,
                    owner,
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

        it("Should batch mint correctly", async () => {
            const count = 50n;
            const trxResult = await batchMintNFTProcess(
                collectionNFT,
                owner,
                owner,
                count,
            );

            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: collectionNFT.address,
                success: true,
            });
            itemNFT = blockchain.openContract(
                await NFTItem.fromInit(
                    null,
                    null,
                    collectionNFT.address,
                    count - 1n,
                ),
            );

            // it was deployed, that's why we can get it
            expect(await itemNFT.getGetNftData()).toHaveProperty(
                "itemIndex",
                count - 1n,
            );
        });

        it("Shouldn't batch mint more than 250 items", async () => {
            const trxResult = await batchMintNFTProcess(
                collectionNFT,
                owner,
                owner,
                260n,
            );

            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: collectionNFT.address,
                success: false,
            }); // in orig func contracts exit code -14, but it throw in code 399 ( we can just check )
        });

        it("Should not batch mint not owner", async () => {
            const trxResult = await batchMintNFTProcess(
                collectionNFT,
                notOwner,
                owner,
                10n,
            );

            expect(trxResult.transactions).toHaveTransaction({
                from: notOwner.address,
                to: collectionNFT.address,
                success: false,
                exitCode: ErrorCodes.NotOwner,
            });
        });
        describe("!!--DIFF TEST---!!", () => {
            it("Should HAVE message in batchDeploy with previous indexes", async () => {
                await batchMintNFTProcess(collectionNFT, owner, owner, 50n);
                const trxResult = await batchMintNFTProcess(
                    collectionNFT,
                    owner,
                    owner,
                    50n,
                );

                itemNFT = blockchain.openContract(
                    await NFTItem.fromInit(
                        null,
                        null,
                        collectionNFT.address,
                        10n,
                    ),
                ); // random number

                expect(trxResult.transactions).toHaveTransaction({
                    from: collectionNFT.address,
                    to: itemNFT.address,
                });
            });

            it("Should THROW if we have index > nextItemIndex", async () => {
                const trxResult = await batchMintNFTProcess(
                    collectionNFT,
                    owner,
                    owner,
                    50n,
                    70n,
                );

                expect(trxResult.transactions).toHaveTransaction({
                    from: owner.address,
                    to: collectionNFT.address,
                    success: false,
                });
            });
        });
    });

    describe("TRANSFER OWNERSHIP TEST", () => {
        it("Owner should be able to transfer ownership", async () => {
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

            expect(trxResult.transactions).toHaveTransaction({
                from: owner.address,
                to: collectionNFT.address,
                success: true,
            });
            expect(await collectionNFT.getOwner()).toEqualAddress(
                notOwner.address,
            );
        });
        it("Not owner should not be able to transfer ownership", async () => {
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

            expect(trxResult.transactions).toHaveTransaction({
                from: notOwner.address,
                to: collectionNFT.address,
                success: false,
                exitCode: ErrorCodes.NotOwner,
            });
        });
    });
});
