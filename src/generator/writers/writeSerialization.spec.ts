import { __DANGER_resetNodeId } from "../../grammar/ast";
import { CompilerContext } from "../../context";
import {
    getAllocation,
    resolveAllocations,
} from "../../storage/resolveAllocation";
import {
    getAllTypes,
    getType,
    resolveDescriptors,
} from "../../types/resolveDescriptors";
import { WriterContext } from "../Writer";
import { writeParser, writeSerializer } from "./writeSerialization";
import { writeStdlib } from "./writeStdlib";
import { openContext } from "../../grammar/store";
import { writeAccessors } from "./writeAccessors";

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
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (const s of ["A", "B", "C"]) {
        it("should write serializer for " + s, () => {
            let ctx = openContext(
                new CompilerContext(),
                [{ code, path: "<unknown>", origin: "user" }],
                [],
            );
            ctx = resolveDescriptors(ctx);
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
            for (const t of Object.values(getAllTypes(ctx))) {
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
