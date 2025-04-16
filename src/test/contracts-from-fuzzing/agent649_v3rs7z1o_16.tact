contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    strVal: String;
    optStr: String?;
    cellVal: Cell;
    optCell: Cell?;
    sliceVal: Slice;
    optSlice: Slice?;
    addressVal: Address;
    optAddress: Address?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.optInt = null;
        self.optBool = null;
        self.strVal = "abc";
        self.optStr = null;
        self.cellVal = emptyCell();
        self.optCell = null;
        self.sliceVal = emptyCell().asSlice();
        self.optSlice = null;
        self.addressVal = myAddress();
        self.optAddress = null;
    }
}