contract MultiplePrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    stringVal: String;

    init() {
        self.intVal = 123;
        self.boolVal = false;
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
        self.stringVal = "Hi";
    }
}