contract Test {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;

    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.stringVal = "tact";
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optAddress = null;
        self.optCell = null;
        self.optSlice = null;
    }
}