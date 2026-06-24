contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    textVal: String;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.textVal = "hi";
    }
}
