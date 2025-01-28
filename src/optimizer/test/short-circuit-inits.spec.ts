import { getAstFactory } from "../../ast/ast-helpers";
import { featureEnable } from "../../config/features";
import { CompilerContext } from "../../context/context";
import { openContext } from "../../context/store";
import { getParser } from "../../grammar";
import { defaultParser } from "../../grammar/grammar";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { getAllExpressionTypes } from "../../types/resolveExpression";
import { resolveSignatures } from "../../types/resolveSignatures";
import { resolveStatements } from "../../types/resolveStatements";
import { loadCases } from "../../utils/loadCases";

describe("constant-propagation", () => {
    for (const r of loadCases(__dirname + "/short-circuit/success/")) {
        it(
            r.name +
                " should pass boolean short-circuiting during initialization",
            () => {
                const Ast = getAstFactory();
                let ctx = openContext(
                    new CompilerContext(),
                    [{ code: r.code, path: "<unknown>", origin: "user" }],
                    [],
                    getParser(Ast, defaultParser),
                );
                ctx = featureEnable(ctx, "external");
                ctx = resolveDescriptors(ctx, Ast);
                ctx = resolveStatements(ctx, Ast);
                ctx = resolveSignatures(ctx, Ast);
                expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
            },
        );
    }
    for (const r of loadCases(__dirname + "/short-circuit/failed/")) {
        it(
            r.name +
                " should fail boolean short-circuiting during initialization",
            () => {
                const Ast = getAstFactory();
                let ctx = openContext(
                    new CompilerContext(),
                    [{ code: r.code, path: "<unknown>", origin: "user" }],
                    [],
                    getParser(Ast, defaultParser),
                );
                ctx = featureEnable(ctx, "external");
                expect(() => {
                    ctx = resolveDescriptors(ctx, Ast);
                    ctx = resolveStatements(ctx, Ast);
                    ctx = resolveSignatures(ctx, Ast);
                }).toThrowErrorMatchingSnapshot();
            },
        );
    }
});
