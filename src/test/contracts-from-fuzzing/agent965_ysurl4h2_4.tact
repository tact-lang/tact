contract ManyPrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.strVal = "hi";
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
    }
}