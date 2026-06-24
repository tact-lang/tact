contract FullPrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    addressVal: Address;
    stringVal: String;
    optInt: Int?;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
        self.addressVal = myAddress();
        self.stringVal = "hello";
        self.optInt = null;
    }
}