contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.stringVal = "hello";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
}