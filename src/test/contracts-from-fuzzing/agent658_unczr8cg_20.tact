contract OptionalDefaults {
    oi: Int? = null;
    ob: Bool? = null;

    init() {
        self.oi = 42;
        self.ob = true;
    }
}