struct MixedTypes {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    strField: String;
}

contract TestContract {
    mixed: MixedTypes;

    init() {
        self.mixed = MixedTypes{
            intField: 1,
            boolField: true,
            addressField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            strField: "test",
        };
    }
}