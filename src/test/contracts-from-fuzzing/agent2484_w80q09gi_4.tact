contract MultiplePrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    stringVal: String;

    init() {
        self.intVal = 0;
        self.boolVal = false;
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.stringVal = "";
    }
}