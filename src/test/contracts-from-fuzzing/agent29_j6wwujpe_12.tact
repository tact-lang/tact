struct ComplexStruct {
    integer: Int;
    boolean: Bool;
    stringField: String;
    sliceField: Slice;
    cellField: Cell;
    addressField: Address;
}

contract ComplexFields {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            integer: 42,
            boolean: true,
            stringField: "hello",
            sliceField: "abc".asSlice(),
            cellField: "def".asComment(),
            addressField: myAddress()
        };
    }
}