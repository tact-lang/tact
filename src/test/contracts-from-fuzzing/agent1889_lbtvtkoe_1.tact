contract TestContract {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.stringVal = "test";
    }
}