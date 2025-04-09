contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "test";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optAddr = null;
    }
}