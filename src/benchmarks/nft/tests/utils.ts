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
import { loadInitNFTBody } from "@/benchmarks/nft/tact/output/collection_NFTCollection";

// NFT Item imports
import type { NFTData } from "@/benchmarks/nft/tact/output/item_NFTItem";
import {
    storeInitNFTBody,
    type NFTItem,
} from "@/benchmarks/nft/tact/output/item_NFTItem";

import "@ton/test-utils";

/** Operation codes for NFT contract messages */
export const Operations = {
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
} as const;

/** Error codes */
export const ErrorCodes = {
    /** Error code for not initialized contract */
    NotInit: 9,
    /** Error code for not owner */
    NotOwner: 401,
    /** Error code for invalid fees */
    InvalidFees: 402,
    /** Error code for incorrect index */
    IncorrectIndex: 402,
    /** Error code for incorrect deployer */
    IncorrectDeployer: 401,
    /** Error code for invalid data */
    InvalidData: 65535,
    /** Error code for invalid destination workchain */
    InvalidDestinationWorkchain: 333,
} as const;

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
} as const;

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

export const getOwner = async (
    collection: SandboxContract<NFTCollection>,
): Promise<Address> => {
    const res = await collection.getGetCollectionData();
    return res.owner;
};

export const getNextItemIndex = async (
    collection: SandboxContract<NFTCollection>,
): Promise<bigint> => {
    const res = await collection.getGetCollectionData();
    return res.nextItemIndex;
};

export const getItemOwner = async (
    item: SandboxContract<NFTItem>,
): Promise<Address> => {
    const res = await item.getGetNftData();
    return res.owner!;
};

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
