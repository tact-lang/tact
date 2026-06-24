struct ComplexStruct {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    addressVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract TestComplex {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            intVal: 1,
            boolVal: true,
            strVal: "hello",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            addressVal: myAddress(),
            optInt: null,
            optBool: null,
            optString: null
        };
    }
}
