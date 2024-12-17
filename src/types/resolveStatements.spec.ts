import { getAllExpressionTypes } from "./resolveExpression";
import { resolveDescriptors } from "./resolveDescriptors";
import { loadCases } from "../utils/loadCases";
import { openContext } from "../grammar/store";
import { resolveStatements } from "./resolveStatements";
import { CompilerContext } from "../context";
import { featureEnable } from "../config/features";
import { getParser } from "../grammar";
import { getAstSchema } from "../grammar/ast";

describe("resolveStatements", () => {
    for (const r of loadCases(__dirname + "/stmts/")) {
        it("should resolve statements for " + r.name, () => {
            const Ast = getAstSchema();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, Ast);
            ctx = resolveStatements(ctx);
            expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
        });
    }
    for (const r of loadCases(__dirname + "/stmts-failed/")) {
        it("should fail statements for " + r.name, () => {
            const Ast = getAstSchema();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, Ast);
            expect(() => resolveStatements(ctx)).toThrowErrorMatchingSnapshot();
        });
    }
});
