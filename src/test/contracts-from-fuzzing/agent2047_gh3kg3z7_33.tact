contract OptionalFieldsWithDefaults {
    oi: Int? = 5;
    ob: Bool? = false;
    os: String? = "qwerty";

    init() {
        self.oi = null;
        self.ob = true;
        self.os = null;
    }
}