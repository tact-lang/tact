contract MultipleTypes {
    intVal: Int;
    boolVal: Bool;
    optVal: Int?;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    builderVal: Builder;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.optVal = null;
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.stringVal = "hello";
        self.builderVal = beginCell();
    }
}