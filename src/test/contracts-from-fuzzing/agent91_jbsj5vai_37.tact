contract EdgeCaseDefaults {
    a: Int = 42;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;

    init() {
        self.a = 100;
        self.b = false;
        self.c = null;
        self.d = true;
    }
}
