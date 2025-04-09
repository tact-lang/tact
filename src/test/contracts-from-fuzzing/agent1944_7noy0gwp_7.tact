contract ManyPrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.stringVal = "str";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.addressVal = myAddress();
    }
}