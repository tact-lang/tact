contract TestContract {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    stringVal: String;
    strOptVal: String?;
    intOptVal: Int?;
    boolOptVal: Bool?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.stringVal = "hello";
        self.strOptVal = null;
        self.intOptVal = null;
        self.boolOptVal = null;
    }
}