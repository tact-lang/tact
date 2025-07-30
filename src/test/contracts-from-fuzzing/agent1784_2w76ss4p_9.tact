contract MultiTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "hi";
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.optInt = null;
        self.optBool = false;
    }
}