contract TestContract {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;

    init() {
        self.intVal = 0;
        self.boolVal = false;
        self.addrVal = myAddress();
        self.strVal = "Hello";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
}
