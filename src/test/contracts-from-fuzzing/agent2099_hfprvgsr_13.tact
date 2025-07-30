contract AllPrimitiveFieldsFixed {
    intVal: Int;
    boolVal: Bool;
    addr: Address;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addr = myAddress();
        self.strVal = "test";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
    }
}