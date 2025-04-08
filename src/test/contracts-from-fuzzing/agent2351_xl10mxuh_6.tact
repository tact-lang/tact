contract ManyPrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;

    init() {
        self.intVal = 0;
        self.boolVal = false;
        self.stringVal = "";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
    }
}
