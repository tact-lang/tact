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
            let wctx = new WriterContext(ctx);
            writeSerializer(s, getAllocation(ctx, s), wctx);
            writeParser(s, getAllocation(ctx, s), wctx);
            expect(wctx.render(true)).toMatchSnapshot();
        });
    }
});