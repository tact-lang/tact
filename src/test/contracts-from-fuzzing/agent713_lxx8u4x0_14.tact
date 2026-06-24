contract SimpleMixedInit {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.intVal = 4;
        self.boolVal = true;
        self.strVal = "hello";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}