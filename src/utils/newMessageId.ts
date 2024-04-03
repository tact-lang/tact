import { beginCell } from "@ton/core";
import { sha256_sync } from "@ton/crypto";

export function newMessageId(signature: string) {
    return beginCell()
        .storeBuffer(sha256_sync(signature))
        .endCell()
        .beginParse()
        .loadUint(32);
}
