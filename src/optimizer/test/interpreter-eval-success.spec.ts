import { getAstFactory } from "../../ast/ast-helpers";
import { CompilerContext } from "../../context/context";
import { openContext } from "../../context/store";
import { getParser } from "../../grammar";
import { defaultParser } from "../../grammar/grammar";
import { evalComptimeExpressions } from "../../types/evalInitializers";
import {
    getAllTypes,
    resolveDescriptors,
} from "../../types/resolveDescriptors";
import { resolveSignatures } from "../../types/resolveSignatures";
import { resolveStatements } from "../../types/resolveStatements";
import { loadCases } from "../../utils/loadCases";

describe("interpreter-evaluation", () => {
    for (const r of loadCases(__dirname + "/success/")) {
        it(`${r.name} should pass compilation`, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast, defaultParser),
            );
            ctx = resolveDescriptors(ctx, Ast);
            ctx = resolveStatements(ctx);
            ctx = resolveSignatures(ctx, Ast);
            evalComptimeExpressions(ctx, Ast);
            expect(getAllTypes(ctx)).toMatchSnapshot();
        });
    }
});
