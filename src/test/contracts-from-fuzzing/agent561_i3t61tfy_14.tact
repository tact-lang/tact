contract JustDefaults {
    f1: Int = 10;
    f2: Bool = false;
    f3: String = "abc";
    f4: Int? = null;
    f5: String? = null;

    init() {
        self.f1 = 20;
        self.f2 = true;
        self.f3 = "xyz";
        self.f4 = null;
        self.f5 = null;
    }
}