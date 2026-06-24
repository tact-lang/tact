contract TestContract {
    f1: Int as int8 = 5;
    f2: Int as uint8 = 250;
    f3: Int as int16 = -1234;
    f4: Int as uint16 = 43210;
    f5: Int as int32 = -12345678;
    f6: Int as uint32 = 4294967295;

    init() {
        self.f1 = 10;
        self.f2 = 100;
        self.f3 = -1000;
        self.f4 = 40000;
        self.f5 = -10000000;
        self.f6 = 123456789;
    }
}