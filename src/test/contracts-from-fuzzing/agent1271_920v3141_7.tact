contract MixedTypes {
    intVal: Int;
    boolVal: Bool;
    sliceVal: Slice;
    cellVal: Cell;
    strVal: String;
    optInt: Int?;
    optStr: String?;
    optCell: Cell?;

    init() {
        self.intVal = 0;
        self.boolVal = false;
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.strVal = "";
        self.optInt = null;
        self.optStr = null;
        self.optCell = null;
    }
}