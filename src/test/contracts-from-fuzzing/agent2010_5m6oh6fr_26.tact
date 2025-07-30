contract OptionWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    s: String? = "default";

    init() {
        self.a = 42;
        self.b = null;
        self.s = null;
    }
}