struct ManyPrims {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
}

contract StructManyPrimsTest {
    data: ManyPrims;
    init() {
        self.data = ManyPrims{
            intField: 5,
            boolField: true,
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            stringField: "hi"
        };
    }
}
