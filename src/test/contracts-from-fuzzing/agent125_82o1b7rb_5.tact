contract MultiTypeVars {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    optIntVal: Int?;
    optBoolVal: Bool?;
    optAddrVal: Address?;
    optCellVal: Cell?;
    optSliceVal: Slice?;
    optStringVal: String?;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.stringVal = "hello";
        self.optIntVal = null;
        self.optBoolVal = null;
        self.optAddrVal = null;
        self.optCellVal = null;
        self.optSliceVal = null;
        self.optStringVal = null;
    }
}