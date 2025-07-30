contract Test {
    val1: Int as uint8 = 1;    // 0..255
    val2: Int as int16 = -100; // -32768..32767
    val3: Int as uint32 = 100000; // 0..4294967295
    val4: Int as int64 = -5000000000; // large negative
    val5: Int as uint64 = 10000000000; // large positive

    init() {
        self.val1 = 2;
        self.val2 = -200;
        self.val3 = 200000;
        self.val4 = -6000000000;
        self.val5 = 20000000000;
    }
}
