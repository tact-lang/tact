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
    var a: Int;
    var b: Int;
    var c: Int?;
    var d: Bool;
    var e: Bool?;
    var f: Int;
    var g: Int;
}

struct B {
    var a: Int;
    var b: Int;
    var c: Int?;
    var d: Bool;
    var e: Bool?;
    var f: Int;
    var g: Int;
}

struct C {
    var a: Cell;
    var b: Cell?;
    var c: Slice?;
    var d: Slice?;
    var e: Bool;
    var f: Int;
    var g: Int;
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