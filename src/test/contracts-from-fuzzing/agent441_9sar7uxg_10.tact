contract TestContract {
    f1: Int as int8;
    f2: Int as uint8;
    f3: Int as int16;
    f4: Int as uint16;
    f5: Int as int32;
    f6: Int as uint32;
    f7: Int as int64;
    f8: Int as uint64;
    f9: Int as int128;
    f10: Int as uint128;
    f11: Int as int257;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = 5;
        self.f6 = 6;
        self.f7 = 7;
        self.f8 = 8;
        self.f9 = 9;
        self.f10 = 10;
        self.f11 = 11;
    }
}