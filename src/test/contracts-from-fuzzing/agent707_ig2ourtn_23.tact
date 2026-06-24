contract BoolIntCellChain {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    intVal2: Int;
    boolVal2: Bool;
    cellVal2: Cell;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.cellVal = emptyCell();
        self.intVal2 = 2;
        self.boolVal2 = false;
        self.cellVal2 = emptyCell();
    }
}