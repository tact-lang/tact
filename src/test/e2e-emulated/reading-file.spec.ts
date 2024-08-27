import { __DANGER_resetNodeId } from "../../grammar/ast";
import { ReadingFiles } from "./contracts/output/reading-files_ReadingFiles";
import { beginCell, Slice, toNano } from "@ton/core";
import { readFile } from "node:fs/promises";
import { Blockchain } from "@ton/sandbox";
import { writeBufferRec } from "../../generator/writers/writeConstant";
import "@ton/test-utils";

function readBuffer(slice: Slice) {
    // Check consistency
    if (slice.remainingBits % 8 !== 0) {
        throw new Error(`Invalid string length: ${slice.remainingBits}`);
    }
    if (slice.remainingRefs !== 0 && slice.remainingRefs !== 1) {
        throw new Error(`invalid number of refs: ${slice.remainingRefs}`);
    }

    // Read string
    let res: Buffer;
    if (slice.remainingBits === 0) {
        res = Buffer.alloc(0);
    } else {
        res = slice.loadBuffer(slice.remainingBits / 8);
    }

    // Read tail
    if (slice.remainingRefs === 1) {
        res = Buffer.concat([res, readBuffer(slice.loadRef().beginParse())]);
    }

    return res;
}

describe("file reading", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    it("should read a file", async () => {
        const [pngDataBinary, testDataBinary, blockchain] = await Promise.all([
            readFile(__dirname + "/contracts/reading-files-image.png"),
            readFile(__dirname + "/contracts/reading-files-text.txt"),
            await Blockchain.create(),
        ]);

        const contract = blockchain.openContract(await ReadingFiles.fromInit());
        const treasure = await blockchain.treasury("treasure");
        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(await contract.getIsHex()).toBe(true);
        expect(await contract.getIsUtf8()).toBe(true);
        expect(await contract.getValidateHash()).toBe(true);

        const dataString = await contract.getImage();
        expect(dataString).toBe(pngDataBinary.toString("utf-8"));
        const bufferData = readBuffer(await contract.getImageBlob());
        expect(bufferData.equals(pngDataBinary)).toBeTruthy();

        const { data, binaryCell } = await contract.getInitialData();
        expect(data).toBe(testDataBinary.toString("base64url"));
        //check loaded from file cell
        expect(binaryCell.asSlice().loadStringTail()).toBe("Hello world!");

        //check compile-time comments
        const { transactions } = await contract.send(
            treasure.getSender(),
            { value: toNano("1") },
            "comment",
        );
        const commentCell = beginCell().storeUint(0, 32);
        writeBufferRec(pngDataBinary, commentCell);
        const commentCell2 = commentCell.endCell();
        expect(transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            success: true,
            body: commentCell2,
        });
    });
});
