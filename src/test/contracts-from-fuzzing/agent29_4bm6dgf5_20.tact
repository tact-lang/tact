struct ManyPrimitives {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
}

contract PrimitivesTest {
    f: ManyPrimitives;

    init() {
        self.f = ManyPrimitives{
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            stringField: "hello"
        };
    }
}