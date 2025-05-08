contract AllPrimitives {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "primitive";
    }
}