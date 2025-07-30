contract MixedPrimitiveFields {
    num: Int;
    flag: Bool;
    addr: Address;
    cellField: Cell;
    sliceField: Slice;
    strField: String;

    init() {
        self.num = 0;
        self.flag = false;
        self.addr = myAddress();
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.strField = "hello";
    }
}