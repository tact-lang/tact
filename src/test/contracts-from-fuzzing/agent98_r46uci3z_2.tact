contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    addrVal: Address;
    stringVal: String;
    optIntVal: Int?;
    optBoolVal: Bool?;

    init() {
        self.intVal = -123;
        self.boolVal = true;
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
        self.addrVal = myAddress();
        self.stringVal = "hello";
        self.optIntVal = null;
        self.optBoolVal = null;
    }
}