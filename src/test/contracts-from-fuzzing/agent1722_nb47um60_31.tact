contract BoolOptDefaults {
    a: Bool? = null;
    b: Bool? = true;
    c: Bool? = false;
    d: Bool?;

    init() {
        self.a = false;
        self.b = null;
        self.c = true;
        self.d = null;
    }
}