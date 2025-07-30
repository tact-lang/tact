contract ManyTypedFields {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    optionalIntField: Int?;
    optionalBoolField: Bool?;
    optionalStringField: String?;
    optionalAddressField: Address?;

    init() {
        self.intField = 10;
        self.boolField = false;
        self.stringField = "test";
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.optionalIntField = null;
        self.optionalBoolField = null;
        self.optionalStringField = null;
        self.optionalAddressField = null;
    }
}
