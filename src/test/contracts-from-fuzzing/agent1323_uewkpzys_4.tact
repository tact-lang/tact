contract LotsOfPrimitives {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;

    init() {
        self.intVal = 77;
        self.boolVal = true;
        self.stringVal = "hello";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
    }
}
