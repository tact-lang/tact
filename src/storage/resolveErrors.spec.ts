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
import { step, attachment } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

const primitivesPath = path.join(stdlibPath, "/std/internal/primitives.tact");
const stdlib = fs.readFileSync(primitivesPath, "utf-8");

describe("resolveErrors", () => {
    it("should throw an error", async () => {
        const src = `
trait BaseTrait {}

contract Test {
    get fun foo(cond: Bool, error: String) {
        require(cond, error);
    }
}
`;

        await attachment("Code", src, ContentType.TEXT);

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
        await step("resolveErrors should throw expected error", () => {
            expect(() => resolveErrors(ctx, ast)).toThrow(expectedErrors);
        });
    });
});
