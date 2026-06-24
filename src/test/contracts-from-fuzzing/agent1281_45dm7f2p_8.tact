struct Level1 {
    a: Int;
}

contract LargePrimitiveFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Int?;
    f6: Bool?;
    f7: Address?;
    f8: String?;
    f9: Int;
    f10: Bool;
    f11: Address;
    f12: String;
    f13: Int?;
    f14: Bool?;
    f15: Address?;
    f16: String?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = myAddress();
        self.f4 = "a";
        self.f5 = null;
        self.f6 = null;
        self.f7 = null;
        self.f8 = null;
        self.f9 = 2;
        self.f10 = false;
        self.f11 = myAddress();
        self.f12 = "b";
        self.f13 = null;
        self.f14 = null;
        self.f15 = null;
        self.f16 = null;
    }
}