contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    optInt: Int?;
    optStr: String?;
    optAddr: Address?;

    init() {
        self.intVal = 5;
        self.boolVal = true;
        self.strVal = "hello";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.builderVal = beginCell();
        self.optInt = null;
        self.optStr = null;
        self.optAddr = null;
    }
}
