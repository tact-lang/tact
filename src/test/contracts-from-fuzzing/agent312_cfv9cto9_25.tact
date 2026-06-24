contract TestContract {
    f1: Int as int64;
    f2: Int as uint32;
    f3: Int as int8;
    f4: Int as uint4;
    f5: Int as int1;
    init() {
        self.f1 = -123456789;
        self.f2 = 123456789;
        self.f3 = -12;
        self.f4 = 10;
        self.f5 = -1;
    }
}