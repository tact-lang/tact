contract ManyPrimitiveTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.stringVal = "test";
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
    }
}
