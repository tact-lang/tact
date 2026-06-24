contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address?;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    stringVal: String;

    init() {
        self.intVal = 0;
        self.boolVal = false;
        self.addrVal = null;
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
        self.stringVal = "";
    }
}