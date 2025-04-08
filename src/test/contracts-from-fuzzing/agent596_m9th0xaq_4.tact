struct MultiTypes {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    stringField: String;
}

contract MultiTypeStorage {
    mt: MultiTypes;

    init() {
        self.mt = MultiTypes{
            intField: 1,
            boolField: true,
            addressField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            builderField: beginCell(),
            stringField: "test"
        };
    }
}