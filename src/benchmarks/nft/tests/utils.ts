// Type imports
import type {
    Address,
    Slice,
    Builder,
    TupleItem,
    TupleItemInt,
    TupleItemSlice,
    TupleItemCell,
    Sender,
} from "@ton/core";
// Value imports
import { beginCell, toNano } from "@ton/core";

import type { SandboxContract, SendMessageResult } from "@ton/sandbox";
// NFT Collection imports
import type {
    InitNFTBody,
    NFTCollection,
    Transfer,
} from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import {
    IncorrectDeployer,
    IncorrectIndex,
    IncorrectSender,
    InvalidData,
    InvalidDestinationWorkchain,
    InvalidFees,
    NotInit,
} from "@/benchmarks/nft/tact/output/collection_NFTCollection";
import { loadInitNFTBody } from "@/benchmarks/nft/tact/output/collection_NFTCollection";

// NFT Item imports
import type { NFTData } from "@/benchmarks/nft/tact/output/item_NFTItem";
import {
    storeInitNFTBody,
    type NFTItem,
} from "@/benchmarks/nft/tact/output/item_NFTItem";

import "@ton/test-utils";

/** Storage and transaction related constants */
export const Storage = {
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
};

/** Error codes */
export const ErrorCodes = {
    /** Error code for not initialized contract */
    NotInit: Number(NotInit),
    /** Error code for not owner */
    NotOwner: Number(IncorrectSender),
    /** Error code for invalid fees */
    InvalidFees: Number(InvalidFees),
    /** Error code for incorrect index */
    IncorrectIndex: Number(IncorrectIndex),
    /** Error code for incorrect deployer */
    IncorrectDeployer: Number(IncorrectDeployer),
    /** Error code for invalid data */
    InvalidData: Number(InvalidData),
    /** Error code for invalid destination workchain */
    InvalidDestinationWorkchain: Number(InvalidDestinationWorkchain),
};

/** Test related constants */
export const TestValues = {
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
};

/** Dictionary type for NFT deployment data */
type dictDeployNFT = {
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

/**
 * Helper function to load NFT data from a tuple of contract getter results
 * @param source - Array of tuple items containing NFT data
 * @returns Parsed NFT data object
 */
export function loadGetterTupleNFTData(source: TupleItem[]): NFTData {
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
 * Retrieves the owner of the NFT collection.
 * @param collection - The sandbox contract instance of the NFT collection.
 * @returns The address of the collection owner.
 */
export const getOwner = async (
    collection: SandboxContract<NFTCollection>,
): Promise<Address> => {
    const res = await collection.getGetCollectionData();
    return res.owner;
};

/**
 * Retrieves the next item index from the NFT collection.
 * @param collection - The sandbox contract instance of the NFT collection.
 * @returns The next item index to be minted.
 */
export const getNextItemIndex = async (
    collection: SandboxContract<NFTCollection>,
): Promise<bigint> => {
    const res = await collection.getGetCollectionData();
    return res.nextItemIndex;
};

/**
 * Retrieves the owner of a specific NFT item.
 * @param item - The sandbox contract instance of the NFT item.
 * @returns The address of the NFT item's owner.
 */
export const getItemOwner = async (
    item: SandboxContract<NFTItem>,
): Promise<Address> => {
    const res = await item.getGetNftData();
    return res.owner!;
};

/**
 * Sends a transfer transaction for an NFT item.
 * @param itemNFT - The sandbox contract instance of the NFT item to be transferred.
 * @param from - The sender of the transaction.
 * @param value - The value to be sent with the transaction.
 * @param newOwner - The address of the new owner.
 * @param responseDestination - The address where the response should be sent.
 * @param forwardAmount - The amount of TONs to be forwarded to the new owner.
 * @param forwardPayload - The payload to be forwarded to the new owner.
 * @returns The result of the sent message.
 */
export const sendTransfer = async (
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
