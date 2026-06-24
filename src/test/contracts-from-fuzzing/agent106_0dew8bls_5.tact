contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    stringVal: String;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.stringVal = "hello";
    }

    receive() {
        self.intVal += 1;
    }
}