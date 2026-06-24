contract OptionalsWithDefaults {
    a: Int? = null;
    b: Bool? = null;

    init() {
        self.a = 5;
        self.b = true;
    }
}