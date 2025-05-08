struct HasAllPrimitive {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
}

contract PrimitivesInStruct {
    s: HasAllPrimitive;
    init() {
        self.s = HasAllPrimitive {
            intVal: 1,
            boolVal: true,
            addressVal: myAddress(),
            stringVal: "test",
            cellVal: beginCell().endCell(),
            sliceVal: beginCell().endCell().beginParse()
        };
    }
}