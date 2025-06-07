struct DifferentTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
}

contract AllTypeFields {
    dt: DifferentTypes;

    init() {
        self.dt = DifferentTypes{
            intField: 1,
            boolField: true,
            stringField: "s",
            addressField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice()
        };
    }

    receive() {
        let _ = self.dt.sliceField;
    }
}