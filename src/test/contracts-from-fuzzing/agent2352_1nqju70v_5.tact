contract DiversePrimitives {
    intVal: Int;
    optInt: Int?;
    boolVal: Bool;
    optBool: Bool?;
    addrVal: Address;
    optAddr: Address?;
    cellVal: Cell;
    optCell: Cell?;
    sliceVal: Slice;
    optSlice: Slice?;
    strVal: String;
    optStr: String?;

    init() {
        self.intVal = 42;
        self.optInt = null;
        self.boolVal = true;
        self.optBool = false;
        self.addrVal = myAddress();
        self.optAddr = null;
        self.cellVal = emptyCell();
        self.optCell = null;
        self.sliceVal = emptyCell().asSlice();
        self.optSlice = null;
        self.strVal = "str";
        self.optStr = "opt";
    }
}