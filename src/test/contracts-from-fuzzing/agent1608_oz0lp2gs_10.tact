contract InitOnly {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.intVal = -77;
        self.boolVal = true;
        self.stringVal = "yo";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}