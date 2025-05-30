contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddress: Address?;
    optSlice: Slice?;
    optCell: Cell?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.stringVal = "test";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.addressVal = myAddress();

        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optAddress = null;
        self.optSlice = null;
        self.optCell = null;
    }
}
