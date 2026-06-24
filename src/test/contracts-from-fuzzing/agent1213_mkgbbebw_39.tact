struct PrimStruct {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    strField: String;
    cellField: Cell;
    sliceField: Slice;
}

contract ManyPrimitives {
    s: PrimStruct;

    init() {
        self.s = PrimStruct {
            intField:1,
            boolField:true,
            addrField: myAddress(),
            strField: "hi",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
        };
    }
}