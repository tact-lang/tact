import { getAllExpressionTypes } from "@/types/resolveExpression";
import { resolveDescriptors } from "@/types/resolveDescriptors";
import { loadCases } from "@/utils/loadCases";
import { openContext } from "@/context/store";
import { resolveStatements } from "@/types/resolveStatements";
import { CompilerContext } from "@/context/context";
import { featureEnable } from "@/config/features";
import { getParser } from "@/grammar";
import { getAstFactory } from "@/ast/ast-helpers";
import { evalComptimeExpressions } from "@/types/evalComptimeExpressions";

describe("resolveStatements", () => {
    for (const r of loadCases(__dirname + "/stmts/")) {
        it("should resolve statements for " + r.name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, Ast);
            ctx = resolveStatements(ctx);
            evalComptimeExpressions(ctx, Ast);
            expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
        });
    }
    for (const r of loadCases(__dirname + "/stmts-failed/")) {
        it("should fail statements for " + r.name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, Ast);
            expect(() => {
                resolveStatements(ctx);
                evalComptimeExpressions(ctx, Ast);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
