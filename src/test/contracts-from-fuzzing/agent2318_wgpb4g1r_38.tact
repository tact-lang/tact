contract OptionalSerialized {
    oi: Int? as int64 = null;
    ob: Bool? = null;
    os: String? = null;

    init() {
        self.oi = 64;
        self.ob = true;
        self.os = "ser";
    }
}
