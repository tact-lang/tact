contract ManyPrimitiveFields {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    stringField: String;
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addressField = myAddress();
        self.stringField = "hi";
        self.cellField = emptyCell();
        self.builderField = beginCell();
        self.sliceField = emptyCell().asSlice();
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalAddress = null;
    }
}