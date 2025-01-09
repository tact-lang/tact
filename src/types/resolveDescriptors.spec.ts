import { CompilerContext } from "../010-pipeline/context";
import {
    getAllStaticFunctions,
    getAllTypes,
    resolveDescriptors,
} from "./resolveDescriptors";
import { resolveSignatures } from "./resolveSignatures";
import { loadCases } from "../utils/loadCases";
import { openContext } from "../050-grammar/store";
import { featureEnable } from "../000-config/features";
import { getParser, SrcInfo } from "../050-grammar";
import { getAstFactory } from "../050-grammar/ast";
import { isSrcInfo } from "../050-grammar/src-info";
import { defaultParser } from "../050-grammar/grammar";

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
            ctx = resolveSignatures(ctx);
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
                ctx = resolveSignatures(ctx);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
