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
import { attachment } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

function setup(r: { code: string }) {
    const Ast = getAstFactory();
    attachment("Code", r.code, ContentType.TEXT);
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
    return { ctx, Ast };
}

expect.addSnapshotSerializer({
    test: (src) => isSrcInfo(src),
    print: (src) => (src as SrcInfo).contents,
});

describe("resolveDescriptors", () => {
    for (const r of loadCases(__dirname + "/test/")) {
        it("should resolve descriptors for " + r.name, () => {
            const { ctx, Ast } = setup(r);
            const resolvedCtx = resolveDescriptors(ctx, Ast);
            const finalCtx = resolveSignatures(resolvedCtx, Ast);
            expect(getAllTypes(finalCtx)).toMatchSnapshot();
            expect(getAllStaticFunctions(finalCtx)).toMatchSnapshot();
        });
    }
    for (const r of loadCases(__dirname + "/test-failed/")) {
        it("should fail descriptors for " + r.name, () => {
            const { ctx, Ast } = setup(r);
            expect(() => {
                let c = resolveDescriptors(ctx, Ast);
                c = resolveStatements(c);
                evalComptimeExpressions(c, Ast);
                resolveSignatures(c, Ast);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
