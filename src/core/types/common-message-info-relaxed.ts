/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Address } from "@/core/address/address";
import type { ExternalAddress } from "@/core/address/external-address";
import type { Builder } from "@/core/boc/builder";
import type { Slice } from "@/core/boc/slice";
import type { Maybe } from "@/core/utils/maybe";
import type { CurrencyCollection } from "@/core/types/currency-collection";
import {
    loadCurrencyCollection,
    storeCurrencyCollection,
} from "@/core/types/currency-collection";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L132
// int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
//   src:MsgAddress dest:MsgAddressInt
//   value:CurrencyCollection ihr_fee:Grams fwd_fee:Grams
//   created_lt:uint64 created_at:uint32 = CommonMsgInfoRelaxed;
// ext_out_msg_info$11 src:MsgAddress dest:MsgAddressExt
//   created_lt:uint64 created_at:uint32 = CommonMsgInfoRelaxed;

export type CommonMessageInfoRelaxed =
    | CommonMessageInfoRelaxedInternal
    | CommonMessageInfoRelaxedExternalOut;

export type CommonMessageInfoRelaxedInternal = {
    type: "internal";
    ihrDisabled: boolean;
    bounce: boolean;
    bounced: boolean;
    src?: Maybe<Address>;
    dest: Address;
    value: CurrencyCollection;
    ihrFee: bigint;
    forwardFee: bigint;
    createdLt: bigint;
    createdAt: number;
};

export type CommonMessageInfoRelaxedExternalOut = {
    type: "external-out";
    src?: Maybe<Address>;
    dest?: Maybe<ExternalAddress>;
    createdLt: bigint;
    createdAt: number;
};

export function loadCommonMessageInfoRelaxed(
    slice: Slice,
): CommonMessageInfoRelaxed {
    // Internal message
    if (!slice.loadBit()) {
        const ihrDisabled = slice.loadBit();
        const bounce = slice.loadBit();
        const bounced = slice.loadBit();
        const src = slice.loadMaybeAddress();
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

    // External In message
    if (!slice.loadBit()) {
        throw Error(
            "External In message is not possible for CommonMessageInfoRelaxed",
        );
    }

    // External Out message
    const src = slice.loadMaybeAddress()!;
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

export function storeCommonMessageInfoRelaxed(
    source: CommonMessageInfoRelaxed,
) {
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
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
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
