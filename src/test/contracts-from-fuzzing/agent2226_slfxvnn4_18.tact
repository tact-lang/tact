contract SerializationTest {
    largeInt: Int as uint64;
    smallInt: Int as uint8;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    
    init() {
        self.largeInt = 123456789;
        self.smallInt = 255;
        self.boolVal = true;
        self.strVal = "serialize";
        self.cellVal = emptyCell();
    }
}