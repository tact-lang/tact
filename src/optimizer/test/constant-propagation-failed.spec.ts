import { getAstFactory } from "../../ast/ast-helpers";
import { CompilerContext } from "../../context/context";
import { openContext } from "../../context/store";
import { getParser } from "../../grammar";
import { defaultParser } from "../../grammar/grammar";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { resolveSignatures } from "../../types/resolveSignatures";
import { resolveStatements } from "../../types/resolveStatements";
import { loadCases } from "../../utils/loadCases";
import { constantPropagationAnalysis } from "../deprecated/constant-propagation";

describe("constant-propagation", () => {
    for (const r of loadCases(__dirname + "/failed/constant-propagation/")) {
        it("should fail constant propagation analysis for " + r.name, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast, defaultParser),
            );
            ctx = resolveDescriptors(ctx, Ast);
            ctx = resolveStatements(ctx, Ast);
            ctx = resolveSignatures(ctx, Ast);
            expect(() => {
                constantPropagationAnalysis(ctx, Ast);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
