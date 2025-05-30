contract MultipleTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    addrVal: Address;
    optInt: Int?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "abc";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.addrVal = myAddress();
        self.optInt = null;
    }
}