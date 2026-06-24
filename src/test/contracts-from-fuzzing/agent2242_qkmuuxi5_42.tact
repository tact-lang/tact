contract AllOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
    }
}