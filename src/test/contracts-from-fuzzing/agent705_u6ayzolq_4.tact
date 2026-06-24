contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.intVal = 777;
        self.boolVal = true;
        self.addressVal = myAddress();
        self.stringVal = "hi";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}
