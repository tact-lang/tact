contract PrimitivesInit {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.strVal = "hi";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.addrVal = myAddress();
    }
}