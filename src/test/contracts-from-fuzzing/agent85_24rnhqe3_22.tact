contract ManyPrimitives {
    intVal: Int = 5;
    boolVal: Bool = true;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String = "hello";

    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
}