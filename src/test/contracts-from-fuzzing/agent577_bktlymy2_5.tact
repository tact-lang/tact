contract WideVariety {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    optStr: String?;

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.strVal = "hi";
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optSlice = null;
        self.optCell = null;
        self.optStr = null;
    }
}
