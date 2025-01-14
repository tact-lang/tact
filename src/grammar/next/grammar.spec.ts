import { getAstFactory } from "../../ast/ast";
import { getParser } from "../grammar";
import { SrcInfo, isSrcInfo } from "../src-info";
import { positiveCases } from "../test/cases.build";
import { negativeCases } from "../test-failed/cases.build";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("grammar", () => {
    for (const { code, name } of positiveCases) {
        it(`should parse ${name}`, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast, "new");
            expect(parse(code, "<unknown>", "user")).toMatchSnapshot();
        });
    }

    for (const { code, name } of negativeCases) {
        it(`should fail ${name}`, () => {
            const ast = getAstFactory();
            const { parse } = getParser(ast, "new");
            expect(() =>
                parse(code, "<unknown>", "user"),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
