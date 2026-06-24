contract SerializationTest {
    intField: Int as uint8;
    boolField: Bool;
    cellField: Cell;
    stringField: String;

    init() {
        self.intField = 100;
        self.boolField = true;
        self.cellField = emptyCell();
        self.stringField = "serialization";
    }
}