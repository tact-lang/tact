struct AllTypes {
    intField: Int;
    boolField: Bool;
    strField: String;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
}

contract DiverseFields {
    payload: AllTypes;
    init() {
        self.payload = AllTypes{
            intField: 42,
            boolField: true,
            strField: "hi",
            addressField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            builderField: beginCell()
        };
    }
}