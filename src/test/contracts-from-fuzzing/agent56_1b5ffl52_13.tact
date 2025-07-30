// Maximal test: contract with many primitive persistent fields
contract BigVars {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Bool;
    f12: Bool;
    f13: Bool;
    f14: Bool;
    f15: Bool;
    f16: Bool;
    f17: Bool;
    f18: Bool;
    f19: Bool;
    f20: Bool;

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
        self.f11 = true;
        self.f12 = false;
        self.f13 = true;
        self.f14 = false;
        self.f15 = true;
        self.f16 = false;
        self.f17 = true;
        self.f18 = false;
        self.f19 = true;
        self.f20 = false;
    }
}