struct PrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    addressVal: Address;
}

contract MixedPrimitives {
    data: PrimitiveFields;

    init() {
        self.data = PrimitiveFields{
            intVal: 1,
            boolVal: true,
            strVal: "test",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            addressVal: myAddress()
        };
    }
}