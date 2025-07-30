contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.stringVal = "a";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.addressVal = myAddress();
    }
}