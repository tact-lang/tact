contract OptionDefaults {
    a: Int? = 42;
    b: String? = "hello";
    c: Bool? = false;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}