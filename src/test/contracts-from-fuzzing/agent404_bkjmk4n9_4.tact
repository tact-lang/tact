contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;

    init() {
        self.intVal = -42;
        self.boolVal = true;
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.stringVal = "test";
    }
}