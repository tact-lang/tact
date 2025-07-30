contract ManyIntSizes {
    val8: Int as int8;
    val16: Int as uint16;
    val32: Int as int32;
    val64: Int as uint64;
    val128: Int as int128;

    init() {
        self.val8 = -128;
        self.val16 = 65535;
        self.val32 = -2147483648;
        self.val64 = 18446744073709551615;
        self.val128 = -170141183460469231731687303715884105728; // min int128
    }
}
