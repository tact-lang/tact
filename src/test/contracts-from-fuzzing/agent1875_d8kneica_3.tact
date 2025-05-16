contract FuzzManyTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    optStr: String?;

    init() {
        self.intField = -42;
        self.boolField = true;
        self.addrField = sender();
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.stringField = "fuzz";
        self.optionalInt = 100;
        self.optionalBool = true;
        self.optStr = "hello";
    }
}
