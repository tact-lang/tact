import { parseImportPath } from "./parseImportPath";

describe("parseImportPath", () => {
    it("should reject non-relative imports", () => {
        const res = parseImportPath("some_name");
        expect(res).toBeNull();
    });
    it("should reject non-file imports", () => {
        const res = parseImportPath("./some_name/");
        expect(res).toBeNull();
    });
    it("should parse single imports", () => {
        const res = parseImportPath("./import");
        expect(res).toMatchObject(["import"]);
    });
    it("should parse multiple imports", () => {
        const res = parseImportPath("./import/second");
        expect(res).toMatchObject(["import", "second"]);
    });
});
