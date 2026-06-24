contract MixedSerialTypes {
    int1: Int as uint1;
    int4: Int as uint4;
    int32: Int as int32;
    int64: Int as int64;
    addr: Address;
    cell: Cell;
    slice: Slice;
    str: String;
    optInt: Int?;
    optStr: String?;

    init() {
        self.int1 = 1;
        self.int4 = 15;
        self.int32 = -654321;
        self.int64 = 123456789123456;
        self.addr = myAddress();
        self.cell = emptyCell();
        self.slice = emptyCell().asSlice();
        self.str = "fuzz";
        self.optInt = null;
        self.optStr = null;
    }
}
