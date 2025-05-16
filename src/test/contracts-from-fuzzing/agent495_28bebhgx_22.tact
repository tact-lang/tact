contract FlagsAndInts {
    flag1: Bool;
    flag2: Bool;
    val1: Int as uint8;
    val2: Int as uint16;
    val3: Int as uint32;
    val4: Int as uint64;
    val5: Int as uint128;

    init() {
        self.flag1 = true;
        self.flag2 = false;
        self.val1 = 1;
        self.val2 = 2;
        self.val3 = 3;
        self.val4 = 4;
        self.val5 = 5;
    }
}
