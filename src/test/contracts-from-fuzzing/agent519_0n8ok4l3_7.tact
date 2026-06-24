contract ManyPrimitivesTest {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddr: Address?;
    optionalString: String?;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.stringField = "hi";
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalAddr = null;
        self.optionalString = null;
    }
}