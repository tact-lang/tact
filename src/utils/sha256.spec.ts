import { sha256, highest32ofSha256 } from "./sha256";
import { beginCell } from "@ton/core";

describe("sha256", () => {
    const bigintToBuffer = (value: bigint): Buffer => {
        const hex = value.toString(16);
        const paddedHex = hex.length % 2 === 0 ? hex : "0" + hex;
        return Buffer.from(paddedHex, "hex");
    };

    it("should be equal to Buffer.readUInt32BE", () => {
        const res = sha256("hello world");
        const buffer = bigintToBuffer(res.value);

        expect(highest32ofSha256(res)).toBe(BigInt(buffer.readUInt32BE()));
    });

    it("should be equal to storeBuffer().loadUint", () => {
        const res = sha256("hello world");
        const buffer = bigintToBuffer(res.value);

        expect(highest32ofSha256(res)).toBe(
            BigInt(
                beginCell()
                    .storeBuffer(buffer)
                    .endCell()
                    .beginParse()
                    .loadUint(32),
            ),
        );
    });
});
