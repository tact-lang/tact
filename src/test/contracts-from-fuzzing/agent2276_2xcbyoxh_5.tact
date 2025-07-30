contract ManyPrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    optInt: Int?;
    optStr: String?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "hi";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.builderVal = beginCell();
        self.optInt = null;
        self.optStr = null;
    }
}