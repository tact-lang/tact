// Extreme contract with large number of persistent primitive variables
contract TestContract {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: String;
    f5: Bool;
    f6: String;
    f7: Bool;
    f8: String;
    f9: Int;
    f10: Bool;
    f11: String;
    f12: Int;
    f13: Bool;
    f14: Int;
    f15: Bool;
    f16: String;
    f17: String;
    f18: Int;
    f19: Bool;
    f20: Int;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = "a";
        self.f5 = true;
        self.f6 = "b";
        self.f7 = false;
        self.f8 = "c";
        self.f9 = 9;
        self.f10 = true;
        self.f11 = "d";
        self.f12 = 12;
        self.f13 = false;
        self.f14 = 14;
        self.f15 = true;
        self.f16 = "e";
        self.f17 = "f";
        self.f18 = 18;
        self.f19 = false;
        self.f20 = 20;
    }
}