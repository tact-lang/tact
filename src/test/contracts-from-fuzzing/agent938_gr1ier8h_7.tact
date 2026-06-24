contract ManyPrimitives {
    intVal: Int = 0;
    boolVal: Bool = false;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    stringVal: String = "test";

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
        self.stringVal = "done";
    }
}
