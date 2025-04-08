contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: Address? = null;

    init() {
        self.a = 5;
        self.b = false;
        self.c = null;
    }
}
