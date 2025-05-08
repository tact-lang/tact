contract WideTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.stringVal = "hello";
    }
}