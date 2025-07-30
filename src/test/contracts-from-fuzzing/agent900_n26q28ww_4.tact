contract ManyFields {
    f1: Int = 1;
    f2: Int = 2;
    f3: Bool = true;
    f4: Bool = false;
    f5: Int? = null;
    f6: Int? = null;
    f7: Bool? = null;
    f8: Bool? = null;
    f9: Int = 9;
    f10: Int = 10;

    init() {
        self.f5 = 55;
        self.f6 = 66;
        self.f7 = true;
        self.f8 = false;
    }

    receive() {
        self.f1 += 1;
        self.f2 += 2;
    }
}