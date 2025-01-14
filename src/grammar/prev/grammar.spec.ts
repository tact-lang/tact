import { getAstFactory } from "../../ast/ast";
import { getParser } from "../grammar";
import { SrcInfo, isSrcInfo } from "../src-info";
import { negativeCases } from "../test-failed/cases.build";
import { positiveCases } from "../test/cases.build";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("grammar", () => {
    for (const r of positiveCases) {
        it("should parse " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast, "old");
            expect(parse(r.code, "<unknown>", "user")).toMatchSnapshot();
        });
    }

    for (const r of negativeCases) {
        it("should fail " + r.name, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast, "old");
            expect(() =>
                parse(r.code, "<unknown>", "user"),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
