struct Fields {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
}

contract VariousFields {
    payload: Fields;
    init() {
        self.payload = Fields{
            intField:1,
            boolField:true,
            addrField:myAddress(),
            cellField:emptyCell(),
            sliceField:emptyCell().asSlice(),
            stringField:"hello"
        };
    }
}