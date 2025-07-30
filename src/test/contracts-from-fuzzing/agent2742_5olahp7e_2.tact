struct ComplexStruct {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optionalInt: Int?;
    optionalBool: Bool?;
}

contract ManyTypesContract {
    data: ComplexStruct;
    
    init() {
        self.data = ComplexStruct{
            intField: 1,
            boolField: true,
            addressField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            stringField: "hello",
            optionalInt: null,
            optionalBool: true,
        };
    }
}