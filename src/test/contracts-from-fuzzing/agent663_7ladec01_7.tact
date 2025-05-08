struct FatStruct {
    f0: Int = 0;
    f1: Bool = false;
    f2: Int = 2;
    f3: Bool = true;
    f4: Int = 4;
    f5: Bool = false;
    f6: Int = 6;
    f7: Bool = true;
    f8: Int = 8;
    f9: Bool = false;
    f10: Int = 10;
    f11: Bool = true;
    f12: Int = 12;
    f13: Bool = false;
    f14: Int = 14;
    f15: Bool = true;
    f16: Int = 16;
    f17: Bool = false;
    f18: Int = 18;
    f19: Bool = true;
    f20: Int = 20;
    f21: Bool = false;
    f22: Int = 22;
    f23: Bool = true;
    f24: Int = 24;
    f25: Bool = false;
    f26: Int = 26;
    f27: Bool = true;
    f28: Int = 28;
    f29: Bool = false;
    f30: Int = 30;
    f31: Bool = true;
}

contract BigStructVar {
    big: FatStruct;

    init() {
        self.big = FatStruct{};
    }
}