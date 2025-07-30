contract TestContract {
    intDef: Int;
    boolVal: Bool;
    u8: Int as uint8;
    i64: Int as int64;
    u256: Int as uint256;
    strVal: String;

    init() {
        self.intDef = -1;
        self.boolVal = true;
        self.u8 = 255;
        self.i64 = -123456789;
        self.u256 = 123456789012345678901234567890;
        self.strVal = "TON";
    }
}