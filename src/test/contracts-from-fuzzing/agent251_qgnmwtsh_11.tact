contract MultiPrimitive {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.intVal = 7;
        self.boolVal = true;
        self.strVal = "hey";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.builderVal = beginCell();
    }
}