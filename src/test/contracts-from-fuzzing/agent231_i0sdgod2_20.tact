// test struct with all primitive types as fields
struct AllPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
}

contract PrimPersists {
    state: AllPrimitives;

    init() {
        self.state = AllPrimitives{
            i:7,
            b:true,
            s:"hey",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell()
        };
    }
}