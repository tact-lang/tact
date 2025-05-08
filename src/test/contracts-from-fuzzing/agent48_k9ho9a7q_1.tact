contract ManyPrimitives {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
    stringField: String;
    optIntField: Int?;
    mapField: map<Int, Int>;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.builderField = beginCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "";
        self.optIntField = null;
        self.mapField = emptyMap();
    }

    receive() {}
}