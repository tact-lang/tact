struct AllPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract PrimitivesPersisted {
    data: AllPrimitives;

    init() {
        self.data = AllPrimitives{
            intVal: 42,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "hi",
        };
    }
}