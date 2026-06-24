contract ManyPrimitiveFields {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: Int;
    f6: Bool;
    f7: Int?;
    f8: Bool?;

    init() {
        self.f1 = 1;
        self.f2 = null;
        self.f3 = true;
        self.f4 = false;
        self.f5 = 99;
        self.f6 = false;
        self.f7 = -10;
        self.f8 = null;
    }
}