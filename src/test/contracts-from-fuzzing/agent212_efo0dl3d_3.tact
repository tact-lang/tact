contract TestContract {
    intVal: Int = 123;
    boolVal: Bool = false;
    strVal: String = "init";

    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;

    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.intVal = 999;
        self.boolVal = true;
        self.strVal = "done";
    }
}