contract LargeDefaults {
    f1: Int = 1; f2: Bool = false; f3: String = "a";
    f4: Int? = null; f5: Bool? = null; f6: String? = null;
    f7: Int = 2; f8: Bool = true; f9: String = "b";
    f10: Int? = null; f11: Bool? = null; f12: String? = null;

    init() {
        self.f1 = 10; self.f2 = true; self.f3 = "A";
        self.f4 = 100; self.f5 = false; self.f6 = "X";
        self.f7 = 20; self.f8 = false; self.f9 = "B";
        self.f10 = 200; self.f11 = true; self.f12 = "Y";
    }
}