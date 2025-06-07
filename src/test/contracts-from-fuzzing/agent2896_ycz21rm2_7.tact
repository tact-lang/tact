contract MultipleTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.stringField = "hi";
        self.cellField = emptyCell();
    }
}