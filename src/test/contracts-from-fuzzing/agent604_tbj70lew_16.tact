contract PrimitivesAsStorage {
    intVal: Int = 42;
    boolVal: Bool = true;
    strVal: String = "test";
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;

    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
    receive() {
        let _ = self.intVal;
    }
}