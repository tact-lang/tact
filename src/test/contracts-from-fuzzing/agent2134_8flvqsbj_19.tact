struct ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract AllPrimitiveFields {
    val: ManyPrimitives;

    init() {
        self.val = ManyPrimitives{
            intVal: 123,
            boolVal: false,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "fulltest"
        };
    }
}