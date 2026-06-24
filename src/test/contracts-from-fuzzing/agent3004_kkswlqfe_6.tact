contract VariousPrimitives {
    intVal: Int = 5;
    boolVal: Bool = true;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String = "hey";

    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
}