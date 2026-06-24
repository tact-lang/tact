contract ExplicitOptionalDefaults {
    i: Int? = null;
    b: Bool? = null;

    init() {
        self.i = 18;
        self.b = true;
    }
}
