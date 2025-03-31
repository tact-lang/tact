import { CompilerContext } from "@/context/context";
import { getAllocation, resolveAllocations } from "@/storage/resolveAllocation";
import {
    getAllTypes,
    getType,
    resolveDescriptors,
} from "@/types/resolveDescriptors";
import { WriterContext } from "@/generator/Writer";
import {
    writeParser,
    writeSerializer,
} from "@/generator/writers/writeSerialization";
import { writeStdlib } from "@/generator/writers/writeStdlib";
import { openContext, parseModules } from "@/context/store";
import { writeAccessors } from "@/generator/writers/writeAccessors";
import { getParser } from "@/grammar";
import { getAstFactory } from "@/ast/ast-helpers";
import type { Source } from "@/imports/source";

const code = `
primitive Int;
primitive Bool;
primitive Builder;
primitive Cell;
primitive Slice;
primitive Address;

struct A {
    a: Int;
    b: Int;
    c: Int?;
    d: Bool;
    e: Bool?;
    f: Int;
    g: Int;
}

struct B {
    a: Int;
    b: Int;
    c: Int?;
    d: Bool;
    e: Bool?;
    f: Int;
    g: Int;
}

struct C {
    a: Cell;
    b: Cell?;
    c: Slice?;
    d: Slice?;
    e: Bool;
    f: Int;
    g: Int;
    h: Address;
}
`;

describe("writeSerialization", () => {
    for (const s of ["A", "B", "C"]) {
        it("should write serializer for " + s, () => {
            const ast = getAstFactory();
            const sources: Source[] = [
                { code, path: "<unknown>", origin: "user" },
            ];
            let ctx = openContext(
                new CompilerContext(),
                sources,
                [],
                parseModules(sources, getParser(ast)),
            );
            ctx = resolveDescriptors(ctx, ast);
            ctx = resolveAllocations(ctx);
            const wCtx = new WriterContext(ctx, s);
            writeStdlib(wCtx);
            writeSerializer(
                getType(ctx, s).name,
                false,
                getAllocation(ctx, s),
                "user",
                wCtx,
            );
            for (const t of getAllTypes(ctx)) {
                if (t.kind === "contract" || t.kind === "struct") {
                    writeAccessors(t, "user", wCtx);
                }
            }
            const type = getType(ctx, s);
            writeParser(
                type,
                type.name,
                false,
                "with-opcode",
                getAllocation(ctx, s),
                wCtx,
            );
            const extracted = wCtx.extract(true);
            expect(extracted).toMatchSnapshot();
        });
    }
});
