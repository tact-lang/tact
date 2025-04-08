contract VariedTypes {
    intField: Int;
    boolField: Bool;
    textField: String;
    cellField: Cell;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.textField = "hello";
        self.cellField = emptyCell();
    }
}
