contract OptionalsWithDefaults {
    a: Int? = 5;
    b: String? = "abc";
    c: Bool? = true;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}