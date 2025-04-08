// Optionals with defaults set explicitly on contract fields
contract OptDefaults {
    a: Int? = 7;
    b: Bool? = null;
    s: String? = "string";

    init() {
        self.a = null;
        self.b = true;
        self.s = null;
    }
}
