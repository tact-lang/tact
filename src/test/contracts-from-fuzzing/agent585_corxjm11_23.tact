contract NullDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
