import { CompilerContext } from "../context/context";
import {
    getAllStaticFunctions,
    getAllTypes,
    resolveDescriptors,
} from "./resolveDescriptors";
import { resolveSignatures } from "./resolveSignatures";
import { loadCases } from "../utils/loadCases";
import { openContext } from "../grammar/store";
import { featureEnable } from "../config/features";
import { getParser, SrcInfo } from "../grammar";
import { getAstFactory } from "../grammar/ast";
import { isSrcInfo } from "../grammar/src-info";
import { defaultParser } from "../grammar/grammar";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("resolveDescriptors", () => {
    for (const r of loadCases(__dirname + "/test/")) {
        it("should resolve descriptors for " + r.name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
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
    for (const r of loadCases(__dirname + "/test-failed/")) {
        it("should fail descriptors for " + r.name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
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
