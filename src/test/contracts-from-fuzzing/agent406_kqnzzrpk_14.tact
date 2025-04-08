contract MaxPrimitiveTypes {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
    addrVal: Address;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "max";
        self.addrVal = myAddress();
    }
}