contract ManyPrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    addrVal: Address;
    optionalInt: Int?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "test";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
        self.addrVal = myAddress();
        self.optionalInt = null;
    }
}
