contract WideTypes {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;

    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.intVal = 1;
        self.strVal = "s";
        self.boolVal = true;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();

        self.optInt = null;
        self.optStr = null;
        self.optBool = null;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
    }
}