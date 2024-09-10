import { getAllExpressionTypes } from "./resolveExpression";
import { resolveDescriptors } from "./resolveDescriptors";
import { loadCases } from "../utils/loadCases";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { openContext } from "../grammar/store";
import { resolveStatements } from "./resolveStatements";
import { CompilerContext } from "../context";
import { featureEnable } from "../config/features";

describe("resolveStatements", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (const r of loadCases(__dirname + "/stmts/")) {
        it("should resolve statements for " + r.name, () => {
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx);
            ctx = resolveStatements(ctx);
            expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
        });
    }
    for (const r of loadCases(__dirname + "/stmts-failed/")) {
        it("should fail statements for " + r.name, () => {
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx);
            expect(() => resolveStatements(ctx)).toThrowErrorMatchingSnapshot();
        });
    }
});
