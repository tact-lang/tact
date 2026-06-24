contract IntSizes {
    f1: Int as uint1;
    f2: Int as uint4;
    f3: Int as uint8;
    f4: Int as int16;
    f5: Int as int32;
    f6: Int as int64;
    f7: Int as uint128;
    f8: Int as int257;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = 5;
        self.f6 = 6;
        self.f7 = 7;
        self.f8 = 8;
    }
}