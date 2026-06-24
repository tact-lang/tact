contract IntSerializations {
    val1: Int as uint4;
    val2: Int as uint8;
    val3: Int as int16;
    val4: Int as uint32;
    val5: Int as int64;
    val6: Int as int257;

    init() {
        self.val1 = 5;
        self.val2 = 10;
        self.val3 = -20;
        self.val4 = 100;
        self.val5 = -1000;
        self.val6 = 123456789;
    }
}
