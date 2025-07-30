struct Mixed {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    strField: String;
}

contract Test {
    data: Mixed;
    init() {
        self.data = Mixed{
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            strField: "hi"
        };
    }
}