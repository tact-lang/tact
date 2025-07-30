struct PrimitiveFields {
    n: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    slice: Slice;
    builder: Builder;
}

contract TestContract {
    prim: PrimitiveFields;

    init() {
        self.prim = PrimitiveFields{
            n: 1,
            b: true,
            s: "abc",
            addr: myAddress(),
            c: emptyCell(),
            slice: emptyCell().asSlice(),
            builder: beginCell()
        };
    }
}