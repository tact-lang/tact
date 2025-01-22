import { getAstFactory } from "../../ast/ast-helpers";
import { loadCases } from "../../utils/loadCases";
import { getParser } from "../grammar";
import { SrcInfo, isSrcInfo } from "../src-info";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("grammar", () => {
    const shouldParsePaths = [__dirname + "/../test/", __dirname + "/test/"];

    for (const path of shouldParsePaths) {
        for (const r of loadCases(path)) {
            it("should parse " + r.name, () => {
                const ast = getAstFactory();
                const { parse } = getParser(ast, "new");
                expect(parse(r.code, "<unknown>", "user")).toMatchSnapshot();
            });
        }
    }

    for (const r of loadCases(__dirname + "/../test-failed/")) {
        it("should fail " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast, "new");
            expect(() =>
                parse(r.code, "<unknown>", "user"),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
