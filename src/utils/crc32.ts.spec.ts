import { crc32 } from "./crc32";

describe("crc32", () => {
    it("crc32 is correctly calculated from the string", () => {
        expect(crc32("")).toBe(0);
        expect(crc32("Hello Tact")).toBe(-1612685692);
        expect(crc32("Привет Tact")).toBe(-1470995533);
        expect(crc32("👋 Tact")).toBe(1855222621);
        expect(crc32("\u0000")).toBe(-771559539);
        expect(crc32("⚡")).toBe(2136484914);
    });
});
