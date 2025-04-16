struct Primitives {
    intF: Int;
    boolF: Bool;
    stringF: String;
    addressF: Address;
    cellF: Cell;
    sliceF: Slice;
}

contract TestPrimitives {
    f: Primitives;
    init() {
        self.f = Primitives{
            intF: 10,
            boolF: true,
            stringF: "Hello",
            addressF: myAddress(),
            cellF: emptyCell(),
            sliceF: emptyCell().asSlice()
        };
    }
}