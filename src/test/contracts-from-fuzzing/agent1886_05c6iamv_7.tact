struct ComplexTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;
}

contract TestComplexTypes {
    data: ComplexTypes;

    init() {
        self.data = ComplexTypes{
            intVal: 123,
            boolVal: true,
            stringVal: "hello",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addressVal: myAddress()
        };
    }
}