contract MixedTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;

    init() {
        self.intVal = 0;
        self.boolVal = false;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "";
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optAddr = null;
    }
}
