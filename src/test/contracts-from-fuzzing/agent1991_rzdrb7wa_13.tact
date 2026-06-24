struct ComplexFields {
    intVal: Int;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract LargeMixedStruct {
    field: ComplexFields;

    init() {
        self.field = ComplexFields{
            intVal: 1,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "hello",
            optInt: null,
            optBool: null,
            optString: null
        };
    }
}