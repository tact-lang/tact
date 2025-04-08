contract MixedFieldTypes {
    number: Int;
    flag: Bool;
    message: String;
    optionalVal: Int?;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    addr: Address;

    init() {
        self.number = 1;
        self.flag = true;
        self.message = "test";
        self.optionalVal = null;
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.builderField = beginCell();
        self.addr = myAddress();
    }
}