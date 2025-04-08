// Lots of persistent fields of primitive types
contract Test {
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
    f11: String;
    f12: Address;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Address;
    f17: Int;
    f18: Bool;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "";
        self.f4 = myAddress();
        self.f5 = 2;
        self.f6 = true;
        self.f7 = "a";
        self.f8 = myAddress();
        self.f9 = 3;
        self.f10 = false;
        self.f11 = "b";
        self.f12 = myAddress();
        self.f13 = 4;
        self.f14 = true;
        self.f15 = "c";
        self.f16 = myAddress();
        self.f17 = 5;
        self.f18 = false;
    }
}
