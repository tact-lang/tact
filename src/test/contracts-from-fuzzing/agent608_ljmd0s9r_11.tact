struct AllPrimitiveStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
}

contract StructPrimitivePersistent {
    s: AllPrimitiveStruct;

    init() {
        self.s = AllPrimitiveStruct{
            a: 2,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress()
        };
    }
}
