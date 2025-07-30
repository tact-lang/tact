contract WideVariety {
    i1: Int;
    i2: Int as int64;
    i3: Int as uint64;
    i4: Int as int16;
    i5: Int as uint8;
    bl: Bool;
    str: String;
    cl: Cell;
    sl: Slice;
    addr: Address;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.i4 = 4;
        self.i5 = 5;
        self.bl = true;
        self.str = "hi";
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = myAddress();
        self.optInt = null;
        self.optBool = null;
    }
}