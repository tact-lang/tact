contract MultipleTypes {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;
    init() {
        self.intVal = 5;
        self.boolVal = true;
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.stringVal = "Hello";
        self.optInt = null;
        self.optBool = false;
        self.optAddress = null;
        self.optCell = null;
        self.optSlice = null;
        self.optString = "World";
    }
}
