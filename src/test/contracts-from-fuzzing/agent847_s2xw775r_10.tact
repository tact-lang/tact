struct MixedFields {
    addressField: Address;
    boolField: Bool;
    intField: Int;
    stringField: String;
    sliceField: Slice;
    cellField: Cell;
}

contract MixedPersistentFields {
    storage: MixedFields;

    init() {
        self.storage = MixedFields{
            addressField: myAddress(),
            boolField: false,
            intField: 123,
            stringField: "hello",
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell()
        };
    }
}