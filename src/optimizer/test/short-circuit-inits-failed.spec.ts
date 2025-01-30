import { getAstFactory } from "../../ast/ast-helpers";
import { CompilerContext } from "../../context/context";
import { openContext } from "../../context/store";
import { getParser } from "../../grammar";
import { defaultParser } from "../../grammar/grammar";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { resolveSignatures } from "../../types/resolveSignatures";
import { resolveStatements } from "../../types/resolveStatements";
import { loadCases } from "../../utils/loadCases";

describe("short-circuit-initialization", () => {
    for (const r of loadCases(__dirname + "/failed/")) {
        it(`${r.name} should fail boolean short-circuiting during initialization`, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
                getParser(Ast, defaultParser),
            );
            expect(() => {
                ctx = resolveDescriptors(ctx, Ast);
                ctx = resolveStatements(ctx, Ast);
                ctx = resolveSignatures(ctx, Ast);
            }).toThrowErrorMatchingSnapshot();
        });
    }
});
