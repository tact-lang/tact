contract ManyPrimitiveFields {
    intVal: Int = 0;
    intSmall: Int as int8 = -1;
    uintVal: Int as uint64 = 12345;
    boolVal: Bool = true;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String = "hello";
    optInt: Int? = null;
    optBool: Bool? = null;
    optAddr: Address? = null;
    optString: String? = null;

    init() {
        self.intVal = 42;
        self.intSmall = 10;
        self.uintVal = 999;
        self.boolVal = false;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
}
