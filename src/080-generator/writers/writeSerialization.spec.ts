import { CompilerContext } from "../../010-pipeline/context";
import {
    getAllocation,
    resolveAllocations,
} from "../../060-types/resolveAllocation";
import {
    getAllTypes,
    getType,
    resolveDescriptors,
} from "../../060-types/resolveDescriptors";
import { WriterContext } from "../Writer";
import { writeParser, writeSerializer } from "./writeSerialization";
import { writeStdlib } from "./writeStdlib";
import { openContext } from "../../050-grammar/store";
import { writeAccessors } from "./writeAccessors";
import { getParser } from "../../050-grammar";
import { getAstFactory } from "../../050-grammar/ast";
import { defaultParser } from "../../050-grammar/grammar";

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
            let ctx = openContext(
                new CompilerContext(),
                [{ code, path: "<unknown>", origin: "user" }],
                [],
                getParser(ast, defaultParser),
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
            writeParser(
                getType(ctx, s).name,
                false,
                getAllocation(ctx, s),
                "user",
                wCtx,
            );
            const extracted = wCtx.extract(true);
            expect(extracted).toMatchSnapshot();
        });
    }
});
