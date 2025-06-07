struct ComplexStruct {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    sliceField: Slice;
    cellField: Cell;
    stringField: String;
}

contract TestComplex {
    complex: ComplexStruct;

    init() {
        self.complex = ComplexStruct{
            intField: 42,
            boolField: true,
            addrField: myAddress(),
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
            stringField: "hello"
        };
    }
}