import { isBlank, trimIndent } from "./text";
describe("text", () => {
    it("should detect blank lines", () => {
        expect(isBlank("")).toBe(true);
        expect(isBlank(" ")).toBe(true);
        expect(isBlank("\t")).toBe(true);
        expect(isBlank("a")).toBe(false);
    });
    it("should trim indent", () => {
        const res = trimIndent(`
            hello world
            123123 123123
               12312312
            12312312
        `);
        expect(res).toBe(`hello world\n123123 123123\n   12312312\n12312312`);
    });
});
