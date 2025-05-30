contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: Address?;
    f7: String;
    f8: Int;
    f9: Bool;
    f10: Int?;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "a";
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
        self.f7 = "b";
        self.f8 = 8;
        self.f9 = true;
        self.f10 = 10;
    }
}