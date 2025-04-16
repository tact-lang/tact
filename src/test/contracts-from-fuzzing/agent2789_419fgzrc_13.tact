contract OptionalDefaults {
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;

    init() {
        self.oi = 5;
        self.ob = true;
        self.os = "hi";
    }
}
