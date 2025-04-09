contract LongList {
    f1: Int = 1;
    f2: Int = 2;
    f3: Int = 3;
    f4: Int = 4;
    f5: Int = 5;
    f6: Int = 6;
    f7: Int = 7;
    f8: Int = 8;
    f9: Int = 9;
    f10: Int = 10;
    f11: Int = 11;
    f12: Int = 12;
    f13: Int = 13;
    f14: Int = 14;
    f15: Int = 15;
    f16: Int = 16;
    f17: Int = 17;
    f18: Int = 18;
    f19: Int = 19;
    f20: Int = 20;
    // To test large flat contract persistent state

    init() {
        self.f1 = 1; self.f2 = 2; self.f3 = 3; self.f4 =4; self.f5=5;
        self.f6=6; self.f7=7; self.f8=8; self.f9=9; self.f10=10;
        self.f11=11; self.f12=12; self.f13=13; self.f14=14; self.f15=15;
        self.f16=16; self.f17=17; self.f18=18; self.f19=19; self.f20=20;
    }
}