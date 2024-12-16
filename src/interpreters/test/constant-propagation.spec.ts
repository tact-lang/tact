import { featureEnable } from "../../config/features";
import { CompilerContext } from "../../context";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { openContext } from "../../grammar/store";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { getAllExpressionTypes } from "../../types/resolveExpression";
import { resolveStatements } from "../../types/resolveStatements";
import { loadCases } from "../../utils/loadCases";
import { ConstantPropagationAnalyzer } from "../constantPropagation";

describe("constant-propagation", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (const r of loadCases(__dirname + "/success/")) {
        it("should pass constant propagation analysis for " + r.name, () => {
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx);
            ctx = resolveStatements(ctx);
            new ConstantPropagationAnalyzer(ctx).startAnalysis();
            expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
        });
    }
    for (const r of loadCases(__dirname + "/failed/")) {
        it("should fail constant propagation analysis for " + r.name, () => {
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx);
            ctx = resolveStatements(ctx);
            expect(() => {
                new ConstantPropagationAnalyzer(ctx).startAnalysis();
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
