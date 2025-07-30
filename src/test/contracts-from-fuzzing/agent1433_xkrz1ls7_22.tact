contract TestContract {
    f1: Int as int4 = 0;
    f2: Int as uint8 = 1;
    f3: Int as int16;
    f4: Int as uint32;
    f5: Int as int64;
    init() {
        self.f3 = 123;
        self.f4 = 456;
        self.f5 = 789;
    }
}