contract ManyPrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.stringVal = "test";
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.addressVal = myAddress();
    }
}