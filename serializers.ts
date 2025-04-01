import { Address, Cell } from "@ton/core";

export const serializer = {
    test(src: unknown) {
        if (Buffer.isBuffer(src)) {
            return true;
        }
        if (src instanceof Cell) {
            return true;
        }
        if (Address.isAddress(src)) {
            return true;
        }
        return false;
    },

    print(src: unknown) {
        if (Buffer.isBuffer(src)) {
            return "Buffer{" + src.toString("hex") + "}";
        }
        if (src instanceof Cell) {
            return src.toString();
        }
        if (Address.isAddress(src)) {
            return src.toString({ testOnly: true });
        }
        throw new Error("Unknown type");
    },
};

export default serializer;
