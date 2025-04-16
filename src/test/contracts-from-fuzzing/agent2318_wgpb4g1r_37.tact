contract OptionalsMix {
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;

    init() {
        self.oi = 101;
        self.ob = true;
        self.os = "found";
    }
}
