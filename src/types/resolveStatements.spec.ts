import { getAllExpressionTypes } from "./resolveExpression";
import { resolveDescriptors } from "./resolveDescriptors";
import { loadCases } from "../utils/loadCases";
import { openContext } from "../context/store";
import { resolveStatements } from "./resolveStatements";
import { CompilerContext } from "../context/context";
import { featureEnable } from "../config/features";
import { getParser } from "../grammar";
import { getAstFactory } from "../ast/ast-helpers";
import { defaultParser } from "../grammar/grammar";
import { evalComptimeExpressions } from "./evalInitializers";

describe("resolveStatements", () => {
    for (const r of loadCases(__dirname + "/stmts/")) {
        it("should resolve statements for " + r.name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast, defaultParser),
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
                getParser(Ast, defaultParser),
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
