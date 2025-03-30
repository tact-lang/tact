/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Address } from "../address/address";
import type { ExternalAddress } from "../address/external-address";
import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";
import type { Maybe } from "../utils/maybe";
import type { CurrencyCollection } from "./currency-collection";
import {
    loadCurrencyCollection,
    storeCurrencyCollection,
} from "./currency-collection";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L123
// int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
//  src:MsgAddressInt dest:MsgAddressInt
//  value:CurrencyCollection ihr_fee:Grams fwd_fee:Grams
//  created_lt:uint64 created_at:uint32 = CommonMsgInfo;
// ext_in_msg_info$10 src:MsgAddressExt dest:MsgAddressInt
//  import_fee:Grams = CommonMsgInfo;
// ext_out_msg_info$11 src:MsgAddressInt dest:MsgAddressExt
//  created_lt:uint64 created_at:uint32 = CommonMsgInfo;

export type CommonMessageInfo =
    | CommonMessageInfoInternal
    | CommonMessageInfoExternalOut
    | CommonMessageInfoExternalIn;

export type CommonMessageInfoInternal = {
    type: "internal";
    ihrDisabled: boolean;
    bounce: boolean;
    bounced: boolean;
    src: Address;
    dest: Address;
    value: CurrencyCollection;
    ihrFee: bigint;
    forwardFee: bigint;
    createdLt: bigint;
    createdAt: number;
};

export type CommonMessageInfoExternalIn = {
    type: "external-in";
    src?: Maybe<ExternalAddress>;
    dest: Address;
    importFee: bigint;
};

export type CommonMessageInfoExternalOut = {
    type: "external-out";
    src: Address;
    dest?: Maybe<ExternalAddress>;
    createdLt: bigint;
    createdAt: number;
};

export function loadCommonMessageInfo(slice: Slice): CommonMessageInfo {
    // Internal message
    if (!slice.loadBit()) {
        const ihrDisabled = slice.loadBit();
        const bounce = slice.loadBit();
        const bounced = slice.loadBit();
        const src = slice.loadAddress();
        const dest = slice.loadAddress();
        const value = loadCurrencyCollection(slice);
        const ihrFee = slice.loadCoins();
        const forwardFee = slice.loadCoins();
        const createdLt = slice.loadUintBig(64);
        const createdAt = slice.loadUint(32);

        return {
            type: "internal",
            ihrDisabled,
            bounce,
            bounced,
            src,
            dest,
            value,
            ihrFee,
            forwardFee,
            createdLt,
            createdAt,
        };
    }

    // External In mesage
    if (!slice.loadBit()) {
        const src = slice.loadMaybeExternalAddress();
        const dest = slice.loadAddress()!;
        const importFee = slice.loadCoins();

        return {
            type: "external-in",
            src,
            dest,
            importFee,
        };
    }

    // External Out message
    const src = slice.loadAddress()!;
    const dest = slice.loadMaybeExternalAddress();
    const createdLt = slice.loadUintBig(64);
    const createdAt = slice.loadUint(32);

    return {
        type: "external-out",
        src,
        dest,
        createdLt,
        createdAt,
    };
}

export function storeCommonMessageInfo(source: CommonMessageInfo) {
    return (builder: Builder) => {
        if (source.type === "internal") {
            builder.storeBit(0);
            builder.storeBit(source.ihrDisabled);
            builder.storeBit(source.bounce);
            builder.storeBit(source.bounced);
            builder.storeAddress(source.src);
            builder.storeAddress(source.dest);
            builder.store(storeCurrencyCollection(source.value));
            builder.storeCoins(source.ihrFee);
            builder.storeCoins(source.forwardFee);
            builder.storeUint(source.createdLt, 64);
            builder.storeUint(source.createdAt, 32);
        } else if (source.type === "external-in") {
            builder.storeBit(1);
            builder.storeBit(0);
            builder.storeAddress(source.src);
            builder.storeAddress(source.dest);
            builder.storeCoins(source.importFee);
        } else if (source.type === "external-out") {
            builder.storeBit(1);
            builder.storeBit(1);
            builder.storeAddress(source.src);
            builder.storeAddress(source.dest);
            builder.storeUint(source.createdLt, 64);
            builder.storeUint(source.createdAt, 32);
        } else {
            throw new Error("Unknown CommonMessageInfo type");
        }
    };
}
