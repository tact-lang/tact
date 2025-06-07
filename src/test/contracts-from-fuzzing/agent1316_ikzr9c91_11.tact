struct MaxPrims {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    sliceField: Slice;
    cellField: Cell;
    builderField: Builder;
    stringField: String;
}

contract MaxPrimsContract {
    dat: MaxPrims;

    init() {
        self.dat = MaxPrims{
            intField: 1,
            boolField: false,
            addrField: myAddress(),
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
            builderField: beginCell(),
            stringField: "abc",
        };
    }
}