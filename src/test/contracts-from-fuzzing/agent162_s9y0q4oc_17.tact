contract AllOptionalWithDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
    d: Address? = null;

    init() {
        self.a = 123;
        self.b = "hi";
        self.c = false;
        self.d = null;
    }
}