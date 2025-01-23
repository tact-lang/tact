import path from "path";
import { getAstFactory } from "../../ast/ast-helpers";
import { featureEnable } from "../../config/features";
import { CompilerContext } from "../../context/context";
import { openContext } from "../../context/store";
import { getParser } from "../../grammar";
import { defaultParser } from "../../grammar/grammar";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { getAllExpressionTypes } from "../../types/resolveExpression";
import { resolveStatements } from "../../types/resolveStatements";
import { loadCases } from "../../utils/loadCases";
import { simplifyAllExpressions } from "../expr-simplification";
import { prepareAstForOptimization } from "../optimization-phase";

describe("expression-simplification", () => {
    for (const r of loadCases(path.join(__dirname, "success/"))) {
        it("should pass expression simplification for " + r.name, () => {
            const ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(ast, defaultParser),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, ast);
            ctx = resolveStatements(ctx, ast);
            const optCtx = prepareAstForOptimization(ctx, ast, true);
            simplifyAllExpressions(optCtx);
            expect(getAllExpressionTypes(optCtx.ctx)).toMatchSnapshot();
        });
    }
    for (const r of loadCases(path.join(__dirname, "failed/"))) {
        it("should fail expression simplification for " + r.name, () => {
            const ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(ast, defaultParser),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, ast);
            ctx = resolveStatements(ctx, ast);
            const optCtx = prepareAstForOptimization(ctx, ast, true);
            expect(() => {
                simplifyAllExpressions(optCtx);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
