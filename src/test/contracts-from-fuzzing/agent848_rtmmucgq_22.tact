contract ManyFields {
    f1: Int = 1;
    f2: Bool = false;
    f3: String = "a";
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int = 7;
    f8: Bool = true;
    f9: String = "b";
    f10: Int?;

    init() {
        self.f4 = null;
        self.f5 = true;
        self.f6 = "x";
        self.f10 = 10;
    }
}