contract LongFieldList {
    f1: Int = 0;
    f2: Int = 0;
    f3: Int = 0;
    f4: Int = 0;
    f5: Int = 0;
    f6: Int = 0;
    f7: Int = 0;
    f8: Int = 0;
    f9: Int = 0;
    f10: Int = 0;
    f11: Int = 0;
    f12: Int = 0;
    f13: Int = 0;
    f14: Int = 0;
    f15: Int = 0;
    f16: Int = 0;
    f17: Int = 0;
    f18: Int = 0;
    f19: Int = 0;
    f20: Int = 0;

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
        self.f11=11;
        self.f12=12;
        self.f13=13;
        self.f14=14;
        self.f15=15;
        self.f16=16;
        self.f17=17;
        self.f18=18;
        self.f19=19;
        self.f20=20;
    }

    receive() {
        let _ = self.f20;
    }
}