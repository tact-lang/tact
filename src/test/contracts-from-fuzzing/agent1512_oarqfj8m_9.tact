struct MultiType {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;
}

contract TestContract {
    mt: MultiType;

    init() {
        self.mt = MultiType{
            intField: 1,
            boolField: true,
            stringField: "x",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            addressField: myAddress()
        };
    }
}