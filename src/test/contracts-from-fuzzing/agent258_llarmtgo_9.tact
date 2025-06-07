contract MultiTypeContract {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optString: String?;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.sliceVal = emptySlice();
        self.cellVal = emptyCell();
        self.strVal = "test";
        self.optInt = null;
        self.optBool = null;
        self.optAddress = null;
        self.optString = null;
    }
}