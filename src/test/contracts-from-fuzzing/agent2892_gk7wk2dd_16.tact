contract LargeManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int?;
    f6: Bool?;
    f7: String?;
    f8: Address?;
    f9: Int;
    f10: Int?;
    f11: Bool;
    f12: Bool?;
    f13: String;
    f14: String?;
    f15: Address;
    f16: Address?;
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "a";
        self.f4 = myAddress();
        self.f5 = 2;
        self.f6 = false;
        self.f7 = null;
        self.f8 = null;
        self.f9 = 3;
        self.f10 = null;
        self.f11 = false;
        self.f12 = null;
        self.f13 = "b";
        self.f14 = null;
        self.f15 = myAddress();
        self.f16 = null;
    }
}