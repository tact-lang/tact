import { CompilerContext } from "../../context/context";
import { resolveAllocations } from "../../storage/resolveAllocation";
import {
    getAllTypes,
    resolveDescriptors,
} from "../../types/resolveDescriptors";
import { WriterContext } from "../Writer";
import { writeStdlib } from "./writeStdlib";
import { openContext } from "../../context/store";
import { getParser } from "../../grammar";
import { getAstFactory } from "../../ast/ast-helpers";
import { defaultParser } from "../../grammar/grammar";
import { writeFunction } from "./writeFunction";

const code = `
primitive Int;

trait BaseTrait {}

asm mutates extends fun withoutArgument(self: Int) { NOP }
asm mutates extends fun withArgument(self: Int, arg: Int) { DROP }
asm mutates extends fun withSeveralArguments(self: Int, arg: Int, arg2: Int) { DROP DROP }

contract Test {
    value: Int = 0;

    init(a: Int) {
        self.value = a;
        self.value.withoutArgument();
        self.value.withArgument(10);
        self.value.withSeveralArguments(10, 20);
    }
}
`;

describe("write-non-mutating-function", () => {
    it("should correctly add parameters to call of not_mut function", () => {
        const ast = getAstFactory();
        let ctx = openContext(
            new CompilerContext(),
            [{ code: code, path: "<unknown>", origin: "user" }],
            [],
            getParser(ast, defaultParser),
        );
        ctx = resolveDescriptors(ctx, ast);
        ctx = resolveAllocations(ctx);
        const wCtx = new WriterContext(ctx, "test");
        writeStdlib(wCtx);
        for (const t of getAllTypes(ctx)) {
            if (t.kind === "primitive_type_decl") {
                for (const [_, f] of t.functions) {
                    writeFunction(f, wCtx);
                }
            }
        }
        const extracted = wCtx.extract(true);
        expect(extracted).toMatchSnapshot();
    });
});
