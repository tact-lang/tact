contract AllTypes {
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
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.intVal = 10;
        self.boolVal = false;
        self.strVal = "abc";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();

        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
    }
}