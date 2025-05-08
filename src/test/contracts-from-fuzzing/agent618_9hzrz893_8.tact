contract OnlyNatives {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;

    init() {
        self.intVal = 7;
        self.boolVal = false;
        self.stringVal = "str";
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
    }
}