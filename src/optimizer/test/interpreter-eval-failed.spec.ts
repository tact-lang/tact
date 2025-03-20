import { getAstFactory } from "../../ast/ast-helpers";
import { CompilerContext } from "../../context/context";
import { openContext, parseModules } from "../../context/store";
import { getParser } from "../../grammar";
import type { Source } from "../../imports/source";
import { evalComptimeExpressions } from "../../types/evalComptimeExpressions";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { resolveSignatures } from "../../types/resolveSignatures";
import { resolveStatements } from "../../types/resolveStatements";
import { loadCases } from "../../utils/loadCases";

describe("interpreter-evaluation", () => {
    for (const r of loadCases(__dirname + "/failed/")) {
        it(`${r.name} should fail compilation`, () => {
            const Ast = getAstFactory();
            const sources: Source[] = [
                { code: r.code, path: "<unknown>", origin: "user" },
            ];
            let ctx = openContext(
                new CompilerContext(),
                sources,
                [],
                parseModules(sources, getParser(Ast)),
            );
            expect(() => {
                ctx = resolveDescriptors(ctx, Ast);
                ctx = resolveStatements(ctx);
                ctx = resolveSignatures(ctx, Ast);
                evalComptimeExpressions(ctx, Ast);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
