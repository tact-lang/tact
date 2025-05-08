struct Compose {
    intField: Int;
    boolField: Bool;
    sliceField: Slice;
    cellField: Cell;
    addrField: Address;
    strField: String;
}

contract FullPrimitiveStorage {
    s: Compose;

    init() {
        self.s = Compose{
            intField: 1,
            boolField: true,
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
            addrField: myAddress(),
            strField: "abc"
        };
    }
}