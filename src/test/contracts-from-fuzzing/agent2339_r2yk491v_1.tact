contract MultiplePrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.strVal = "hello";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.builderVal = beginCell();
    }
}
