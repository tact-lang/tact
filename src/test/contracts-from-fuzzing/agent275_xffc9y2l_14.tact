contract ManyPrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.intVal = 0;
        self.boolVal = false;
        self.stringVal = "";
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.builderVal = beginCell();
    }
}