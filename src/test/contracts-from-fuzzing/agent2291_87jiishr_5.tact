contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
    f11: Int; 
    f12: String;
    f13: Address;
    f14: Bool;
    f15: Int;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "a";
        self.f4 = myAddress();
        self.f5 = 2;
        self.f6 = false;
        self.f7 = "b";
        self.f8 = myAddress();
        self.f9 = 3;
        self.f10 = true;
        self.f11 = 4;
        self.f12 = "c";
        self.f13 = myAddress();
        self.f14 = false;
        self.f15 = 5;
    }
}
