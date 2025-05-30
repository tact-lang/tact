contract AllTypes {
    intVal: Int = 5;
    boolVal: Bool = true;
    stringVal: String = "abc";
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;
    optAddr: Address? = null;
    optCell: Cell? = null;
    optSlice: Slice? = null;

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.stringVal = "def";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
    }
}