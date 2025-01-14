import { CompilerContext } from "../context/context";
import {
    getAllStaticFunctions,
    getAllTypes,
    resolveDescriptors,
} from "./resolveDescriptors";
import { resolveSignatures } from "./resolveSignatures";
import { openContext } from "../context/store";
import { featureEnable } from "../config/features";
import { getParser, SrcInfo } from "../grammar";
import { getAstFactory } from "../ast/ast";
import { isSrcInfo } from "../grammar/src-info";
import { defaultParser } from "../grammar/grammar";
import { positiveCases } from "./test/cases.build";
import { negativeCases } from "./test-failed/cases.build";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("resolveDescriptors", () => {
    for (const { code, name } of positiveCases) {
        it("should resolve descriptors for " + name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast, defaultParser),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, Ast);
            ctx = resolveSignatures(ctx, Ast);
            expect(getAllTypes(ctx)).toMatchSnapshot();
            expect(getAllStaticFunctions(ctx)).toMatchSnapshot();
        });
    }
    for (const { code, name } of negativeCases) {
        it("should fail descriptors for " + name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast, defaultParser),
            );
            ctx = featureEnable(ctx, "external");
            expect(() => {
                ctx = resolveDescriptors(ctx, Ast);
                ctx = resolveSignatures(ctx, Ast);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
