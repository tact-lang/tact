contract ComplexPrimitives {
    intVal: Int = 7;
    boolVal: Bool = true;
    addrVal: Address; 
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String = "hey";

    init() {
        self.intVal = 10;
        self.boolVal = false;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.stringVal = "hello";
    }
}
