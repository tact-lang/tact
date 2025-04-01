import { crc16 } from "@/sandbox/utils/crc16";

describe("crc16", () => {
    // eslint-disable-next-line @typescript-eslint/require-await
    it("should hash correctly", async () => {
        expect(crc16("get_seq")).toEqual(38947);
    });
});
