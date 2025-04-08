contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    strVal: String;

    init() {
        self.intVal = -123;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.strVal = "testing";
    }
}