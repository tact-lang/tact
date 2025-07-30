contract ManyFieldsManyTypes {
    intField: Int;
    boolField: Bool;
    strField: String;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "abc";
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.builderField = beginCell();
        self.optInt = null;
        self.optBool = false;
    }
}