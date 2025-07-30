contract MultiType {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;

    init() {
        self.intVal = 42;
        self.boolVal = false;
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.strVal = "hello";
    }

    receive() {
        let _ = self.intVal + 1;
    }
}
