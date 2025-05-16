contract AllTypes {
    intVal: Int;
    boolVal: Bool;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    optInt: Int?;
    stringVal: String;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.optInt = null;
        self.stringVal = "test";
    }
}