contract TestManyTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "test";
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
        self.optString = null;
    }
}