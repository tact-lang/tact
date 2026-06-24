struct MultiType {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    strField: String;
}

contract MultiTypeContract {
    data: MultiType;

    init() {
        self.data = MultiType{
            intField: 1,
            boolField: false,
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            strField: "test",
        };
    }
}