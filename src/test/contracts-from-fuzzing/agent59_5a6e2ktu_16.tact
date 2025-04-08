contract ExplicitDefaults {
    f1: Int = 1;
    f2: Bool = false;
    f3: String = "foo";
    f4: Int? = null;
    f5: String? = null;
    f6: Bool? = null;

    init() {
        self.f1 = 100;
        self.f2 = true;
        self.f3 = "bar";
        self.f4 = 4;
        self.f5 = "baz";
        self.f6 = true;
    }
}