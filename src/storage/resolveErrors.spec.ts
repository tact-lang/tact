import fs from "fs";
import { resolveDescriptors } from "@/types/resolveDescriptors";
import { openContext, parseModules } from "@/context/store";
import { resolveStatements } from "@/types/resolveStatements";
import { CompilerContext } from "@/context/context";
import { resolveSignatures } from "@/types/resolveSignatures";
import path from "path";
import { getParser } from "@/grammar";
import { getAstFactory } from "@/ast/ast-helpers";
import { stdlibPath } from "@/stdlib/path";
import type { Source } from "@/imports/source";
import { resolveErrors } from "@/types/resolveErrors";

const primitivesPath = path.join(stdlibPath, "/std/internal/primitives.tact");
const stdlib = fs.readFileSync(primitivesPath, "utf-8");

describe("resolveErrors", () => {
    it("should throw an error", () => {
        const src = `
trait BaseTrait {}

contract Test {
    get fun foo(cond: Bool, error: String) {
        require(cond, error);
    }
}
`;

        const expectedErrors = `<unknown>:6:23: The second parameter of "require()" must be evaluated at compile time
  5 |     get fun foo(cond: Bool, error: String) {
> 6 |         require(cond, error);
                            ^~~~~
  7 |     }
`;

        const ast = getAstFactory();
        const sources: Source[] = [
            { code: stdlib, path: primitivesPath, origin: "stdlib" },
            { code: src, path: "<unknown>", origin: "user" },
        ];
        let ctx = openContext(
            new CompilerContext(),
            sources,
            [],
            parseModules(sources, getParser(ast)),
        );
        ctx = resolveDescriptors(ctx, ast);
        ctx = resolveSignatures(ctx, ast);
        ctx = resolveStatements(ctx);
        expect(() => resolveErrors(ctx, ast)).toThrow(expectedErrors);
    });

    it("should throw on duplicate error code", () => {
        const src = `
trait BaseTrait {}

contract Test {
    get fun foo(): Int {
        require(false, "113");
        return 0;
    }

    get fun bar(): Int {
        require(false, "241");
        return 0;
    }
}
`;

        const expectedErrors = `<unknown>:11:24: Error message "241" maps to error code 38048, which is already assigned to "113", change the message to resolve this conflict
  10 |     get fun bar(): Int {
> 11 |         require(false, "241");
                              ^~~~~
  12 |         return 0;
`;

        const ast = getAstFactory();
        const sources: Source[] = [
            { code: stdlib, path: primitivesPath, origin: "stdlib" },
            { code: src, path: "<unknown>", origin: "user" },
        ];
        let ctx = openContext(
            new CompilerContext(),
            sources,
            [],
            parseModules(sources, getParser(ast)),
        );
        ctx = resolveDescriptors(ctx, ast);
        ctx = resolveSignatures(ctx, ast);
        ctx = resolveStatements(ctx);
        expect(() => resolveErrors(ctx, ast)).toThrow(expectedErrors);
    });
});
