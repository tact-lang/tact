contract LargePrimitives {
    val1: Int as uint8;
    val2: Int as int16;
    val3: Int as uint32;
    val4: Int as int64;
    val5: Int as uint128;
    val6: Int; // default is int257

    init() {
        self.val1 = 1;
        self.val2 = 2;
        self.val3 = 3;
        self.val4 = 4;
        self.val5 = 5;
        self.val6 = 6;
    }
}