contract PrimitiveFields {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;

    init() {
        self.intVal = 42;
        self.strVal = "test";
        self.boolVal = true;
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.addressVal = myAddress();
    }
}
