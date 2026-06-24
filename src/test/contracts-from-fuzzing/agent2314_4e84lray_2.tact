struct ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    addressVal: Address;
    sliceVal: Slice;
}

contract TestAllPrimitiveFields {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            intVal: 7,
            boolVal: false,
            stringVal: "test",
            cellVal: emptyCell(),
            addressVal: myAddress(),
            sliceVal: emptyCell().asSlice()
        };
    }
}