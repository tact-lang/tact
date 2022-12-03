import { CompilerContext } from "../../ast/context";
import { getAllocation, resolveAllocations } from "../../storage/resolveAllocation";
import { getType, resolveTypeDescriptors } from "../../types/resolveTypeDescriptors";
import { Writer, WriterContext } from "../Writer";
import { writeParser, writeSerializer } from "./writeSerialization";

const code = `
primitive Int;
primitive Bool;
primitive Builder;
primitive Cell;
primitive Slice;

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
}
`;

describe('writeSerialization', () => {
    for (let s of ['A', 'B', 'C']) {
        it('should write serializer for ' + s, () => {
            let ctx = CompilerContext.fromSources([code]);
            ctx = resolveTypeDescriptors(ctx);
            ctx = resolveAllocations(ctx);
            let w = new Writer();
            let wctx = new WriterContext();
            writeSerializer(ctx, s, getAllocation(ctx, s), w, wctx);
            writeParser(ctx, s, getAllocation(ctx, s), w, wctx);
            expect(w.end().toString()).toMatchSnapshot();
        });
    }
});