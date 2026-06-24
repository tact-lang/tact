contract OnlyPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;

    init() {
        self.intVal = 0;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.strVal = "";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
    }
}
