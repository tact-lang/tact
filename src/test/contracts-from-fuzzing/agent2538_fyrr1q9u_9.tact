contract BigPrimitiveSet {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    addrVal: Address;

    init() {
        self.intVal = 10;
        self.boolVal = true;
        self.stringVal = "hi";
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
        self.addrVal = myAddress();
    }
}