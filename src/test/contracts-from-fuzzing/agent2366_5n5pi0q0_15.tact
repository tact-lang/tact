contract DifferentSerializations {
    f1: Int as uint8;
    f2: Int as int16;
    f3: Int as uint32;
    f4: Int as int64;
    f5: Int as coins;

    init() {
        self.f1 = 1;
        self.f2 = -10;
        self.f3 = 10000;
        self.f4 = -1234567;
        self.f5 = 1000000000;
    }
}