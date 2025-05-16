contract OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Cell? = null;
    d: Address? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}