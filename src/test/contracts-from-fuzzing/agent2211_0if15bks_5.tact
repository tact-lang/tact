contract PrimitiveTypesAssignInInit {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    strField: String;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.strField = "hello";
    }
}