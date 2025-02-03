import { getAstFactory } from "../../ast/ast-helpers";
import { loadCases } from "../../utils/loadCases";
import { getParser } from "../grammar";
import { SrcInfo, isSrcInfo } from "../src-info";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("grammar", () => {
    for (const r of loadCases(__dirname + "/../test/")) {
        it("should parse " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast, "old");
            expect(
                parse({ code: r.code, path: "<unknown>", origin: "user" }),
            ).toMatchSnapshot();
        });
    }

    for (const r of loadCases(__dirname + "/../test-failed/")) {
        it("should fail " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast, "old");
            expect(() =>
                parse({ code: r.code, path: "<unknown>", origin: "user" }),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
