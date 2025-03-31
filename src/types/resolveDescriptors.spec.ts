import { CompilerContext } from "@/context/context";
import {
    getAllStaticFunctions,
    getAllTypes,
    resolveDescriptors,
} from "@/types/resolveDescriptors";
import { resolveSignatures } from "@/types/resolveSignatures";
import { loadCases } from "@/utils/loadCases";
import { openContext, parseModules } from "@/context/store";
import { featureEnable } from "@/config/features";
import type { SrcInfo } from "@/grammar";
import { getParser } from "@/grammar";
import { getAstFactory } from "@/ast/ast-helpers";
import { isSrcInfo } from "@/grammar/src-info";
import { resolveStatements } from "@/types/resolveStatements";
import { evalComptimeExpressions } from "@/types/evalComptimeExpressions";
import type { Source } from "@/imports/source";

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("resolveDescriptors", () => {
    for (const r of loadCases(__dirname + "/test/")) {
        it("should resolve descriptors for " + r.name, () => {
            const Ast = getAstFactory();
            const sources: Source[] = [
                { code: r.code, path: "<unknown>", origin: "user" },
            ];
            let ctx = openContext(
                new CompilerContext(),
                sources,
                [],
                parseModules(sources, getParser(Ast)),
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
            const sources: Source[] = [
                { code: r.code, path: "<unknown>", origin: "user" },
            ];
            let ctx = openContext(
                new CompilerContext(),
                sources,
                [],
                parseModules(sources, getParser(Ast)),
            );
            ctx = featureEnable(ctx, "external");
            expect(() => {
                ctx = resolveDescriptors(ctx, Ast);
                // These following two lines are required for the test "const-eval-overflow"
                // which must throw an integer overflow in a shift operator
                ctx = resolveStatements(ctx);
                evalComptimeExpressions(ctx, Ast);
                ctx = resolveSignatures(ctx, Ast);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
