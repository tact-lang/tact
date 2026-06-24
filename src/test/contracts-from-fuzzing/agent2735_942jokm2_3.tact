struct Tiny {
    flag: Bool;
}

contract LotsOfFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Bool;
    f10: String;
    f11: Tiny;
    f12: Tiny?;
    f13: Int;
    f14: Bool;
    f15: String;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = 5;
        self.f6 = 6;
        self.f7 = 7;
        self.f8 = 8;
        self.f9 = false;
        self.f10 = "test";
        self.f11 = Tiny{ flag: true };
        self.f12 = null;
        self.f13 = 13;
        self.f14 = true;
        self.f15 = "done";
    }
}
