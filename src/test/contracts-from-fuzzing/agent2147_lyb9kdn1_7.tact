contract DiverseWithInit {
    intVal: Int;
    boolVal: Bool = false;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;
    stringVal: String = "abc";

    init() {
        self.intVal = 12;
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.addrVal = myAddress();
    }
}