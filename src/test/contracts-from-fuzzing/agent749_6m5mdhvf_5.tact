// Test large number of fields with multiple types
contract ManyFields {
    f1: Int = 1;
    f2: Int = 2;
    f3: Int = 3;
    f4: Int = 4;
    f5: Int = 5;
    f6: Bool = true;
    f7: Bool = false;
    f8: String = "a";
    f9: String = "b";
    f10: String = "c";
    f11: Int? = null;
    f12: Bool? = null;
    f13: String? = null;

    init() {
        self.f1 = 11;
        self.f2 = 12;
        self.f3 = 13;
        self.f4 = 14;
        self.f5 = 15;
        self.f6 = false;
        self.f7 = true;
        self.f8 = "A";
        self.f9 = "B";
        self.f10 = "C";
        self.f11 = 42;
        self.f12 = true;
        self.f13 = "zzz";
    }
}