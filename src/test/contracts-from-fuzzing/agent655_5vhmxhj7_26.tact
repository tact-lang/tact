contract NullDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = false;
    }
}