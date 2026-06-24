contract MixedFields {
    intVal: Int;
    boolVal: Bool;
    optStr: String?;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;
    intOpt: Int?;

    init() {
        self.intVal = 5;
        self.boolVal = true;
        self.optStr = null;
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.strVal = "test";
        self.intOpt = null;
    }
}