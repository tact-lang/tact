contract BasicPrimitives {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;

    init() {
        self.intVal = 100;
        self.boolVal = true;
        self.addressVal = myAddress();
        self.stringVal = "hi";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
}