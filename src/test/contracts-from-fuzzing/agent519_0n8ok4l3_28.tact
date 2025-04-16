contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int as uint4;
    f8: Int as int16;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "x";
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
        self.f7 = 7;
        self.f8 = -8;
    }
}