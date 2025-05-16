contract ManyTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.stringField = "hi";
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.builderField = beginCell();
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalAddress = null;
    }
}
