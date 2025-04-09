contract Test {
    val1: Int as uint4;
    val2: Int as int8;
    val3: Int as uint16;
    val4: Int as int32;
    val5: Int as uint64;

    init() {
        self.val1 = 15;
        self.val2 = -128;
        self.val3 = 65535;
        self.val4 = -2147483648;
        self.val5 = 18446744073709551615;
    }
}
