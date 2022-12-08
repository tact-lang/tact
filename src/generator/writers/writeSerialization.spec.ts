import { __DANGER_resetNodeId } from "../../grammar/ast";
import { CompilerContext } from "../../context";
import { getAllocation, resolveAllocations } from "../../storage/resolveAllocation";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { WriterContext } from "../Writer";
import { writeParser, writeSerializer } from "./writeSerialization";
import { writeStdlib } from "./writeStdlib";
import { openContext } from "../../grammar/store";

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

describe('writeSerialization', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (let s of ['A', 'B', 'C']) {
        it('should write serializer for ' + s, () => {
            let ctx = openContext([code]);
            ctx = resolveDescriptors(ctx);
            ctx = resolveAllocations(ctx);
            let wctx = new WriterContext(ctx);
            writeStdlib(wctx);
            writeSerializer(s, getAllocation(ctx, s), wctx);
            writeParser(s, getAllocation(ctx, s), wctx);
            expect(wctx.render(true)).toMatchSnapshot();
        });
    }
});