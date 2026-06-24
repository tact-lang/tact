struct PrimitiveStruct {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
    sl: Slice;
}

contract AllPrimitiveFields {
    prims: PrimitiveStruct;

    init() {
        self.prims = PrimitiveStruct{
            i: 42,
            b: true,
            a: myAddress(),
            s: "test",
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}