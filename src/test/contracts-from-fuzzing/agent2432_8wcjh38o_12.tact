contract Test {
    val1: Int as int8;
    val2: Int as uint8;
    val3: Int as int16;
    val4: Int as uint16;
    val5: Int as int32;
    val6: Int as uint32;
    val7: Int as int64;
    val8: Int as uint64;
    init() {
        self.val1 = -128;
        self.val2 = 255;
        self.val3 = -32768;
        self.val4 = 65535;
        self.val5 = -2147483648;
        self.val6 = 4294967295;
        self.val7 = -9223372036854775808;
        self.val8 = 18446744073709551615;
    }
}