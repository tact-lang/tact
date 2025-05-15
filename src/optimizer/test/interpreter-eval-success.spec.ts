import { getAstFactory } from "@/ast/ast-helpers";
import { CompilerContext } from "@/context/context";
import { openContext, parseModules } from "@/context/store";
import { getParser } from "@/grammar";
import type { Source } from "@/imports/source";
import { evalComptimeExpressions } from "@/types/evalComptimeExpressions";
import { resolveDescriptors } from "@/types/resolveDescriptors";
import { getAllExpressionTypes } from "@/types/resolveExpression";
import { resolveSignatures } from "@/types/resolveSignatures";
import { resolveStatements } from "@/types/resolveStatements";
import { loadCases } from "@/utils/loadCases";
import { step, attachment } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

describe("interpreter-evaluation", () => {
    for (const r of loadCases(__dirname + "/success/")) {
        it(`${r.name} should pass compilation`, async () => {
            const Ast = getAstFactory();
            const sources: Source[] = [
                { code: r.code, path: "<unknown>", origin: "user" },
            ];
            await attachment("Code", r.code, ContentType.TEXT);
            let ctx = openContext(
                new CompilerContext(),
                sources,
                [],
                parseModules(sources, getParser(Ast)),
            );
            ctx = resolveDescriptors(ctx, Ast);
            ctx = resolveStatements(ctx);
            ctx = resolveSignatures(ctx, Ast);
            evalComptimeExpressions(ctx, Ast);
            await step("Expression types should match snapshot", () => {
                expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
            });
        });
    }
});
