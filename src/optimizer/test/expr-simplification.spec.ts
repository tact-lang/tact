import { featureEnable } from "../../config/features";
import { CompilerContext } from "../../context";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { openContext } from "../../grammar/store";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { getAllExpressionTypes } from "../../types/resolveExpression";
import { resolveStatements } from "../../types/resolveStatements";
import { loadCases } from "../../utils/loadCases";
import { simplifyAllExpressions } from "../expr-simplification";
import { prepareAstForOptimization } from "../optimization-phase";

describe("expression-simplification", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (const r of loadCases(__dirname + "/success/")) {
        it("should pass expression simplification for " + r.name, () => {
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx);
            ctx = resolveStatements(ctx);
            const optCtx = prepareAstForOptimization(ctx, true);
            simplifyAllExpressions(optCtx);
            expect(getAllExpressionTypes(optCtx.ctx)).toMatchSnapshot();
        });
    }
    for (const r of loadCases(__dirname + "/failed/")) {
        it("should fail expression simplification for " + r.name, () => {
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx);
            ctx = resolveStatements(ctx);
            const optCtx = prepareAstForOptimization(ctx, true);
            expect(() => {
                simplifyAllExpressions(optCtx);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
