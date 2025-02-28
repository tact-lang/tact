import { crc16 } from "./crc16";

describe("crc16", () => {
    it("crc16 is correctly calculated from the string", () => {
        expect(crc16("")).toBe(0);
        expect(crc16("Hello Tact")).toBe(11154);
        expect(crc16("Привет Tact")).toBe(36467);
        expect(crc16("👋 Tact")).toBe(17840);
        expect(crc16("\u0000")).toBe(0);
        expect(crc16("⚡")).toBe(40122);

        expect((crc16("get_wallet_data") & 0xffff) | 0x10000).toBe(97026);
        expect((crc16("get_jetton_data") & 0xffff) | 0x10000).toBe(106029);
        expect((crc16("get_wallet_address") & 0xffff) | 0x10000).toBe(103289);
    });
});
