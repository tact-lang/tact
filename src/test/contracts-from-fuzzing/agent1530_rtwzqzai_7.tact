contract TestContract {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;

    init() {
        self.intVal = 123;
        self.strVal = "hello";
        self.boolVal = false;
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.addrVal = myAddress();
    }
}
