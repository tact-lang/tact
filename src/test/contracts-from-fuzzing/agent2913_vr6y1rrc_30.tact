struct UnusualOrder {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addrField: Address;
    sliceField: Slice;
    cellField: Cell;
}

contract OrderingCheck {
    val1: UnusualOrder;
    val2: UnusualOrder;

    init() {
        self.val1 = UnusualOrder{
            intField: 1,
            boolField: true,
            stringField: "alpha",
            addrField: myAddress(),
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
        };

        self.val2 = UnusualOrder{
            intField: 2,
            boolField: false,
            stringField: "beta",
            addrField: myAddress(),
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
        };
    }
}