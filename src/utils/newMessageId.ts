import { beginCell } from "@ton/core";
import { sha256_sync } from "@ton/crypto";
import { AstNumber } from "../grammar/ast";
import { dummySrcInfo } from "../grammar/grammar";

export function newMessageId(signature: string): AstNumber {
    return {
        kind: "number",
        base: 10,
        value: BigInt(
            beginCell()
                .storeBuffer(sha256_sync(signature))
                .endCell()
                .beginParse()
                .loadUint(32),
        ),
        id: 0,
        loc: dummySrcInfo,
    };
}
