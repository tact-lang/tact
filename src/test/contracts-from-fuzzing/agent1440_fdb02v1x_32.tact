contract ManyOptionalBools {
    f1: Bool? = null; f2: Bool? = true; f3: Bool? = null;
    f4: Bool? = false; f5: Bool? = null; f6: Bool? = true;
    f7: Bool? = null; f8: Bool? = false; f9: Bool? = null;
    f10: Bool? = true;

    init() {
        self.f1 = true; self.f2 = null; self.f3 = false;
        self.f4 = null; self.f5 = true; self.f6 = null;
        self.f7 = false; self.f8 = null; self.f9 = true;
        self.f10 = null;
    }
}