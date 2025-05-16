contract ComplexPersistent {
    // integers with serialization specs
    i8: Int as int8;
    u8: Int as uint8;
    coinsVal: Int as coins;

    // optional primitives
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddr: Address?;
    optBool: Bool?;

    // regular flags
    flag1: Bool;
    flag2: Bool;

    // nested struct
    nested: Nested;

    init() {
        self.i8 = 127;
        self.u8 = 255;
        self.coinsVal = ton("0.001");

        self.optStr = null;
        self.optCell = null;
        self.optSlice = null;
        self.optAddr = null;
        self.optBool = null;

        self.flag1 = false;
        self.flag2 = true;

        self.nested = Nested{ x: 1, y: 2 };
    }

    receive() {
        self.i8 = self.i8;
        self.u8 = self.u8;
        self.coinsVal = self.coinsVal;

        self.optStr = self.optStr;
        self.optCell = self.optCell;
        self.optSlice = self.optSlice;
        self.optAddr = self.optAddr;
        self.optBool = self.optBool;

        self.flag1 = self.flag1;
        self.flag2 = self.flag2;

        self.nested = self.nested;
    }
}

struct Nested {
    x: Int;
    y: Int;
}
