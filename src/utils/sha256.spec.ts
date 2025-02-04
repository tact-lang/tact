import { sha256, sha256LoadUint32BE } from "./sha256";
import { beginCell } from "@ton/core";

describe("sha256", () => {
    it("should be equal to Buffer.readUInt32BE", () => {
        const res = sha256("hello world");

        expect(sha256LoadUint32BE(res)).toBe(BigInt(res.buffer.readUInt32BE()));
    });

    it("should be equal to storeBuffer().loadUint", () => {
        const res = sha256("hello world");

        expect(sha256LoadUint32BE(res)).toBe(
            BigInt(
                beginCell()
                    .storeBuffer(res.buffer)
                    .endCell()
                    .beginParse()
                    .loadUint(32),
            ),
        );
    });
});
