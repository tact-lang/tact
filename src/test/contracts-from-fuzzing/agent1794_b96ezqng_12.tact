contract OptionalsWithDefaults {
    a: Int? = null;
    b: String? = "default";
    c: Bool? = true;

    init() {
        self.a = 5;
        self.b = "changed";
        self.c = false;
    }
}