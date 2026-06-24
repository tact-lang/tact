contract ManyFields {
    intVal: Int;
    boolVal: Bool;
    optVal: Int?;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.optVal = null;
        self.strVal = "test";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}
