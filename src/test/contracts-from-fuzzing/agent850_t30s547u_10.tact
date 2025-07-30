contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    stringVal: String;
    addrVal: Address;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
        self.stringVal = "hello";
        self.addrVal = myAddress();
    }
}