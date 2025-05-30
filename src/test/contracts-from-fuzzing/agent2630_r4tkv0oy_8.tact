contract ManyPrimitiveTypes {
    intVal: Int;
    uintVal: Int as uint32;
    intNegVal: Int as int8;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;

    init() {
        self.intVal = 42;
        self.uintVal = 255;
        self.intNegVal = -10;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "string";
    }
}