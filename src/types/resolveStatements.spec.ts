import { getAllExpressionTypes } from "./resolveExpression";
import { resolveDescriptors } from "./resolveDescriptors";
import { openContext } from "../context/store";
import { resolveStatements } from "./resolveStatements";
import { CompilerContext } from "../context/context";
import { featureEnable } from "../config/features";
import { getParser } from "../grammar";
import { getAstFactory } from "../ast/ast";
import { defaultParser } from "../grammar/grammar";
import { positiveCases } from "./stmts/cases.build";
import { negativeCases } from "./stmts-failed/cases.build";

describe("resolveStatements", () => {
    for (const { code, name } of positiveCases) {
        it("should resolve statements for " + name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast, defaultParser),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, Ast);
            ctx = resolveStatements(ctx, Ast);
            expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
        });
    }
    for (const { code, name } of negativeCases) {
        it("should fail statements for " + name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast, defaultParser),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, Ast);
            expect(() =>
                resolveStatements(ctx, Ast),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
