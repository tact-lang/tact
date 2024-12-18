import { AstModule, getAstFactory } from "./ast";
import { loadCases } from "../utils/loadCases";
import { getParser } from "./grammar";
import { SrcInfo, isSrcInfo } from "./src-info";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("grammar", () => {
    // Test parsing of known Fift projects, wrapped in asm functions of Tact
    for (const r of loadCases(__dirname + "/test-asm/")) {
        it("should parse " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast);
            const parsed: AstModule | undefined = parse(
                r.code,
                "<unknown>",
                "user",
            );

            // Don't produce snapshots
            expect(parsed).toBeDefined();
        });
    }

    for (const r of loadCases(__dirname + "/test/")) {
        it("should parse " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast);
            expect(parse(r.code, "<unknown>", "user")).toMatchSnapshot();
        });
    }

    for (const r of loadCases(__dirname + "/test-failed/")) {
        it("should fail " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast);
            expect(() =>
                parse(r.code, "<unknown>", "user"),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
