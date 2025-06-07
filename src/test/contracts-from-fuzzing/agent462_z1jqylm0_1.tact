contract LargeVarietyContract {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addressVal: Address;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    optionalInt: Int?;
    optionalAddress: Address?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "test";
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = self.cellVal.asSlice();
        self.optionalInt = null;
        self.optionalAddress = null;
    }
}