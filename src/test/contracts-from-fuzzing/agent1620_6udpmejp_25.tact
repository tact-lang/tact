contract OptionalDefaults {
    s: String? = null;
    b: Bool? = true;
    i: Int? = 55;

    init() {
        self.s = "init";
        self.b = null;
        self.i = null;
    }
}