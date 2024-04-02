import { beginCell } from "@ton/core";

export function idToHex(id: number) {
    return beginCell()
        .storeUint(id, 32)
        .endCell()
        .beginParse()
        .loadBuffer(4)
        .toString("hex");
}
