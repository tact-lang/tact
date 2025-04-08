contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Slice? = null;
    e: Address? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}