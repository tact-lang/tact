contract ManyFields {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "s";
    f4: Int? = null;
    f5: Bool? = null;
    f6: String? = null;
    f7: Int = 7;
    f8: Bool = false;
    f9: String = "nine";
    f10: Int? = null;

    init() {
        self.f1 = 100;
        self.f2 = false;
        self.f3 = "changed";
        self.f4 = null;
        self.f5 = true;
        self.f6 = "opt";
        self.f7 = -7;
        self.f8 = true;
        self.f9 = "x";
        self.f10 = 10;
    }
}