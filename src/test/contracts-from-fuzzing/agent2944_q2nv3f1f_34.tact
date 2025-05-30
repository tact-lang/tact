contract OptionDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = 11;
        self.b = true;
        self.c = "something";
    }
}