contract LargeVarTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "hi";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
}