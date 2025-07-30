struct ComplexStruct {
    intField: Int;
    boolField: Bool;
    cellField: Cell;
    addrField: Address;
    sliceField: Slice;
    strField: String;
}

contract BigFields {
    field1: ComplexStruct;
    field2: ComplexStruct;

    init() {
        self.field1 = ComplexStruct{
            intField: 1, boolField: true, cellField: emptyCell(),
            addrField: myAddress(), sliceField: emptyCell().asSlice(), strField: "s1"
        };
        self.field2 = ComplexStruct{
            intField: 2, boolField: false, cellField: emptyCell(),
            addrField: myAddress(), sliceField: emptyCell().asSlice(), strField: "s2"
        };
    }
}
