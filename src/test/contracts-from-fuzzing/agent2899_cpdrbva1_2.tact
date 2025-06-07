struct Combo {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
}

contract MixedFields {
    combined: Combo;

    init() {
        self.combined = Combo{
            intField: 5,
            boolField: true,
            addrField: myAddress(),
            stringField: "hi",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
        };
    }
}
