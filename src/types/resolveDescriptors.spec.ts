import { CompilerContext } from "../context";
import {
    getAllStaticFunctions,
    getAllTypes,
    resolveDescriptors,
} from "./resolveDescriptors";
import { resolveSignatures } from "./resolveSignatures";
import { loadCases } from "../utils/loadCases";
import { openContext } from "../grammar/store";
import { featureEnable } from "../config/features";
import { getParser, SrcInfo } from "../grammar/prev";
import { getAstSchema } from "../grammar/ast";

expect.addSnapshotSerializer({
    test: (src) => src instanceof SrcInfo,
    print: (src) => (src as SrcInfo).contents,
});

describe("resolveDescriptors", () => {
    for (const r of loadCases(__dirname + "/test/")) {
        it("should resolve descriptors for " + r.name, () => {
            const Ast = getAstSchema();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast),
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
            const Ast = getAstSchema();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast),
            );
            ctx = featureEnable(ctx, "external");
            expect(() => {
                ctx = resolveDescriptors(ctx, Ast);
                ctx = resolveSignatures(ctx);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
