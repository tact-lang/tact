contract OrderingTest {
    f1: Int as uint8;
    f2: Int;
    f3: Int as uint64;
    f4: Int as int16;
    f5: Int as uint1;
    f6: Int;
    f7: Bool;

    init() {
        self.f1 = 42;
        self.f2 = 99;
        self.f3 = 10000;
        self.f4 = -1234;
        self.f5 = 1;
        self.f6 = -5000;
        self.f7 = true;
    }
}