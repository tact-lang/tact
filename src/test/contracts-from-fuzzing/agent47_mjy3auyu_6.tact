contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Int;
    f6: Bool;
    f7: Address;
    f8: String;
    f9: Int;
    f10: Bool;
    f11: Address;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: Address;
    f16: String;
    f17: Int;
    f18: Bool;
    f19: Address;
    f20: String;
    init() {
        self.f1 = 1; self.f2 = true; self.f3 = myAddress(); self.f4 = "a";
        self.f5 = 2; self.f6 = false; self.f7 = myAddress(); self.f8 = "b";
        self.f9 = 3; self.f10 = true; self.f11 = myAddress(); self.f12 = "c";
        self.f13 = 4; self.f14 = false; self.f15 = myAddress(); self.f16 = "d";
        self.f17 = 5; self.f18 = true; self.f19 = myAddress(); self.f20 = "e";
    }
}