contract Test5 {
    bigInt: Int as int257;
    smallInt: Int as int8;
    uInt: Int as uint32;
    boolVal: Bool;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
    optInt: Int?;
    optAddr: Address?;

    init() {
        self.bigInt = 123456789;
        self.smallInt = 127;
        self.uInt = 9999;
        self.boolVal = true;
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "foo";
        self.optInt = null;
        self.optAddr = null;
    }

    receive() {}
}