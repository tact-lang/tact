import { getAllExpressionTypes } from "@/types/resolveExpression";
import { resolveDescriptors } from "@/types/resolveDescriptors";
import { loadCases } from "@/utils/loadCases";
import { openContext, parseModules } from "@/context/store";
import { resolveStatements } from "@/types/resolveStatements";
import { CompilerContext } from "@/context/context";
import { featureEnable } from "@/config/features";
import { getParser } from "@/grammar";
import { getAstFactory } from "@/ast/ast-helpers";
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
    ctx = resolveDescriptors(ctx, Ast);
    return { ctx, Ast };
}

describe("resolveStatements", () => {
    for (const r of loadCases(__dirname + "/stmts/")) {
        it("should resolve statements for " + r.name, () => {
            const { ctx, Ast } = setup(r);
            const resolvedCtx = resolveStatements(ctx);
            evalComptimeExpressions(resolvedCtx, Ast);
            expect(getAllExpressionTypes(resolvedCtx)).toMatchSnapshot();
        });
    }
    for (const r of loadCases(__dirname + "/stmts-failed/")) {
        it("should fail statements for " + r.name, () => {
            const { ctx, Ast } = setup(r);
            expect(() => {
                resolveStatements(ctx);
                evalComptimeExpressions(ctx, Ast);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
