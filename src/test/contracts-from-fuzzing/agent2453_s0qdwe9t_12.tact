contract OptionalNullDefaults {
    f1: Int? = null;
    f2: Bool? = null;
    f3: String? = null;
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "x";
    }
}