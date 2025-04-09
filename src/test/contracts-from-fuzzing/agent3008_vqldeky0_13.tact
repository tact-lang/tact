contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intVal = 5;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
        self.strVal = "ok";
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}