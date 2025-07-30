struct AllTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
}

contract AllPrimitivesTest {
    data: AllTypes;

    init() {
        self.data = AllTypes {
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            stringField: "Hello"
        };
    }
}