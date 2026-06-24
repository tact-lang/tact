contract LargeContract {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Address;
    f9: Int?;
    f10: Bool?;
    f11: String?;
    f12: Address?;
    f13: Int;
    f14: Bool;
    f15: String;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "a";
        self.f4 = myAddress();
        self.f5 = 2;
        self.f6 = true;
        self.f7 = "b";
        self.f8 = myAddress();
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
        self.f13 = 3;
        self.f14 = false;
        self.f15 = "c";
    }
}