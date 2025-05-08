contract OptionalsWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "str";

    init() {
        self.a = 10;
        self.b = false;
        self.c = null;
    }
}